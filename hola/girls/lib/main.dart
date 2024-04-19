// ignore_for_file: unused_local_variable

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'girls',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 158, 9, 228)),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

        
class MyHomePage extends StatelessWidget {
  get current => null;

  @override
  Widget build(BuildContext context) {
    var appState= context.watch<MyAppState>();
    // ignore: duplicate_ignore
    // ignore: unused_local_variable
    var pair = appState.current;

    return Scaffold(
      body: Center (
        child: Column (

        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('A random idea:'),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Text(appState.current.asLowerCase),

          ElevatedButton(
            onPressed: () {
              appState.getNext();
              print ('buttonpressed!');
            },
            child: Text ('Next'),
          ),
        ],
      ),
      ),
    );
  }
}
  
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
});
  final WordPair pair;
  
  get style => null;

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
   // final style = theme.textButtonTheme.displayMedium!.copyWith(
   //   color: theme.colorScheme.onPrimary,
   // );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        //change this line
        child: Text (
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
          ),
      ),
    );
  }
}

