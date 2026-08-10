import 'package:flutter/material.dart';
class Barang {
  String nama;
  double harga;
  int stok;
  bool tersedia;

  // Konstruktor
  Barang({
    required this.nama,
    required this.harga,
    required this.stok,
    required this.tersedia,
  });

  void tampilkan() {
    print("=================================");
    print("       KARTU DATA BARANG");
    print("=================================");
    print("Nama     : $nama");
    print("Harga    : Rp$harga");
    print("Stok     : $stok");
    print("Tersedia : $tersedia");
    print("=================================");
  }
}

void main() {

  Barang bukuTulis = Barang(
    nama: "Buku Tulis",
    harga: 3000,
    stok: 20,
    tersedia: true,
  );

  Barang pulpen = Barang(
    nama: "Pulpen",
    harga: 2500,
    stok: 15,
    tersedia: true,
  );

  Barang roti = Barang(
    nama: "Roti",
    harga: 5000,
    stok: 0,
    tersedia: false,
  );


  bukuTulis.tampilkan();
  pulpen.tampilkan();
  roti.tampilkan();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Barang Koperasi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            "Data Barang Koperasi\n"
            "Lihat hasil di Debug Console",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}