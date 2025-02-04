import 'package:safetycheck/providers/dashboard_provider.dart';
import 'package:safetycheck/views/dashboard/beranda_panel.dart';
import 'package:safetycheck/views/dashboard/berita_panel.dart';

import 'package:safetycheck/views/dashboard/deteksi.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final panels = [
      const BerandaPanel(),
       ArtikelKeselamatanKerja(),
      // const ChatBotPanel(),
      // const Test1(),
      YoloVideo(),
    ];

    return Consumer<DashboardProvider>(builder: (context, prov, w) {
      return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              prov.ubahTab(value);
              print("tab $value");
            },
            currentIndex: prov.tabaktif,

            selectedItemColor: Colors.blue, // Warna ikon dan teks yang dipilih
            unselectedItemColor:
                Colors.grey, // Warna ikon dan teks yang tidak dipilih
            selectedLabelStyle:
                const TextStyle(color: Colors.blue), // Warna teks yang dipilih
            unselectedLabelStyle: const TextStyle(
                color: Colors.grey), // Warna teks yang tidak dipilih
            showUnselectedLabels:
                true, // Menampilkan teks pada item yang tidak terpilih
            items: const [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.newspaper),
                label: 'Artikel',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(FontAwesomeIcons.facebookMessenger),
              //   label: 'Chatbot',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(FontAwesomeIcons.image),
              //   label: 'Deteksi/Klasifikasi', // Ganti dengan label yang sesuai
              // ),
            ],
          ),
          body: panels[prov.tabaktif]);
    });
  }
}
