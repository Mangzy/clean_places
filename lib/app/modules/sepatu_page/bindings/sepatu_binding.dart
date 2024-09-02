import 'package:get/get.dart';
import 'package:shoescleaningapp/app/modules/sepatu_page/controllers/sepatu_controller.dart';

class SepatuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SepatuController>(
      () => SepatuController(),
    );
  }
}
