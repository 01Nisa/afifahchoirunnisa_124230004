import 'package:flutter/material.dart';

class cekHariPage extends StatefulWidget {
  const cekHariPage({super.key});

  @override
  State<cekHariPage> createState() => _cekHariPageState();
}

class _cekHariPageState extends State<cekHariPage> {
  final TextEditingController _inputHariController = TextEditingController();
  
  String _hasilHari = " ";
  Color _hasilColor = Colors.grey.shade700;

  @override
  void dispose() {
    _inputHariController.dispose();
    super.dispose();
  }

  void cekHari() {
    final int? inputAngka = int.tryParse(_inputHariController.text);
    
    String tempHari;
    Color tempColor;

    if (inputAngka == null || inputAngka < 1 || inputAngka > 7) {
      tempHari = "Input tidak valid! Harap masukkan angka bulat 1 sampai 7.";
      tempColor = Colors.red.shade700;
    } else {
      switch (inputAngka) {
        case 1:
          tempHari = "Senin";
          break;
        case 2:
          tempHari = "Selasa";
          break;
        case 3:
          tempHari = "Rabu";
          break;
        case 4:
          tempHari = "Kamis";
          break;
        case 5:
          tempHari = "Jumat";
          break;
        case 6:
          tempHari = "Sabtu";
          break;
        case 7:
          tempHari = "Minggu";
          break;
        default:
          tempHari = "Input tidak tersedia"; 
          tempColor = Colors.red.shade700;
          break;
      }
      tempColor = Colors.blueGrey;
    }

    setState(() {
      _hasilHari = tempHari;
      _hasilColor = tempColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cek Hari Berdasarkan Angka",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor:Colors.blueGrey, 
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _inputHariController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: 'Angka (1-7)',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: cekHari,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 5,
              ),
              child: const Text(
                "Cek Hari",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 40),

            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Hasil Konversi:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _hasilHari,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: _hasilColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
