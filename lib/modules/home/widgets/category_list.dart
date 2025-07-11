import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:libris/core/provider/provider.dart';
import 'package:libris/core/theme/colors.dart';
import 'package:libris/core/utils/extension/ref.dart';
import 'package:libris/router/router.dart';
import 'package:libris/shared/widgets/widgets.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  static const int maxItem = 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.select(appProvider, (s) => s.categories);
    final viewType = ref.select(homeProvider, (s) => s.categoryViewType);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ),
              // list , grid icon
              InkWell(
                onTap: () {
                  ref.read(homeProvider.notifier).changeCategoryViewType(0);
                },
                child: Icon(
                  Symbols.list,
                  color: viewType == 0 ? primaryColor : greyLightColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: () {
                  ref.read(homeProvider.notifier).changeCategoryViewType(1);
                },
                child: Icon(
                  Symbols.grid_view,
                  color: viewType == 1 ? primaryColor : greyLightColor,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: viewType == 0 ? 60 : 100,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemCount: categories.length > maxItem
                ? maxItem
                : categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              // add see all button if last item
              if (index == maxItem - 1) {
                return GestureDetector(
                  onTap: () => context.pushNamed(Routes.categoryList),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Center(
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                );
              }
              return viewType == 0
                  ? CategoryListTile(
                      title: category.name,
                      onTap: () {
                        context.pushNamed(
                          Routes.categoryDetails,
                          pathParameters: {
                            'id': category.id.toString(),
                          },
                        );
                      },
                    )
                  : CategoryCard(
                      title: category.name,
                      onTap: () {
                        context.pushNamed(
                          Routes.categoryDetails,
                          pathParameters: {
                            'id': category.id.toString(),
                          },
                        );
                      },
                    );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8);
            },
          ),
        ),
      ],
    );
  }
}
