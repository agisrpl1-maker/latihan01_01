import 'package:flutter/material.dart';
import 'dart:async';

// ======================================================
// FUNGSI LAPORAN
// ======================================================

Future<void> muatLaporan() async {
  print("Menyiapkan laporan...");

  await Future.delayed(const Duration(seconds: 1));

  print("Laporan siap!");
}

// ======================================================
// FUNGSI PERHITUNGAN
// ======================================================

double hitungTotal(int jumlah, double harga) {
  return jumlah * harga;
}

double hitungHargaAkhir(double total, double persenPotongan) {
  return total - (total * persenPotongan / 100);
}

// ======================================================
// CLASS BARANG
// ======================================================

class Barang {
  String nama;
  double hargaAnggota;
  double hargaUmum;
  int _stok;
  bool tersedia;

  Barang({
    required this.nama,
    required this.hargaAnggota,
    required this.hargaUmum,
    required int stok,
  })  : _stok = stok,
        tersedia = stok > 0;

  // Getter untuk membaca stok
  int get stok => _stok;

  // Menghitung nilai seluruh stok
  double nilaiStok() {
    return hargaUmum * _stok;
  }

  // Mengecek apakah stok mencukupi
  bool bisaDijual(int diminta) {
    return diminta > 0 && diminta <= _stok;
  }

  // Mengurangi stok melalui proses penjualan yang sah
  bool jual(int jumlah) {
    if (!bisaDijual(jumlah)) {
      return false;
    }

    _stok -= jumlah;

    if (_stok == 0) {
      tersedia = false;
    }

    return true;
  }

  // Menampilkan kartu barang
  void tampilkan() {
    print("------------------------------------------");
    print("Nama          : $nama");
    print("Harga Anggota : Rp$hargaAnggota");
    print("Harga Umum    : Rp$hargaUmum");
    print("Stok          : $_stok");
    print("Tersedia      : $tersedia");
    print("Nilai Stok    : Rp${nilaiStok()}");
    print("------------------------------------------");
  }
}

// ======================================================
// CLASS BARANG PROMO
// ======================================================

class BarangPromo extends Barang {
  double diskon;

  BarangPromo({
    required String nama,
    required double hargaAnggota,
    required double hargaUmum,
    required int stok,
    required this.diskon,
  }) : super(
          nama: nama,
          hargaAnggota: hargaAnggota,
          hargaUmum: hargaUmum,
          stok: stok,
        );

  double hargaPromo() {
    return hargaUmum - (hargaUmum * diskon / 100);
  }
}

// ======================================================
// PROSES TRANSAKSI
// ======================================================

void prosesBeli({
  required Barang barang,
  required String inputJumlah,
  required bool anggota,
}) {
  print("");
  print("========== TRANSAKSI ==========");

  try {
    // Mengubah input menjadi angka
    int jumlah = int.parse(inputJumlah);

    // Menolak jumlah 0 atau negatif
    if (jumlah <= 0) {
      print("Jumlah beli harus lebih dari 0.");
      return;
    }

    // Mengecek stok
    if (!barang.bisaDijual(jumlah)) {
      print("Stok tidak mencukupi.");
      print("Stok tersedia : ${barang.stok}");
      print("Jumlah diminta : $jumlah");
      return;
    }

    // Menentukan harga berdasarkan status anggota
    double harga;

    if (anggota) {
      harga = barang.hargaAnggota;
      print("Status Pembeli : Anggota");
    } else {
      harga = barang.hargaUmum;
      print("Status Pembeli : Umum");
    }

    // Menghitung total
    double total = hitungTotal(jumlah, harga);

    // Menentukan potongan
    double persenPotongan;

    if (anggota && total > 500000) {
      persenPotongan = 15;
    } else if (total > 200000) {
      persenPotongan = 10;
    } else if (total > 100000) {
      persenPotongan = 5;
    } else {
      persenPotongan = 0;
    }

    // Menghitung harga akhir
    double hargaAkhir =
        hitungHargaAkhir(total, persenPotongan);

    // Mengurangi stok
    bool berhasil = barang.jual(jumlah);

    if (!berhasil) {
      print("Transaksi gagal karena stok tidak mencukupi.");
      return;
    }

    // Menampilkan hasil transaksi
    print("Nama Barang    : ${barang.nama}");
    print("Harga Satuan   : Rp$harga");
    print("Jumlah         : $jumlah");
    print("Total          : Rp$total");
    print("Potongan       : $persenPotongan%");
    print("Harga Akhir    : Rp$hargaAkhir");
    print("Sisa Stok      : ${barang.stok}");
    print("Transaksi berhasil!");
  } catch (e) {
    // Menangani input bukan angka
    print(
      '"$inputJumlah" bukan angka, silakan masukkan angka.',
    );
  } finally {
    print("Transaksi dicatat di log.");
    print("==============================");
  }
}

// ======================================================
// MAIN
// ======================================================

Future<void> main() async {
  // ----------------------------------------------------
  // 1. MUAT LAPORAN
  // ----------------------------------------------------

  print("==========================================");
  print("        BRANTAS MART");
  print("==========================================");

  await muatLaporan();

  // ----------------------------------------------------
  // 2. DATA BARANG
  // ----------------------------------------------------

  Barang bukuTulis = Barang(
    nama: "Buku Tulis",
    hargaAnggota: 3000,
    hargaUmum: 3500,
    stok: 40,
  );

  Barang pulpen = Barang(
    nama: "Pulpen",
    hargaAnggota: 2500,
    hargaUmum: 3000,
    stok: 25,
  );

  Barang roti = Barang(
    nama: "Roti",
    hargaAnggota: 4500,
    hargaUmum: 5000,
    stok: 15,
  );

  BarangPromo lemKertas = BarangPromo(
    nama: "Lem Kertas",
    hargaAnggota: 7000,
    hargaUmum: 8000,
    stok: 10,
    diskon: 10,
  );

  List<Barang> daftarBarang = [
    bukuTulis,
    pulpen,
    roti,
    lemKertas,
  ];

  // ----------------------------------------------------
  // 3. TAMPILKAN SEMUA BARANG
  // ----------------------------------------------------

  print("");
  print("========== DAFTAR BARANG ==========");

  for (Barang barang in daftarBarang) {
    barang.tampilkan();
  }

  // ----------------------------------------------------
  // 4. PROSES 1 TRANSAKSI
  // ----------------------------------------------------
  //
  // Contoh:
  // Anggota membeli 3 Buku Tulis.
  //

  prosesBeli(
    barang: bukuTulis,
    inputJumlah: "3",
    anggota: true,
  );

  // ----------------------------------------------------
  // 5. UJI SALAH INPUT
  // ----------------------------------------------------

  print("");
  print("========== UJI SALAH INPUT ==========");

  prosesBeli(
    barang: bukuTulis,
    inputJumlah: "dua",
    anggota: true,
  );

  // ----------------------------------------------------
  // 6. HASIL AKHIR STOK
  // ----------------------------------------------------

  print("");
  print("========== STOK SETELAH TRANSAKSI ==========");

  bukuTulis.tampilkan();

  print("");
  print("Program Brantas Mart selesai.");
  
  // Menjalankan aplikasi Flutter
  runApp(const MyApp());
}

// ======================================================
// TAMPILAN FLUTTER
// ======================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brantas Mart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Brantas Mart'),
        ),
        body: const Center(
          child: Text(
            'Sistem Kasir Brantas Mart\n'
            'Lihat hasil transaksi di Debug Console',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
//selesai