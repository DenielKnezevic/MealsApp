import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/favorites_state_status.dart';
import '../../domain/meal.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc()
      : super(FavoritesState(status: FavoritesStateStatus.initial)) {
    on<FavoritesLoadEvent>(_loadFavorites);
    on<FavoritesAddEvent>(_addFavorite);
    on<FavoritesRemoveEvent>(_removeFavorite);
  }

  Future<List<Meal>> _loadFavorites(
      FavoritesLoadEvent event, Emitter emit) async {
    emit(state.copyWith(status: FavoritesStateStatus.loading));
    var favorites = Meal.favoriteMeals;
    emit(state.copyWith(
        status: FavoritesStateStatus.loaded, favorites: favorites));
    return favorites;
  }

  Future<bool> _addFavorite(FavoritesAddEvent event, Emitter emit) async {
    if (!state.favorites!.contains(event.meal)) {
      Meal.favoriteMeals.add(event.meal);
      add(FavoritesLoadEvent());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> _removeFavorite(FavoritesRemoveEvent event, Emitter emit) async {
    Meal.favoriteMeals.remove(event.meal);
    add(FavoritesLoadEvent());
    return true;
  }
}
