
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealsapp/features/meals/domain/meal_state_status.dart';

import '../../domain/category.dart';
import '../../domain/meal.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc() : super(MealState(status: MealStateStatus.initial)) {
    on<MealLoadEvent>(_loadMeals);
  }

  Future<List<Meal>> _loadMeals(MealLoadEvent event, Emitter emit) async {
    emit(state.copyWith(status: MealStateStatus.loading));
    var meals = Meal.dummyMeals.where((element) => element.categories.contains(event.category!.id)).toList();
    emit(state.copyWith(status: MealStateStatus.loaded, meals: meals));
    return meals;
  }
}
