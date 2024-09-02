import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoescleaningapp/app/constants/themes.dart';

class TokoController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final Rx<Color> iconContainerColor = Colors.transparent.obs;
  final isFavorite = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.offset > 100) {
        iconContainerColor.value = Themes.primaryColor;
      } else {
        iconContainerColor.value = Colors.transparent;
      }
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
