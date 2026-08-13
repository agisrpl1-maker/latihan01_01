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
// Penanganan galat meningkatkan kepercayaan pengurus pada sistem
// karena kesalahan input tidak langsung menghentikan program.
// Sistem memberikan pesan yang jelas dan tetap mencatat transaksi,
// sehingga proses kasir lebih aman dan dapat diandalkan.
void main() {
  // Pengujian input angka yang benar
  prosesBeli("2");

  print("");

  // Pengujian input yang salah
  prosesBeli("dua");

  runApp(const MyApp());
}

void prosesBeli(String inputJumlah) {
  try {
    int jumlah = int.parse(inputJumlah);

    if (jumlah <= 0) {
      print("Jumlah harus lebih dari 0.");
      return;
    }

    int stok = 10;

    if (jumlah > stok) {
      print("Stok tidak mencukupi.");
      return;
    }

    stok -= jumlah;

    print("Pembelian berhasil.");
    print("Jumlah terjual: $jumlah");
    print("Sisa stok: $stok");
  } catch (e) {
    print("Input tidak valid. Silakan masukkan angka.");
  } finally {
    print("Transaksi dicatat di log.");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Koperasi Sekolah',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Koperasi Sekolah'),
        ),
        body: const Center(
          child: Text(
            'Lihat hasil transaksi di Debug Console',
          ),
        ),
      ),
    );
  }
}