import 'package:flutter/material.dart';

// Fungsi untuk menghitung total
double hitungTotal(int jumlah, double harga) {
  return jumlah * harga;
}

// Fungsi untuk menghitung harga akhir setelah potongan
double hitungHargaAkhir(double total, double persenPotongan) {
  return total - (total * persenPotongan / 100);
}

void main() {
  int jumlah = 50;
  double harga = 5000;

  // Menghitung total harga
  double total = hitungTotal(jumlah, harga);

  // Menentukan persentase potongan
  double persenPotongan;

  if (total > 200000) {
    persenPotongan = 10;
  } else if (total > 100000) {
    persenPotongan = 5;
  } else {
    persenPotongan = 0;
  }

  // Menghitung harga akhir
  double hargaAkhir = hitungHargaAkhir(total, persenPotongan);

  // Menampilkan hasil pada Debug Console
  print("==============================");
  print("     PERHITUNGAN TOTAL");
  print("==============================");
  print("Jumlah : $jumlah");
  print("Harga  : Rp$harga");
  print("Total  : Rp$total");
  print("Potongan : $persenPotongan%");
  print("Harga Akhir : Rp$hargaAkhir");
  print("==============================");

  runApp(const MyApp());
}

// Jika kondisi while salah, perulangan bisa berjalan terus
// (infinite loop) atau stok menjadi negatif sehingga koperasi
// menjual barang melebihi stok.
// Untuk mencegahnya, gunakan kondisi while (stok > 0)
// agar penjualan berhenti tepat saat stok habis
// dan tidak ada stok minus.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perhitungan Total',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 51, 0),
        ),
      ),
      home: const MyHomePage(
        title: 'Perhitungan Total',
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor:
            Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          "Lihat hasil pada Debug Console",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}