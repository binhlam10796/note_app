import 'package:flutter/material.dart';
import '../widgets/common_app_bar.dart';
import '../widgets/pokemon_card.dart';
import '../theme/app_colors.dart';

class PokedexGridScreen extends StatefulWidget {
  const PokedexGridScreen({Key? key}) : super(key: key);

  @override
  State<PokedexGridScreen> createState() => _PokedexGridScreenState();
}

class _PokedexGridScreenState extends State<PokedexGridScreen> {
  List<Map<String, dynamic>> pokemonList = [];
  String currentFilter = '';
  String currentSort = '';

  @override
  void initState() {
    super.initState();
    pokemonList = PokemonData.getSamplePokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CommonAppBar(
        title: 'Pokédex',
        onSortPressed: () => _handleSort(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns as shown in Figma
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8, // Adjust based on card design
          ),
          itemCount: pokemonList.length,
          itemBuilder: (context, index) {
            final pokemon = pokemonList[index];
            return PokemonCard(
              name: pokemon['name'],
              imageAsset: pokemon['image'],
              types: List<String>.from(pokemon['types']),
              backgroundColor: pokemon['color'],
            );
          },
        ),
      ),
    );
  }

  void _handleSort() {
    // This will be called when sort button is pressed
    // The CommonAppBar already handles showing the sort options
    // Here you could implement the actual sorting logic
    setState(() {
      // Example sorting logic - you can implement actual sorting here
      currentSort = 'name_asc';
      pokemonList.sort((a, b) => a['name'].compareTo(b['name']));
    });
  }

  void _applySorting(String sortType) {
    setState(() {
      currentSort = sortType;
      switch (sortType) {
        case 'name_asc':
          pokemonList.sort((a, b) => a['name'].compareTo(b['name']));
          break;
        case 'name_desc':
          pokemonList.sort((a, b) => b['name'].compareTo(a['name']));
          break;
        case 'number_asc':
          // Assuming you have pokemon numbers in your data
          // pokemonList.sort((a, b) => a['number'].compareTo(b['number']));
          break;
        case 'number_desc':
          // pokemonList.sort((a, b) => b['number'].compareTo(a['number']));
          break;
      }
    });
  }

  void _applyFilter(String filterType) {
    setState(() {
      currentFilter = filterType;
      // Implement filtering logic here based on the filter type
      // For now, just reset to original list
      pokemonList = PokemonData.getSamplePokemon();
    });
  }
}