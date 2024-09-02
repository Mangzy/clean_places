import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<String> bannerList = [
    "assets/banner/banner1.png",
  ];

  List<String> titleImageList1 = [
    "assets/icon/shoes.png",
    "assets/icon/laundry.png",
    "assets/icon/garden.png",
    "assets/icon/motor.png",
  ];

  List<String> titleList1 = [
    "Sepatu",
    "Laundry",
    "Taman",
    "Motor",
  ];

  List<String> titleImageList2 = [
    "assets/icon/mobil.png",
    "assets/icon/rumah.png",
    "assets/icon/helm.png",
    "assets/icon/toko.png",
  ];

  List<String> titleList2 = [
    "Mobil",
    "Rumah",
    "Helm",
    "Toko",
  ];

  final List<Map<String, String>> recommendationData = [
    {
      'image': 'assets/recomendation/shoes_recomendation.png',
      'title': 'Shining Back Your Shoes By Hilangnoda.id',
    },
    {
      'image': 'assets/recomendation/laundry_recomendation.png',
      'title': 'Plus an EXTRA 20K IDR OFF on New Year',
    },
    {
      'image': 'assets/recomendation/shoes_recomendation.png',
      'title': 'Shining Back Your Shoes By Hilangnoda.id',
    },
    {
      'image': 'assets/recomendation/laundry_recomendation.png',
      'title': 'Plus an EXTRA 20K IDR OFF on New Year',
    },
  ];

  final List<Map<String, String>> listToko = [
    {
      'title': 'Shoes and Care Rembang',
      'alamat': 'Jl. Raya Rembang - Lasem, Kec. Rembang, Kab. Rembang',
      'jam': 'Buka hingga 21.00',
      'rating': '4.5',
    },
    {
      'title': 'Prabu Shoes Rembang',
      'alamat': 'Jl. Raya Rembang - Lasem, Kec. Rembang, Kab. Rembang',
      'jam': 'Buka hingga 21.00',
      'rating': '3.9',
    },
    {
      'title': 'Laundry Kiloan Rembang',
      'alamat': 'Jl. Raya Rembang - Lasem, Kec. Rembang, Kab. Rembang',
      'jam': 'Buka hingga 21.00',
      'rating': '4.0',
    },
    {
      'title': 'Garden Rembang',
      'alamat': 'Jl. Raya Rembang - Lasem, Kec. Rembang, Kab. Rembang',
      'jam': 'Buka hingga 21.00',
      'rating': '4.2',
    }
  ];

  final List<Map<String, String>> listKota = [
    {
      'title': 'Surabaya',
      'detail': 'Surabaya, Jawa Timur',
    },
    {
      'title': 'Jakarta',
      'detail': 'Jakarta, DKI Jakarta',
    },
    {
      'title': 'Bandung',
      'detail': 'Bandung, Jawa Barat',
    },
    {
      'title': 'Semarang',
      'detail': 'Semarang, Jawa Tengah',
    },
    {
      'title': 'Rembang',
      'detail': 'Rembang, Jawa Tengah',
    },
    {
      'title': 'Yogyakarta',
      'detail': 'Yogyakarta, DI Yogyakarta',
    },
    {
      'title': 'Denpasar',
      'detail': 'Denpasar, Bali',
    },
    {
      'title': 'Makassar',
      'detail': 'Makassar, Sulawesi Selatan',
    },
    {
      'title': 'Medan',
      'detail': 'Medan, Sumatera Utara',
    },
    {
      'title': 'Palembang',
      'detail': 'Palembang, Sumatera Selatan',
    },
    {
      'title': 'Padang',
      'detail': 'Padang, Sumatera Barat',
    },
    {
      'title': 'Pekanbaru',
      'detail': 'Pekanbaru, Riau',
    },
    {
      'title': 'Balikpapan',
      'detail': 'Balikpapan, Kalimantan Timur',
    },
    {
      'title': 'Banjarmasin',
      'detail': 'Banjarmasin, Kalimantan Selatan',
    },
    {
      'title': 'Pontianak',
      'detail': 'Pontianak, Kalimantan Barat',
    },
    {
      'title': 'Manado',
      'detail': 'Manado, Sulawesi Utara',
    },
    {
      'title': 'Ambon',
      'detail': 'Ambon, Maluku',
    },
    {
      'title': 'Jayapura',
      'detail': 'Jayapura, Papua',
    },
  ];

  late TextEditingController search;
  final searchKey = "".obs;

  Rx<List<Map<String, String>>> searchResults =
      Rx<List<Map<String, String>>>([]);

  @override
  void onInit() {
    super.onInit();
    search = TextEditingController();
    searchResults.value = listKota;

    search.addListener(() {
      String text = search.text;
      searchKey.value = text;
      onSearch(text);
    });
  }

  @override
  void onClose() {
    super.onClose();
    search.clear();
  }

  void onSearch(String query) {
    List<Map<String, String>> temp = [];
    if (query.isEmpty) {
      temp = listKota;
    } else {
      temp = listKota
          .where((element) =>
              element['title']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    searchResults.value = temp;
  }
}
