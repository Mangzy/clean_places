import 'package:get/get.dart';
import 'package:shoescleaningapp/app/modules/home/bindings/home_binding.dart';
import 'package:shoescleaningapp/app/modules/home/views/home_view.dart';
import 'package:shoescleaningapp/app/modules/sepatu_page/bindings/sepatu_binding.dart';
import 'package:shoescleaningapp/app/modules/sepatu_page/views/sepatu_view.dart';
import 'package:shoescleaningapp/app/modules/toko/bindings/toko_binding.dart';
import 'package:shoescleaningapp/app/modules/toko/views/toko_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
        name: _Paths.sepatu,
        page: () => const SepatuView(),
        binding: SepatuBinding()),
    GetPage(
      name: _Paths.toko,
      page: () => TokoView(),
      binding: TokoBinding(),
    ),
  ];
}
