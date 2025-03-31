import 'package:flutter/cupertino.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({
    super.key,
    required this.name,
    required this.url
  }); // Porque se agrega esta parte?
  final String name;
  final String url;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [ // Por que el child se declara como un arreglo?
          Image.network(widget.url),
          Text(widget.name)
        ],),
    );
  }
}