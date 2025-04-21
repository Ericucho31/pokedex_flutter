import 'package:flutter/material.dart';
import 'package:flutter_pokedex/presentation/screens/get_all_pokemon_screen.dart';
import 'di/injection_container.dart' as di;

// Literalmente ejecuta la aplicacion
void main() async {
  await di.init();
  runApp(MyApp());
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
                  Tab(icon: Icon(Icons.directions_transit)),
                ],
              ),
            ),
            body:  TabBarView(
                children: [
                  GetAllPokemonScreen()
                ]
            ),
          )),
    );
  }
}
