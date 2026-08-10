import 'package:flutter/material.dart';
// Nilai stok berguna untuk mengetahui perkiraan nilai aset barang
// yang masih dimiliki koperasi. Angka ini membantu koperasi membuat
// laporan aset dan mengetahui total nilai persediaan barang.
class Barang {
  String nama;
  double harga;
  int stok;
  bool tersedia;

  Barang({
    required this.nama,
    required this.harga,
    required this.stok,
    required this.tersedia,
  });

  bool bisaDijual(int diminta) {
  return stok >= diminta;
}

  void tampilkan() {
    print("==============================");
    print("KARTU DATA BARANG");
    print("Nama     : $nama");
    print("Harga    : Rp$harga");
    print("Stok     : $stok");
    print("Tersedia : $tersedia");
    print("Nilai Stok: Rp${nilaiStok()}");
    print("==============================");
  }

  double nilaiStok() {
    return harga * stok;
  }
}

// Keuntungan memodelkan barang sebagai objek adalah setiap data barang,
// seperti nama, harga, stok, dan status tersedia, tersimpan dalam satu
// kesatuan sehingga kode lebih rapi dan mudah dikelola. Ke depan, sistem
// koperasi juga lebih mudah dikembangkan karena cukup menambahkan atribut
// atau method baru pada kelas Barang tanpa harus mengubah banyak bagian kode.

void main() {
Barang bukuTulis = Barang(
  nama: "Buku Tulis",
  harga: 3000,
  stok: 20,
  tersedia: true,
);

print("Bisa dijual 5: ${bukuTulis.bisaDijual(5)}");
print("Bisa dijual 25: ${bukuTulis.bisaDijual(25)}");

  Barang pulpen = Barang(
    nama: "Pulpen",
    harga: 2500,
    stok: 15,
    tersedia: true,
  );

  Barang roti = Barang(
    nama: "Roti",
    harga: 5000,
    stok: 10,
    tersedia: true,
  );

  List<Barang> daftarBarang = [
    bukuTulis,
    pulpen,
    roti,
  ];

  print("=== DAFTAR BARANG KOPERASI ===");

  for (Barang barang in daftarBarang) {
    barang.tampilkan();
  }

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
            "Data Barang Koperasi\nLihat hasil di Debug Console",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}