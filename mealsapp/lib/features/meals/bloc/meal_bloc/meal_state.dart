part of 'meal_bloc.dart';

class MealState {
  List<Meal>? meals;
  final MealStateStatus status;
    MealState({
    this.meals,
    required this.status,
  });


  MealState copyWith({
    List<Meal>? meals,
    MealStateStatus? status,
  }) {
    return MealState(
      meals: meals ?? this.meals,
      status: status ?? this.status,
    );
  }

}


