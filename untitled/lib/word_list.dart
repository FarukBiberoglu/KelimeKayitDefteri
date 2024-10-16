import 'package:flutter/material.dart';
import 'package:untitled/word.dart';

class WordListPage extends StatelessWidget {
  final List<Word> words;

  WordListPage({required this.words});

  @override
  Widget build(BuildContext context) {
    List<String> englishWords = words.map((word) => word.english).toList();
    List<String> turkishWords = words.map((word) => word.turkish).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kayıtlı Kelimeler',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'İngilizce',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.blueAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: englishWords.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.blueAccent[50],
                          elevation: 3,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(
                              englishWords[index],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blueAccent[700],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 1.2,
            color: Colors.grey[400],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Türkçe',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: turkishWords.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.deepPurple[50],
                          elevation: 3,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(
                              turkishWords[index],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.deepPurple[800],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
