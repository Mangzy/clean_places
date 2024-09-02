import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shoescleaningapp/app/constants/themes.dart';
import 'package:shoescleaningapp/app/modules/toko/controllers/toko_controller.dart';
import 'package:shoescleaningapp/app/modules/toko/views/detail_toko_view.dart';

class TokoView extends GetView<TokoController> {
  TokoView({Key? key}) : super(key: key);

  final toko = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Themes.backgroundColor,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller
                .scrollController, // Hubungkan controller dengan ScrollView
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                _header(),
                _about(),
                _content(),
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

  Widget _header() {
    return Stack(
      children: [
        SizedBox(
          width: Get.width,
          height: Get.height * 0.3,
          child: Image.asset(
            "assets/banner/banner-toko.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 13.h,
          left: 2.w,
          right: 2.w,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    toko['assets']!,
                    width: 20.w,
                    height: 20.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      toko['title']!,
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      toko['alamat']!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Container(
                      width: 15.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.5.h),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15.sp,
                          ),
                          SizedBox(width: 0.5.w),
                          Text(
                            toko['rating']!,
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _about() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(5.w),
      decoration: const BoxDecoration(
        color: Themes.secondaryColor,
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tentang Kami",
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            toko['about']!,
            style: GoogleFonts.roboto(
              color: Colors.black,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _content() {
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: toko['jenis'].length,
        itemBuilder: (context, index) {
          final jenis = toko['jenis'][index];
          return InkWell(
            onTap: () {
              Get.to(() => DetailTokoView(jenis: jenis));
            },
            child: Padding(
              padding: EdgeInsets.only(bottom: 3.h),
              child: Row(
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
                            jenis['image']!,
                            width: 30.w,
                            height: 30.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 8.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 0.5.h),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15.sp,
                              ),
                              SizedBox(width: 0.5.w),
                              Text(
                                jenis['rating']!,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          jenis['type']!,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          jenis['penjelasan']!,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          jenis['harga']!,
                          style: GoogleFonts.roboto(
                            color: Colors.green,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
