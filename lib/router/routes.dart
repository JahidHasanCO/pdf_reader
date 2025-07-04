part of 'router.dart';

sealed class Routes {
  static const onboard = 'onboard';
  static const bottomNavigation = 'bottom_navigation';
  static const pdfAdd = 'pdf_add';
  static const pdfRead = 'pdf_read';
}

extension AsPathExt on String {
  String get asPath => '/$this';
}
