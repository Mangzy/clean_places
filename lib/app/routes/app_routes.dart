part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const sepatuPage = _Paths.sepatu;
  static const tokoPage = _Paths.toko;
  static const detailTokoPage = _Paths.detailToko;
}

abstract class _Paths {
  static const home = '/home';
  static const sepatu = '/sepatu';
  static const toko = '/toko';
  static const detailToko = '/detail-toko';
}
