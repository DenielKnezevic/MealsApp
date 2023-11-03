import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealsapp/features/meals/presentation/meal_item.dart';

import '../bloc/favorites_bloc/favorites_bloc.dart';
import '../domain/favorites_state_status.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavoritesBloc>().add(FavoritesLoadEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc,FavoritesState>(builder: (context, state){
      if(state.status == FavoritesStateStatus.initial || state.status == FavoritesStateStatus.loading){
        return const Center(child: CircularProgressIndicator(),);
      }
      else{
        return ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: state.favorites!.length,
        itemBuilder: (context, index) {
          return MealItem(meal:state.favorites![index]);
        });
      }
    });
  }
}