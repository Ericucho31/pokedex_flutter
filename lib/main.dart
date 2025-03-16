import 'package:flutter/material.dart';
import 'package:flutter_pokedex/presentation/screens/all_pokemon_screen.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_card.dart';

// Literalmente ejecuta la aplicacion
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home:  DefaultTabController(length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text("Flutter Pokedex"),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.directions_car)),
                  Tab(icon: Icon(Icons.directions_transit)),
                ],
              ),
            ),
            body:  const TabBarView(
                children: [
                  MyHomePage(title: "HomePage"),
                  AllPokemonScreen()
                ]
            ),
          )),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // SetState maneja el estado para que cambie el estado del componente
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Tod0 esto se ejecuta cada vez que setState se manda a llamar
    //
    // Esta onda es tan rapida que no hay problema que se ejecute toda de golpe
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Wrap(
          children: [
            PokemonCard(name: "Ditto", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png"),
            PokemonCard(name: "Ditto", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png"),
            PokemonCard(name: "Ditto", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png"),
            PokemonCard(name: "Ditto", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png"),
            PokemonCard(name: "Ditto", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png"),
            PokemonCard(name: "pepe", url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png")
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
