import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]),
        home: RandomWords());
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final RandomWordPair = <WordPair>[];
  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, item) {
          if (item.isOdd) return Divider();
          final index = item ~/ 2;
          if (index >= RandomWordPair.length) {
            RandomWordPair.addAll(generateWordPairs().take(10));
          }
          return _buildRow(RandomWordPair[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WordPair')),
      body: _buildList(),
    );
  }
}
