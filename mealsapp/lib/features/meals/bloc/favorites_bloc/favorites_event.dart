part of 'favorites_bloc.dart';

abstract class FavoritesEvent {}

class FavoritesLoadEvent extends FavoritesEvent {}

class FavoritesAddEvent extends FavoritesEvent {
  final Meal meal;
  FavoritesAddEvent({required this.meal});
}

class FavoritesRemoveEvent extends FavoritesEvent {
  final Meal meal;
  FavoritesRemoveEvent({required this.meal});
}
