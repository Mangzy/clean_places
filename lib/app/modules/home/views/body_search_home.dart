import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoescleaningapp/app/modules/home/controllers/home_controller.dart';
import 'package:shoescleaningapp/app/modules/home/views/search_view.dart';

class BodySearchHome extends GetView<HomeController> {
  const BodySearchHome({Key? key, required this.query}) : super(key: key);

  final Rx<String> query;

  @override
  Widget build(BuildContext context) {
    // Panggil onSearch setiap kali query berubah
    query.listen((value) {
      controller.onSearch(value);
    });

    return Obx(() {
      if (controller.searchResults.value.isEmpty) {
        return Center(
          child: Text(
            "No results found for '${query.value}'",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: controller.searchResults.value.length,
        itemBuilder: (context, index) {
          final city = controller.searchResults.value[index];
          return ListTile(
            leading: Image.asset(
              "assets/icon/location.png",
              width: 50,
              height: 50,
            ),
            title: Text(
              city['title']!,
              style: const TextStyle(fontSize: 14),
            ),
            subtitle: Text(
              city['detail']!,
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
            onTap: () {
              controller.search.text = city['title']!;
              Get.to(() => SearchView(
                    city: city,
                  ));
            },
          );
        },
      );
    });
  }
}
