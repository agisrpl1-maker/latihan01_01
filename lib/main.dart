import 'package:flutter/material.dart';

void main() {
  String namaBarang = "Botol Minum";
  int stok = 5;
  
  print("--- Penjualan $namaBarang ---");

  while (stok > 0) {
    stok--;
    print("Terjual 1, sisa stok: $stok");
  }

  runApp(const MyApp());
}
// Jika kondisi while salah, perulangan bisa berjalan terus (infinite loop)
// atau stok menjadi negatif sehingga koperasi menjual barang melebihi stok.
// Untuk mencegahnya, gunakan kondisi while (stok > 0) agar penjualan berhenti
// tepat saat stok habis dan tidak ada stok minus.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penjualan Barang',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Penjualan Barang'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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