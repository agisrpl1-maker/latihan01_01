import 'package:flutter/material.dart';

class Barang {
  String nama;
  double harga;
  int _stok;
  bool tersedia;

  Barang({
    required this.nama,
    required this.harga,
    required int stok,
    required this.tersedia,
  }) : _stok = stok;

  // Getter untuk membaca stok
  int get stok => _stok;

  // Menjual barang jika stok mencukupi
  bool jual(int n) {
    if (n <= 0) {
      return false;
    }

    if (n <= _stok) {
      _stok -= n;

      if (_stok == 0) {
        tersedia = false;
      }

      return true;
    }

    return false;
  }

  double nilaiStok() {
    return harga * _stok;
  }
// Melindungi _stok penting bagi integritas data koperasi agar jumlah
// stok tidak dapat diubah sembarangan dari luar class. Perubahan stok
// hanya dilakukan melalui method jual() sehingga stok tetap akurat,
// tidak menjadi negatif, dan sesuai dengan transaksi yang terjadi.
  void tampilkan() {
    print("==============================");
    print("KARTU DATA BARANG");
    print("Nama      : $nama");
    print("Harga     : Rp$harga");
    print("Stok      : $_stok");
    print("Tersedia  : $tersedia");
    print("Nilai Stok: Rp${nilaiStok()}");
    print("==============================");
  }
}
class BarangPromo extends Barang {
  double diskon;

  BarangPromo({
    required String nama,
    required double harga,
    required int stok,
    required bool tersedia,
    required this.diskon,
  }) : super(
          nama: nama,
          harga: harga,
          stok: stok,
          tersedia: tersedia,
        );

  double hargaPromo() {
    return harga - (harga * diskon / 100);
  }
}

void main() {
  Barang bukuTulis = Barang(
    nama: "Buku Tulis",
    harga: 3000,
    stok: 10,
    tersedia: true,
  );

  print("Stok awal: ${bukuTulis.stok}");

  bool berhasil = bukuTulis.jual(3);

  print("Penjualan 3 barang berhasil: $berhasil");
  print("Stok setelah penjualan: ${bukuTulis.stok}");

  bool gagal = bukuTulis.jual(10);

  print("Penjualan 10 barang berhasil: $gagal");
  print("Stok setelah percobaan: ${bukuTulis.stok}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barang Promo',
      home: const Scaffold(
        body: Center(
          child: Text("Barang Promo"),
        ),
      ),
    );
  }
}