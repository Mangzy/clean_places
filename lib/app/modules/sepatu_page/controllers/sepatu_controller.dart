import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoescleaningapp/app/constants/themes.dart';

class SepatuController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final Rx<Color> iconContainerColor = Colors.transparent.obs;

  late TextEditingController search;
  final searchKey = "".obs;

  Rx<List<Map<String, String>>> searchResults =
      Rx<List<Map<String, String>>>([]);

  final List<Map<String, dynamic>> listToko = [
    {
      'id': '1',
      'title': 'Shoes and Care Jakarta',
      'assets': 'assets/toko/shoes-and-care.jpg',
      'alamat': 'Jl. Kebon Jeruk, Kec. Kebon Jeruk, Jakarta Barat',
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
    {
      'id': '2',
      'title': 'Prabu Shoes Bandung',
      'assets': 'assets/toko/prabu-shoes.jpg',
      'alamat': 'Jl. Braga, Kec. Sumur Bandung, Kota Bandung',
      'jam': 'Buka hingga 21.00',
      'rating': '4.5',
      'about':
          'Prabu Shoes Bandung menyediakan berbagai layanan perawatan sepatu dengan harga yang kompetitif dan hasil yang memuaskan. Kami menawarkan berbagai paket perawatan sepatu yang disesuaikan dengan kebutuhan Anda.',
      'jenis': [
        {
          'type': 'Deep Clean',
          'image': 'assets/shoes/deep_clean.jpg',
          'penjelasan':
              'Layanan pembersihan mendalam untuk semua jenis sepatu, mulai dari sneakers hingga kulit, dengan perhatian khusus pada setiap detail.',
          'harga': 'Rp 90.000',
          'rating': '4.6'
        },
        {
          'type': 'Fast Clean',
          'image': 'assets/shoes/fast_clean.jpg',
          'penjelasan':
              'Layanan cuci sepatu cepat dalam 30 menit untuk hasil bersih dan segar.',
          'harga': 'Rp 45.000',
          'rating': '3.9'
        },
        {
          'type': 'Color Restoration',
          'image': 'assets/shoes/color-restoration.jpg',
          'penjelasan':
              'Layanan restorasi warna sepatu yang pudar agar kembali seperti baru.',
          'harga': 'Rp 120.000',
          'rating': '3.3'
        },
        {
          'type': 'Sole Protection',
          'image': 'assets/shoes/sole-protection.jpeg',
          'penjelasan':
              'Layanan pelindung sol untuk memperpanjang umur sepatu Anda.',
          'harga': 'Rp 80.000',
          'rating': '2.7'
        },
        {
          'type': 'Odor Removal',
          'image': 'assets/shoes/remove-odor.jpeg',
          'penjelasan':
              'Menghilangkan bau tidak sedap dengan teknologi penghilang bau terkini.',
          'harga': 'Rp 75.000',
          'rating': '4.1'
        }
      ]
    },
    {
      'id': '3',
      'title': 'Sneaker Wash Surabaya',
      'assets': 'assets/toko/sneaker-wash.jpg',
      'alamat': 'Jl. Pemuda, Kec. Genteng, Kota Surabaya',
      'jam': 'Buka hingga 21.00',
      'rating': '4.7',
      'about':
          'Sneaker Wash Surabaya adalah pilihan utama bagi Anda yang ingin membersihkan dan merawat sepatu sneaker kesayangan dengan layanan yang cepat dan berkualitas.',
      'jenis': [
        {
          'type': 'Deep Clean',
          'image': 'assets/shoes/deep_clean.jpg',
          'penjelasan':
              'Layanan pembersihan mendalam untuk sneakers, mencakup bagian luar dan dalam sepatu.',
          'harga': 'Rp 110.000',
          'rating': '4.8'
        },
        {
          'type': 'Fast Clean',
          'image': 'assets/shoes/fast_clean.jpg',
          'penjelasan':
              'Layanan cuci cepat untuk sneakers, hanya dalam waktu 1 jam sepatu Anda akan bersih kembali.',
          'harga': 'Rp 60.000',
          'rating': '3.5'
        },
        {
          'type': 'Anti Bacterial Treatment',
          'image': 'assets/shoes/anti-bacterical.jpg',
          'penjelasan':
              'Perawatan anti-bakteri untuk menjaga kebersihan dan kesehatan kaki Anda dari bakteri yang berkembang di dalam sepatu.',
          'harga': 'Rp 85.000',
          'rating': '2.0'
        },
        {
          'type': 'Waterproof Coating',
          'image': 'assets/shoes/waterproof.jpg',
          'penjelasan':
              'Layanan pelapisan anti-air untuk melindungi sepatu dari cipratan air dan noda.',
          'harga': 'Rp 100.000',
          'rating': '4.6'
        },
        {
          'type': 'Odor Removal',
          'image': 'assets/shoes/remove-odor.jpeg',
          'penjelasan':
              'Menghilangkan bau tidak sedap dengan teknologi penghilang bau terkini.',
          'harga': 'Rp 75.000',
          'rating': '4.1'
        }
      ]
    },
    {
      'id': '4',
      'title': 'Urban Shoes Care Yogyakarta',
      'assets': 'assets/toko/urban-shoescare.jpg',
      'alamat': 'Jl. Kaliurang, Kec. Depok, Kabupaten Sleman, Yogyakarta',
      'jam': 'Buka hingga 21.00',
      'rating': '4.6',
      'about':
          'Urban Shoes Care Yogyakarta menawarkan berbagai layanan perawatan sepatu dengan standar tinggi, mulai dari pembersihan hingga perbaikan untuk menjaga sepatu Anda tetap dalam kondisi prima.',
      'jenis': [
        {
          'type': 'Deep Clean',
          'image': 'assets/shoes/deep_clean.jpg',
          'penjelasan':
              'Layanan pembersihan total untuk sepatu Anda, memastikan setiap bagian sepatu kembali bersih.',
          'harga': 'Rp 95.000',
          'rating': '4.7'
        },
        {
          'type': 'Fast Clean',
          'image': 'assets/shoes/fast_clean.jpg',
          'penjelasan':
              'Pembersihan cepat untuk sepatu dengan hasil maksimal dalam waktu singkat.',
          'harga': 'Rp 55.000',
          'rating': '3.8'
        },
        {
          'type': 'Sole Repair',
          'image': 'assets/shoes/sole-repair.jpg',
          'penjelasan':
              'Layanan perbaikan sol sepatu untuk memperpanjang umur pakai sepatu Anda.',
          'harga': 'Rp 130.000',
          'rating': '2.3'
        },
        {
          'type': 'Color Restoration',
          'image': 'assets/shoes/color-restoration.jpg',
          'penjelasan':
              'Layanan restorasi warna sepatu yang pudar agar kembali seperti baru.',
          'harga': 'Rp 120.000',
          'rating': '3.3'
        },
        {
          'type': 'Odor Removal',
          'image': 'assets/shoes/remove-odor.jpeg',
          'penjelasan':
              'Penghilangan bau tak sedap dari dalam sepatu dengan bahan khusus anti-bakteri.',
          'harga': 'Rp 75.000',
          'rating': '1.5'
        }
      ]
    },
    {
      'id': '5',
      'title': 'Premium Sneakers Care Bali',
      'assets': 'assets/toko/premium-sneakers.jpeg',
      'alamat': 'Jl. Sunset Road, Kuta, Bali',
      'jam': 'Buka hingga 20.00',
      'rating': '4.9',
      'about':
          'Premium Sneakers Care Bali menawarkan layanan perawatan eksklusif untuk sepatu sneakers Anda dengan teknik dan bahan terbaik. Kami juga menyediakan layanan custom untuk sepatu agar tampil lebih menarik.',
      'jenis': [
        {
          'type': 'Deep Clean',
          'image': 'assets/shoes/deep_clean.jpg',
          'penjelasan':
              'Pembersihan mendalam untuk sepatu sneakers Anda, termasuk penghapusan noda yang membandel.',
          'harga': 'Rp 120.000',
          'rating': '4.9'
        },
        {
          'type': 'Fast Clean',
          'image': 'assets/shoes/fast_clean.jpg',
          'penjelasan':
              'Layanan cuci cepat untuk sneakers, hanya dalam waktu 1 jam sepatu Anda akan bersih kembali.',
          'harga': 'Rp 60.000',
          'rating': '4.5'
        },
        {
          'type': 'Color Restoration',
          'image': 'assets/shoes/color-restoration.jpg',
          'penjelasan':
              'Restorasi warna sepatu yang memudar agar kembali seperti baru.',
          'harga': 'Rp 150.000',
          'rating': '4.0'
        },
        {
          'type': 'Waterproof Coating',
          'image': 'assets/shoes/waterproof.jpg',
          'penjelasan':
              'Pelapisan anti-air untuk melindungi sepatu dari air dan noda.',
          'harga': 'Rp 110.000',
          'rating': '3.7'
        },
        {
          'type': 'Odor Removal',
          'image': 'assets/shoes/remove-odor.jpeg',
          'penjelasan':
              'Layanan penghilangan bau tak sedap dari sepatu dengan bahan khusus.',
          'harga': 'Rp 85.000',
          'rating': '2.5'
        }
      ]
    },
    {
      'id': '6',
      'title': 'Elite Shoe Care Semarang',
      'assets': 'assets/toko/elite-shoes.jpg',
      'alamat': 'Jl. Pandanaran, Kec. Semarang Selatan, Kota Semarang',
      'jam': 'Buka hingga 22.00',
      'rating': '4.3',
      'about':
          'Elite Shoe Care Semarang menyediakan berbagai layanan perawatan sepatu untuk menjaga penampilan dan kebersihan sepatu Anda. Kami menggunakan teknik dan bahan terbaik untuk memastikan hasil yang memuaskan.',
      'jenis': [
        {
          'type': 'Deep Clean',
          'assets': 'assets/shoes/deep_clean.jpg',
          'penjelasan':
              'Layanan pembersihan mendalam untuk sepatu Anda, termasuk penghilangan noda dan kotoran yang membandel.',
          'harga': 'Rp 115.000',
          'rating': '4.4'
        },
        {
          'type': 'Fast Clean',
          'assets': 'assets/shoes/fast_clean.jpg',
          'penjelasan':
              'Layanan cuci cepat untuk sepatu Anda dalam waktu kurang dari 1 jam.',
          'harga': 'Rp 65.000',
          'rating': '3.9'
        },
        {
          'type': 'Waterproof Coating',
          'assets': 'assets/shoes/waterproof.jpg',
          'penjelasan':
              'Pelapisan anti-air untuk melindungi sepatu dari air dan noda.',
          'harga': 'Rp 140.000',
          'rating': '4.2'
        },
        {
          'type': 'Sole Restoration',
          'assets': 'assets/shoes/sole-restoration.jpg',
          'penjelasan':
              'Layanan restorasi sol sepatu yang sudah aus agar kembali seperti baru.',
          'harga': 'Rp 130.000',
          'rating': '3.7'
        },
        {
          'type': 'Odor Removal',
          'image': 'assets/shoes/remove-odor.jpeg',
          'penjelasan':
              'Layanan penghilangan bau tak sedap dari sepatu dengan bahan khusus.',
          'harga': 'Rp 90.000',
          'rating': '2.8'
        }
      ]
    }
  ];

  @override
  void onInit() {
    super.onInit();
    search = TextEditingController();

    search.addListener(() {
      String text = search.text;
      searchKey.value = text;
    });

    scrollController.addListener(() {
      if (scrollController.offset > 150) {
        iconContainerColor.value = Themes.primaryColor;
      } else {
        iconContainerColor.value = Colors.transparent;
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
    search.clear();
  }
}
