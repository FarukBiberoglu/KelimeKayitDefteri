import 'package:flutter/material.dart';
import 'package:untitled/word.dart';
import 'package:untitled/word_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kelime Öğrenme Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final TextEditingController turkishController = TextEditingController();
  final TextEditingController englishController = TextEditingController();
  final List<Word> words = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.indigo],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'Kelime Ekle',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade200,
              Colors.indigo.shade400,
            ],
            stops: [0.5, 1.0],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: englishController,
                decoration: InputDecoration(
                  labelText: 'İngilizce Kelime',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                  prefixIcon: Icon(Icons.language),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: turkishController,
                decoration: InputDecoration(
                  labelText: 'Türkçe Kelime',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                  prefixIcon: Icon(Icons.language),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
              SizedBox(height: 24),
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                child: OutlinedButton(
                  onPressed: () {
                    if (turkishController.text.isNotEmpty && englishController.text.isNotEmpty) {
                      words.add(Word(turkishController.text, englishController.text));
                      turkishController.clear();
                      englishController.clear();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Kelime eklendi!')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Lütfen her iki alanı da doldurun!')),
                      );
                    }
                  },
                  child: Text('Ekle', style: TextStyle(fontSize: 18)),
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.indigo),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WordListPage(words: words),
                    ),
                  );
                },
                child: Text('Kayıtlı Kelimeleri Göster', style: TextStyle(fontSize: 18)),
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.indigo),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
