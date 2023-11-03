import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealsapp/features/meals/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:mealsapp/features/meals/bloc/meal_bloc/meal_bloc.dart';

class ContextProviderBloc extends StatelessWidget {
   ContextProviderBloc({
    required this.child,
    super.key});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => FavoritesBloc()),
      BlocProvider(create: (context) => MealBloc())

    ], child: child);
  }
}