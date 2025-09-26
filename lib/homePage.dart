import 'package:flutter/material.dart';
import 'piramidaPage.dart';
import 'cekHariPage.dart';
import 'konversiWaktuPage.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _HomePageState();
}

class _HomePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
        backgroundColor:  Colors.blueGrey, 
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const piramidaPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50), 
                  backgroundColor:  const Color.fromARGB(255, 188, 224, 242),
                  foregroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  "Piramida",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const konversiWaktuPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50), 
                  backgroundColor:  const Color.fromARGB(255, 188, 224, 242),
                  foregroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  "Konversi Waktu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const cekHariPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 50), 
                  backgroundColor:  const Color.fromARGB(255, 188, 224, 242),
                  foregroundColor: Colors.blueGrey,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  "Cek Hari",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
