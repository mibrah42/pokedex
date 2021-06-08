import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemons.dart';

import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  void _handleTileClick(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          index: index,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F6),
      appBar: AppBar(
        title: const Text(
          'Pokedex',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Pokemon',
            letterSpacing: 1,
          ),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (context, _) => const Divider(
          height: 0.5,
          thickness: 0.5,
        ),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            onTap: () => _handleTileClick(context, index),
            key: ValueKey(pokemon.id),
            title: Text(pokemon.name),
            trailing: Column(
              children: [
                Text(
                  'HP',
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFb2bec3),
                      ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  pokemon.hitPoints.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 4,
                    color: Color(0xFF636e72),
                    fontFamily: 'Pokemon',
                  ),
                ),
              ],
            ),
            subtitle: Wrap(
              runSpacing: 4.0,
              spacing: 4.0,
              children: pokemon.types
                  .map(
                    (type) => Chip(
                      label: Text(type),
                      backgroundColor: const Color(0xFFdfe6e9),
                    ),
                  )
                  .toList(),
            ),
            leading: Image.asset(
              'assets/images/small/${pokemon.id}.png',
            ),
          );
        },
      ),
    );
  }
}
