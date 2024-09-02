import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shoescleaningapp/app/constants/themes.dart';
import 'package:shoescleaningapp/app/modules/sepatu_page/controllers/sepatu_controller.dart';
import 'package:shoescleaningapp/app/routes/app_pages.dart';

class SepatuView extends GetView<SepatuController> {
  const SepatuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller.scrollController,
            physics: const ClampingScrollPhysics(),
            child: Stack(
              children: [
                Column(
                  children: [
                    _buildHeader(context),
                    _buildContent(context),
                  ],
                ),
                Positioned(
                  top: 25.h,
                  child: _buildSearchBox(),
                ),
              ],
            ),
          ),
          Obx(() => Positioned(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300), // Durasi animasi
                  width: Get.width,
                  color: controller.iconContainerColor
                      .value, // Mengubah warna berdasarkan scroll
                  padding: EdgeInsets.only(top: 6.h, left: 3.w),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.black,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Themes.primaryColor,
      height: 30.h,
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          SizedBox(height: 4.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Sepatu",
              style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              "Layanan untuk sepatu anda",
              style: GoogleFonts.roboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      width: Get.width,
      color: Themes.backgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Menggunakan ruang minimal
          children: [
            SizedBox(height: 3.h),
            Text(
              "Rekomendasi Jasa Cuci Sepatu",
              style: GoogleFonts.roboto(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(height: 3.h),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listToko.length,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.w,
                mainAxisSpacing: 4.h,
                mainAxisExtent: 30.h,
              ),
              itemBuilder: (context, index) {
                final toko = controller.listToko[index];
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.tokoPage, arguments: toko);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                toko['assets']!,
                                width: 40.w,
                                height: 40.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 2.w, vertical: 0.5.h),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 15,
                                  ),
                                  Text(
                                    toko['rating']!,
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15.sp,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        toko['title']!,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: 17.sp,
                            color: Colors.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        toko['jam']!,
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                            color: Colors.black),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(height: 3.h),
          ],
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
                  offset: const Offset(0, 3),
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
