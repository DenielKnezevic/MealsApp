part of 'meal_bloc.dart';

abstract class MealEvent {}

class MealLoadEvent extends MealEvent {
  Category? category;
  MealLoadEvent({this.category});
}


