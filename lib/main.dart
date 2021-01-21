import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

/*1 mainメソッド*/
void main() => runApp(MyApp());

/*2 StatelessWidget*/
class MyApp extends StatelessWidget {
  @override
  /*3 build()メソッド*/
  Widget build(BuildContext context) {
    /*4 Material Design*/
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  } // build
} // StatelessWidget

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  } // build

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]); /*5*/
        });
  } // _buildSuggestions

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  } // _buildRow

}

/* StatefulWidget */
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}
