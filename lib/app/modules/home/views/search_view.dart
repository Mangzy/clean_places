import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shoescleaningapp/app/constants/themes.dart';
import 'package:shoescleaningapp/app/modules/home/controllers/home_controller.dart';
import 'package:shoescleaningapp/app/routes/app_pages.dart';

class SearchView extends GetView<HomeController> {
  const SearchView({Key? key, required this.city}) : super(key: key);

  final Map<String, String> city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Themes.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(height: 8.h),
          _topBar(),
          SizedBox(height: 2.h),
          Expanded(
            child: _content(), // Memastikan konten mengisi ruang yang tersedia
          ),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          alignment: Alignment.centerLeft,
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        Expanded(
          child: _buildSearchBox(),
        ),
      ],
    );
  }

  Widget _content() {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Container(
        width: Get.width,
        color: Colors.white,
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 3.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Histori Penelusuran"),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icon/location.png",
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          controller.listKota[0]['detail']!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icon/location.png",
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          controller.listKota[1]['detail']!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icon/location.png",
                          width: 50,
                          height: 50,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          controller.listKota[2]['detail']!,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 3.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Rekomendasi Toko"),
                    SizedBox(height: 2.h),
                    Container(
                      padding: EdgeInsets.only(left: 3.w, right: 3.w),
                      child: ListView.builder(
                        itemCount: controller.listToko.length,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(
                                Routes.tokoPage,
                                arguments: {
                                  'id': '1',
                                  'title': 'Shoes and Care Jakarta',
                                  'assets': 'assets/toko/shoes-and-care.jpg',
                                  'alamat':
                                      'Jl. Kebon Jeruk, Kec. Kebon Jeruk, Jakarta Barat',
                                  'jam': 'Buka hingga 21.00',
                                  'rating': '4.8',
                                  'about':
                                      'Shoes and Care Jakarta adalah tempat terbaik untuk merawat sepatu Anda dengan layanan cuci, perbaikan, dan poles sepatu yang dikerjakan oleh tenaga ahli berpengalaman. Kami menggunakan bahan dan teknik terbaik untuk memastikan sepatu Anda kembali seperti baru.',
                                  'jenis': [
                                    {
                                      'type': 'Deep Clean',
                                      'image': 'assets/shoes/deep_clean.jpg',
                                      'penjelasan':
                                          'Layanan pembersihan menyeluruh untuk sepatu Anda, termasuk bagian dalam dan luar, menggunakan teknik dan bahan premium.',
                                      'harga': 'Rp 100.000',
                                      'rating': '4.7'
                                    },
                                    {
                                      'type': 'Fast Clean',
                                      'image': 'assets/shoes/fast_clean.jpg',
                                      'penjelasan':
                                          'Layanan pembersihan cepat untuk sepatu Anda dalam waktu kurang dari 1 jam. Cocok untuk Anda yang membutuhkan hasil cepat dengan kualitas tetap terjaga.',
                                      'harga': 'Rp 50.000',
                                      'rating': '4.2'
                                    },
                                    {
                                      'type': 'Repair Shoes',
                                      'image': 'assets/shoes/repair-shoes.jpg',
                                      'penjelasan':
                                          'Layanan perbaikan sepatu, mulai dari sol yang rusak hingga ganti bahan, dengan jaminan kualitas terbaik.',
                                      'harga': 'Rp 150.000',
                                      'rating': '3.0'
                                    },
                                    {
                                      'type': 'Polishing Shoes',
                                      'image': 'assets/shoes/polish-shoes.jpg',
                                      'penjelasan':
                                          'Layanan poles sepatu untuk membuat sepatu Anda tampak mengkilap dan seperti baru kembali.',
                                      'harga': 'Rp 70.000',
                                      'rating': '2.5'
                                    },
                                    {
                                      'type': 'Odor Removal',
                                      'image': 'assets/shoes/remove-odor.jpeg',
                                      'penjelasan':
                                          'Layanan penghilangan bau tak sedap dari sepatu dengan bahan anti-bakteri dan penghilang bau khusus.',
                                      'harga': 'Rp 80.000',
                                      'rating': '1.8'
                                    }
                                  ]
                                },
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 3.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          controller.recommendationData[0]
                                              ['image']!,
                                          // responsive image
                                          width: 30.w,
                                          height: 30.w,
                                        ),
                                      ),
                                      Positioned(
                                        top: 1.h,
                                        right: 1.h,
                                        child: Container(
                                          padding: EdgeInsets.all(1.w),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.yellow,
                                                size: 14,
                                              ),
                                              Text(
                                                controller.listToko[index]
                                                    ['rating']!,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 3.w),
                                  Flexible(
                                    fit: FlexFit
                                        .tight, // Menggunakan Flexible untuk membatasi teks
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.listToko[index]['title']!,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontFamily:
                                                GoogleFonts.roboto().fontFamily,
                                          ),
                                        ),
                                        SizedBox(height: 1.h),
                                        Text(
                                          controller.listToko[index]['alamat']!,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                GoogleFonts.roboto().fontFamily,
                                          ),
                                        ),
                                        SizedBox(height: 1.h),
                                        Text(
                                          controller.listToko[index]['jam']!,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                GoogleFonts.roboto().fontFamily,
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
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBox() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.only(left: 3.w, right: 3.w, bottom: 4.h),
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
        child: Container(
          padding: EdgeInsets.only(left: 3.w, right: 3.w),
          alignment: Alignment.centerLeft,
          child: Text(
            city['detail']!,
            textAlign: TextAlign.left,
            style: GoogleFonts.roboto(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ),
      ),
    );
  }
}
