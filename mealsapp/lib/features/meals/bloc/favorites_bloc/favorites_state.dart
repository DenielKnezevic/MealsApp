part of 'favorites_bloc.dart';

class FavoritesState {
  List<Meal>? favorites;
  final FavoritesStateStatus status;
    FavoritesState({
    this.favorites,
    required this.status,
  });


  FavoritesState copyWith({
    List<Meal>? favorites,
    FavoritesStateStatus? status,
  }) {
    return FavoritesState(
      favorites: favorites ?? this.favorites,
      status: status ?? this.status,
    );
  }

}

