import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      	appBar: AppBar(
       title: Text('Startup Name Generator'),
       actions: <Widget>[
         IconButton(
           onPressed: _pushSaved,
          icon: Icon(Icons.list))
       ],
       ),
      body: _buildSuggestions(),
  );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = 
          _savedWordPairs.map((WordPair pair) { 
            return ListTile(
              title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)),
            );
            });

            final List<Widget> divided = ListTile.divideTiles(
              context: context,
              tiles: tiles
              ).toList();

              return Scaffold(
                appBar: AppBar(
                    title: Text('Saved WordPairs'),

                  ),
                body: ListView(children: divided,),
              );

        }
        )
    );
  }

  Widget _buildSuggestions() {
  return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return const Divider(); /*2*/

        final index = i ~/ 2; /*3*/
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10)); /*4*/
        }
        return _buildRow(_suggestions[index]);
      });
  }
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWordPairs.contains(pair);
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerFont,
    ),
      trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border, color: alreadySaved ? Colors.red : null,),
      onTap: () {
        setState(() {
          if(alreadySaved){
            _savedWordPairs.remove(pair);
  
          }else {
            _savedWordPairs.add(pair);
          }
        });
      },
      
  );
  }
}



