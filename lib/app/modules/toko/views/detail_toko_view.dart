import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shoescleaningapp/app/constants/themes.dart';
import 'package:shoescleaningapp/app/modules/toko/controllers/toko_controller.dart';

class DetailTokoView extends GetView<TokoController> {
  const DetailTokoView({Key? key, required this.jenis}) : super(key: key);

  final dynamic jenis;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Themes.backgroundColor,
      body: Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  _imageContent(),
                  _titleContent(),
                  _attribute(),
                  _deskripsi(),
                  _penilaian(),
                  SizedBox(
                      height: 10
                          .h), // Padding tambahan agar konten tidak tertutup oleh Container di bawah
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5.h,
            left: 0,
            right: 0,
            child: Container(
              width: Get.width,
              height: 8.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              decoration: const BoxDecoration(
                color: Themes.primaryColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Menempatkan teks di tengah
                    children: [
                      Text(
                        'Pesan Sekarang',
                        style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        jenis['harga'],
                        style: GoogleFonts.roboto(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Pesan',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        color: Themes.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 5.h,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  onPressed: () {
                    Get.back();
                  },
                ),
                Text(
                  'Kembali ke Toko',
                  style: GoogleFonts.roboto(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          jenis['image'],
          width: Get.width,
          height: 30.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _titleContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                jenis['harga'],
                style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                jenis['type'],
                style: GoogleFonts.roboto(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: Themes.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Hubungi Kami',
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _attribute() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 18,
                ),
                SizedBox(width: 1.w),
                Text(
                  jenis['rating'],
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 12.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
              // add icon favorite with style border width 1
              icon: Obx(
                () => Icon(
                  controller.isFavorite.value
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color:
                      controller.isFavorite.value ? Colors.red : Colors.black,
                  size: 30,
                ),
              ),
              onPressed: () {
                controller.isFavorite.value = !controller.isFavorite.value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _deskripsi() {
    return Container(
      height: 25.h,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 4.h,
            margin: EdgeInsets.symmetric(horizontal: 2.w),
            decoration: const BoxDecoration(
              color: Themes.secondaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 2.w),
                Text(
                  'Deskripsi',
                  style: GoogleFonts.roboto(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 15,
                ),
                SizedBox(width: 2.w),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Text(
              jenis['penjelasan'],
              style: GoogleFonts.roboto(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _penilaian() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Container(
        height: 6.h,
        margin: EdgeInsets.symmetric(horizontal: 2.w),
        decoration: const BoxDecoration(
          color: Themes.secondaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 2.w),
            Text(
              'Penilaian',
              style: GoogleFonts.roboto(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(width: 2.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 18,
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    jenis['rating'],
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
              size: 15,
            ),
            SizedBox(width: 2.w),
          ],
        ),
      ),
    );
  }
}
