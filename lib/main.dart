import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/data_source/pokemon_data_source.dart';
import 'package:flutter_pokedex/data/repositories/pokemon_repository.dart';
import 'package:flutter_pokedex/domain/use_cases/get_all_pokemon_useCase.dart';
import 'package:flutter_pokedex/presentation/screens/all_pokemon_screen.dart';
import 'package:flutter_pokedex/presentation/screens/get_all_pokemon_screen.dart';
import 'package:flutter_pokedex/presentation/widgets/pokemon_card.dart';
import 'package:http/http.dart' as http;

// Literalmente ejecuta la aplicacion
void main() {
  final httpClient = http.Client();
  final dataSource = PokemonDataSourceImp(client: httpClient);
  final repository = PokemonRepository(dataSource); // tu implementación
  final getAllPokemonUseCase = GetAllPokemonUseCase(pokemonRepository: repository);
  runApp(MyApp(getAllPokemonUseCase: getAllPokemonUseCase));
}

class MyApp extends StatelessWidget {
  final GetAllPokemonUseCase getAllPokemonUseCase;

  const MyApp({super.key, required this.getAllPokemonUseCase});

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
            body:  TabBarView(
                children: [
                  const MyHomePage(title: "HomePage"),
                  GetAllPokemonScreen(getAllPokemonUseCase: getAllPokemonUseCase)
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
