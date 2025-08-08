import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/pokemon_cards_demo_screen.dart';
import 'package:notes_app/theme/app_colors.dart';

import 'package:notes_app/views/notes_view.dart';

import 'cubits/notes_cubit/notes_cubit.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const PokemonApp());
}

class PokemonApp extends StatelessWidget {
  const PokemonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokédex Cards Demo',
        theme: ThemeData(
          brightness: Brightness.light,
          fontFamily: 'Poppins',
          primarySwatch: MaterialColor(
            AppColors.primary.value,
            <int, Color>{
              50: AppColors.primaryLight.withOpacity(0.1),
              100: AppColors.primaryLight.withOpacity(0.2),
              200: AppColors.primaryLight.withOpacity(0.3),
              300: AppColors.primaryLight.withOpacity(0.4),
              400: AppColors.primaryLight.withOpacity(0.5),
              500: AppColors.primary,
              600: AppColors.primaryDark.withOpacity(0.8),
              700: AppColors.primaryDark.withOpacity(0.9),
              800: AppColors.primaryDark,
              900: AppColors.primaryDark.withOpacity(1.1),
            },
          ),
          colorScheme: ColorScheme.light(
            primary: AppColors.primary,
            secondary: AppColors.secondary,
            background: AppColors.background,
            surface: AppColors.surface,
          ),
          scaffoldBackgroundColor: AppColors.background,
        ),
        // You can switch between the Pokemon demo and original notes app
        home: const PokemonCardsDemoScreen(),
        // home: const NotesView(), // Uncomment this to see the original notes app
        routes: {
          '/notes': (context) => const NotesView(),
          '/pokemon': (context) => const PokemonCardsDemoScreen(),
        },
      ),
    );
  }
}
