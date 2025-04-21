
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/di/injection_container.dart';
import 'package:flutter_pokedex/presentation/screens/detail_pokemon_screen.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({
    super.key,
    required this.id,
    required this.name,
    required this.url
  });
  final int id;
  final String name;
  final String url;


  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {

  @override
  Widget build(BuildContext context) {
    return Material(

      child: Card(
        color: Color(0xFF0083C2),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(context, 
            CupertinoPageRoute(builder: (_) => DetailPokemonScreen(pokemonId: widget.id, getDetailsPokemonUseCase: inject(),))
            );
          },
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.network(
                    widget.url,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.blueAccent,
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("#${widget.id.toString()} "), Text(widget.name)],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}