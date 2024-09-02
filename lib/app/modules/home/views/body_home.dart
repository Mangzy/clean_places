import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoescleaningapp/app/modules/home/controllers/home_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shoescleaningapp/app/routes/app_pages.dart';

class BodyHome extends GetView<HomeController> {
  const BodyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          _content(),
          SizedBox(height: 2.h),
          _recomendation(controller.recommendationData),
          SizedBox(height: 2.h),
        ],
      ),
    );
  }

  Widget _content() {
    return SizedBox(
        width: Get.width,
        height: 32.h,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 3.w),
          // create border radius for container
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: _contentView(),
        ));
  }

  Widget _contentView() {
    return Column(
      children: [
        _rowOfTitles(controller.titleImageList1, controller.titleList1),
        SizedBox(height: 2.h),
        _rowOfTitles(controller.titleImageList2, controller.titleList2),
      ],
    );
  }

  Widget _rowOfTitles(List<String> titleImageList, List<String> titleList) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        titleImageList.length,
        (index) => _contentTitle(titleImageList[index], titleList[index]),
      ),
    );
  }

  Widget _contentTitle(String assetImage, String title) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.sepatuPage);
      },
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 3.h,
            ),
            padding: EdgeInsets.all(1.w),
            width: 12.w,
            height: 12.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(1.w),
              child: Image.asset(
                assetImage,
                width: 7.w,
                height: 7.w,
              ),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            title,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget _title(String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Align(
        alignment: Alignment.topLeft,
        child: AutoSizeText(
          title,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: Colors.black),
          maxLines: 1,
        ),
      ),
    );
  }

  Widget _recomendation(List<Map<String, String>> recomendation) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 3.w,
        vertical: 1.h,
      ),
      padding: EdgeInsets.only(bottom: 3.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 2.h),
          _title("Rekomendasi untuk Anda"),
          SizedBox(height: 2.h),
          SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
              ),
              itemCount: recomendation.length,
              itemBuilder: (context, index) {
                return _recomendationItem(recomendation[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _recomendationItem(Map<String, String> data) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: _recomendationCard(data),
      ),
    );
  }

  Widget _recomendationCard(Map<String, String> data) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        height: 100,
        child: Column(children: [
          _recomendationPicture(data),
          _recomendationName(data),
        ]),
      ),
    );
  }

  Widget _recomendationPicture(Map<String, String> data) {
    return Expanded(
      child: ClipRRect(
        child: Image.asset(
          data['image']!,
          width: 50.h,
          height: 50.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _recomendationName(Map<String, String> data) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: AutoSizeText(
        maxLines: 2,
        "${data['title']}",
        style: GoogleFonts.roboto(
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          color: Colors.black,
        ),
      ),
    );
  }
}
