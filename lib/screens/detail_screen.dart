import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemons.dart';
import 'package:pokedex/utilities/constants.dart';

class DetailScreen extends StatelessWidget {
  final int index;

  const DetailScreen({
    Key? key,
    required this.index,
  }) : super(key: key);

  Widget _stat({
    required String label,
    required int value,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFFb2bec3),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          value.toString(),
          style: const TextStyle(
            color: Color(0xFF636e72),
            fontSize: 28,
            fontWeight: FontWeight.w400,
            letterSpacing: 4,
            fontFamily: 'Pokemon',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final pokemon = pokemons[index];

    return Scaffold(
      backgroundColor: kRedColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(width: double.infinity),
                Text(
                  pokemon.name,
                  style: const TextStyle(
                    fontFamily: 'Pokemon',
                    fontSize: 32,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Image.asset(
                  'assets/images/large/${pokemon.id}.png',
                ),
                const SizedBox(height: 32),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 16.0,
                        runSpacing: 8.0,
                        children: [
                          _stat(label: 'HP', value: pokemon.hitPoints),
                          _stat(label: 'ATTACK', value: pokemon.attack),
                          _stat(label: 'DEFENSE', value: pokemon.defense),
                          _stat(label: 'SPEED', value: pokemon.speed),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
