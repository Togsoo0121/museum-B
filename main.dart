import 'package:flutter/material.dart';

void main() => runApp(SignLanguageMuseumApp());

class SignLanguageMuseumApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Сурдчилсан Музей',
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
        ).copyWith(
          secondary: Colors.amber,
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    MuseumIntroPage(),
    CulturalHeritagePage(),
    WorkReportPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Нүүр',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Сурдчилсан',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Тайлан',
          ),
        ],
      ),
    );
  }
}

class MuseumIntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Музейн танилцуулга')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              color: Colors.grey[300],
              child: Center(child: Text('Зураг')),
            ),
            SizedBox(height: 10),
            Text(
              'Музейн тухай товч танилцуулга... Энэ хэсэгт музейн зорилго, түүх болон байршлын мэдээллийг оруулна.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Container(
              height: 120,
              color: Colors.grey[300],
              child: Center(child: Text('Байршлын зураг')),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text('Холбоо барих'),
            ),
          ],
        ),
      ),
    );
  }
}

class CulturalHeritagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Сурдчилсан соёлын өв')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          HeritageCard(),
          HeritageCard(),
        ],
      ),
    );
  }
}

class HeritageCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      child: Column(
        children: [
          Container(
            height: 120,
            color: Colors.grey[300],
            child: Center(child: Text('Үзмэрийн зураг')),
          ),
          ListTile(
            title: Text('Үзмэрийн нэр'),
            trailing: Icon(Icons.play_circle_fill, color: Colors.indigo),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text('Дэлгэрэнгүй'),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Хийсэн ажлууд')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ReportItem(year: 2023, month: 'Арван хоёрдугаар сар', name: 'Ажлын нэр'),
          ReportItem(year: 2024, month: 'Хоёрдугаар сар', name: 'Шинэ ажил'),
        ],
      ),
    );
  }
}

class ReportItem extends StatelessWidget {
  final int year;
  final String month;
  final String name;

  ReportItem({required this.year, required this.month, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$year', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ListTile(
          title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text('$month
Тайлбар бичвэр, нэмэлт мэдээлэл'),
          trailing: Icon(Icons.picture_as_pdf, color: Colors.redAccent),
        ),
        Divider(),
      ],
    );
  }
}