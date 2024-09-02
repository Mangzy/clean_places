import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoescleaningapp/app/constants/themes.dart';
import 'package:shoescleaningapp/app/modules/home/controllers/home_controller.dart';
import 'package:shoescleaningapp/app/modules/home/views/body_home.dart';
import 'package:shoescleaningapp/app/modules/home/views/body_search_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Obx(() {
                  if (controller.searchKey.value.isEmpty) {
                    return _carousel();
                  } else {
                    return SizedBox(height: 10.h);
                  }
                }),
                Expanded(
                  child: Obx(() {
                    return controller.searchKey.value.isEmpty
                        ? const BodyHome()
                        : BodySearchHome(query: controller.searchKey);
                  }),
                ),
              ],
            ),
            // Positioned with Obx
            Obx(() {
              if (controller.searchKey.value.isEmpty) {
                return Positioned(
                  top: 27.h,
                  child: _buildSearchBox(),
                );
              } else {
                return Positioned(
                  top: 1.h,
                  child: _buildSearchBox(),
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _carousel() {
    return SizedBox(width: Get.width, height: 30.h, child: _swiper());
  }

  Widget _swiper() {
    return Swiper(
      itemBuilder: (context, index) {
        return _swiperItem(index);
      },
      itemCount: controller.bannerList.length,
      pagination: const SwiperPagination(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(bottom: 25),
        builder: DotSwiperPaginationBuilder(
          size: 8,
          activeSize: 8,
          activeColor: Colors.white,
          color: Colors.grey,
        ),
      ),
      autoplay: true,
      loop: true,
    );
  }

  Widget _swiperItem(int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(controller.bannerList[index]),
              fit: BoxFit.cover),
          color: Themes.backgroundColor,
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Obx(() {
      return AnimatedPadding(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.only(
          top: controller.searchKey.value.isEmpty ? 0.h : 0.h,
        ),
        child: Container(
          height: 10.h,
          width: Get.width,
          padding: EdgeInsets.only(left: 3.w, right: 3.w, bottom: 4.h),
          margin: EdgeInsets.only(bottom: 2.h),
          child: Container(
            height: 6.h,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: _searchForm(),
          ),
        ),
      );
    });
  }

  Widget _searchForm() {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 5.w, top: 1.h),
        border: InputBorder.none,
        hintText: "Cari Lokasi...",
        hintStyle: GoogleFonts.roboto(
            fontSize: 16.sp, fontWeight: FontWeight.w800, color: Colors.grey),
        suffixIconConstraints: const BoxConstraints(
          maxWidth: 70,
        ),
        suffixIcon: controller.search.text.isNotEmpty
            ? GestureDetector(
                onTap: () {
                  controller.search.clear();
                  controller.searchKey.value = "";
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 5.w, top: 1.h),
                  child: const Icon(
                    Icons.clear,
                    color: Colors.grey,
                  ),
                ),
              )
            : Padding(
                padding: EdgeInsets.only(right: 5.w, top: 1.h),
                child: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
        alignLabelWithHint: true,
      ),
      style: GoogleFonts.roboto(
          fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.black),
      controller: controller.search,
    );
  }
}
