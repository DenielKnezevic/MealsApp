import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/favorites_bloc/favorites_bloc.dart';
import '../domain/meal.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({super.key, required this.meal});
  static const String routeName = '/meal-details';

  final Meal meal;

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  bool isFavorite() {
    return context.read<FavoritesBloc>().state.favorites?.contains(widget.meal) ?? false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavoritesBloc>().add(FavoritesLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0.0,
            title: Text(widget.meal.title),
            actions: [
              IconButton(
                onPressed: () {
                  isFavorite()
                      ? context.read<FavoritesBloc>().add(
                            FavoritesRemoveEvent(meal: widget.meal),
                          )
                      : context.read<FavoritesBloc>().add(
                            FavoritesAddEvent(meal: widget.meal),
                          );
                },
                icon: isFavorite()
                    ? const Icon(Icons.star)
                    : const Icon(Icons.star_border),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  widget.meal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Ingredients',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer)),
                const SizedBox(
                  height: 10,
                ),
                for (var ingredient in widget.meal.ingredients)
                  Text(
                    ingredient,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Text('Steps',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer)),
                const SizedBox(
                  height: 10,
                ),
                for (var step in widget.meal.steps)
                  Text(
                    step,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
