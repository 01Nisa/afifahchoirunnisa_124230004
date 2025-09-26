import 'package:flutter/material.dart';
import 'homePage.dart';
import 'profilPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<MainScreen>{
  int _selectindex = 0;

  final List<Widget> _widgetOptions = <Widget> [
    const homePage(),
    const profilPage(),
  ];

  void _onItem(int index){
    setState(() {
      _selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectindex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max_rounded),
            activeIcon: Icon(Icons.home),
            label: 'Home',
            ),

            BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profil',
            ),
        ],
        currentIndex: _selectindex,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color.fromARGB(255, 188, 224, 242),
        onTap: _onItem,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}
