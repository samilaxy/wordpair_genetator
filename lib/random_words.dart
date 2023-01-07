import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final randomWordPair = <WordPair>[];
  final savedWordPairs = Set<WordPair>();
  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, item) {
          if (item.isOdd) return Divider();
          final index = item ~/ 2;
          if (index >= randomWordPair.length) {
            randomWordPair.addAll(generateWordPairs().take(10));
          }
          return _buildRow(randomWordPair[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final savedAlready = savedWordPairs.contains(pair);
    return ListTile(
        title: Text(pair.asPascalCase, style: TextStyle(fontSize: 18.0)),
        trailing: Icon(savedAlready ? Icons.favorite : Icons.favorite_border,
            color: savedAlready ? Colors.red : null),
        onTap: () {
          setState(() {
            if (savedAlready) {
              savedWordPairs.remove(pair);
            } else {
              savedWordPairs.add(pair);
            }
          });
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('WordPair Generator')),
      body: _buildList(),
    );
  }
}
