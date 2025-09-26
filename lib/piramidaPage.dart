import 'package:flutter/material.dart';


class piramidaPage extends StatefulWidget {
  const piramidaPage({super.key});

  @override
  State<piramidaPage> createState() => _piramidaPageState();
}

class _piramidaPageState extends State<piramidaPage> {
  final TextEditingController _rusukAlasController = TextEditingController();
  final TextEditingController _tinggiPiramidaController = TextEditingController();

  String _hasilVolume = "0.0";
  String _hasilKeliling = "PIRAMIDA TIDAK BISA\nDIHITUNG KELILINGNYA";
  String _errorMessage = "";

  @override
  void dispose() {
    _rusukAlasController.dispose();
    _tinggiPiramidaController.dispose();
    super.dispose();
  }

  double? _validateAndParse(String text, String fieldName) {
    final num? value = num.tryParse(text);

    if (value == null || value <= 0) {
      _errorMessage = "Error: Input '$fieldName' harus angka > 0.";
      return null;
    }
    
    if (value != value.truncateToDouble()) {
      _errorMessage = "Error: Input '$fieldName' harus angka bulat, bukan pecahan.";
      return null;
    }
    
    return value.toDouble();
  }

  void _hitungPiramida() {
    setState(() {
      _errorMessage = "";
      _hasilVolume = "N/A";
      _hasilKeliling = "PIRAMIDA TIDAK BISA\nDIHITUNG KELILINGNYA";

      final String aText = _rusukAlasController.text;
      final String tText = _tinggiPiramidaController.text;

      if (_errorMessage.isNotEmpty) return;

      final double? a = _validateAndParse(aText, 'a (Rusuk Alas)');
      final double? t = _validateAndParse(tText, 't (Tinggi Piramida)');

      if (_errorMessage.isNotEmpty) return;

      if (a != null && t != null) {
        final double volume = (1 / 3) * a * a * t;
        _hasilVolume = volume.toStringAsFixed(2);
      } else if (aText.isNotEmpty && tText.isNotEmpty) {
        return;
      }
    });
  }

  Widget _buildInputField(TextEditingController controller, String label, String hint) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildResultCard(String title, String result, IconData icon) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 188, 224, 242)),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.blueGrey, size: 30),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 4),
                Text(
                  result,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade900,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piramida Hitung'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (_errorMessage.isNotEmpty) 
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.shade700)
                ),
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red.shade800, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            const Text('Masukkan Nilai (Angka Bulat > 0):', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildInputField(_rusukAlasController, 'Rusuk Alas (a)', 'Masukkan a'),
            const SizedBox(height: 12),
            _buildInputField(_tinggiPiramidaController, 'Tinggi Piramida (t)', 'Masukkan t'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _hitungPiramida,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 5,
              ),
              child: const Text('HITUNG VOLUME', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 20),
            _buildResultCard('Volume (V)', _hasilVolume, Icons.layers),
            const SizedBox(height: 12),
            _buildResultCard('Keliling', _hasilKeliling, Icons.square_foot),
          ],
        ),
      ),
    );
  }
}