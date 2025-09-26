import 'package:flutter/material.dart';

class konversiWaktuPage extends StatefulWidget {
  const konversiWaktuPage({super.key});

  @override
  State<konversiWaktuPage> createState() => _konversiWaktuPageState();
}

class _konversiWaktuPageState extends State<konversiWaktuPage> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _waktuWIB = '';
  String _waktuWITA = '';
  String _waktuWIT = '';

  @override
  void initState() {
    super.initState();
    _konversiWaktu(_selectedTime);
  }

  void _konversiWaktu(TimeOfDay time) {
    int jam = time.hour;
    int menit = time.minute;

    _waktuWIB = '${jam.toString().padLeft(2, '0')}:${menit.toString().padLeft(2, '0')}';

    int jamWITA = (jam + 1) % 24;
    _waktuWITA = '${jamWITA.toString().padLeft(2, '0')}:${menit.toString().padLeft(2, '0')}';

    int jamWIT = (jam + 2) % 24;
    _waktuWIT = '${jamWIT.toString().padLeft(2, '0')}:${menit.toString().padLeft(2, '0')}';
  }

  void _pilihWaktu(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.blueGrey, 
              onSurface: Colors.black87, 
            ),
          ),
          child: child!,
        );
      },
    );
    
    if (newTime != null) {
      setState(() {
        _selectedTime = newTime;
        _konversiWaktu(newTime);
      });
    }
  }

  Widget _buildTimeResult(String zone, String time, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 15),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.5), width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  zone,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Waktu Lokal',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            Text(
              time,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: color,
              ),
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
        title: const Text(
          'Konversi Zona Waktu',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 231, 241, 247),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: const Color.fromARGB(255, 188, 224, 242)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Waktu Awal yang Dipilih (Asumsi WIB):',
                    style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _selectedTime.format(context),
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => _pilihWaktu(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                elevation: 5,
              ),
              child: const Text('UBAH WAKTU', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(height: 30),

            const Text(
              'Hasil Konversi Zona Waktu Indonesia:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const Divider(height: 20, thickness: 1.5),

            _buildTimeResult('Waktu Indonesia Barat (WIB)', _waktuWIB, Colors.blueGrey.shade700),
            _buildTimeResult('Waktu Indonesia Tengah (WITA)', _waktuWITA, Colors.deepOrange.shade700),
            _buildTimeResult('Waktu Indonesia Timur (WIT)', _waktuWIT, Colors.green.shade700),
          ],
        ),
      ),
    );
  }
}
