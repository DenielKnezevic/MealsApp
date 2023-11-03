import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mealsapp/features/meals/bloc/meal_bloc/meal_bloc.dart';

import '../domain/category.dart';
import '../domain/meal.dart';
import '../domain/meal_state_status.dart';
import 'meal_item.dart';

class Mealss extends StatefulWidget {
  Mealss({this.category, super.key,});
  static const routeName = '/meals';
  Category? category;

  @override
  State<Mealss> createState() => _MealssState();
}
class _MealssState extends State<Mealss> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MealBloc>().add(MealLoadEvent(category: widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation : 0.0,
        title: const Text('Meals'),
      ),
      body: BlocBuilder<MealBloc,MealState>(builder: (context, state){
        if(state.status == MealStateStatus.initial || state.status == MealStateStatus.loading){
          return const Center(child: CircularProgressIndicator(),);
        }else if(state.status == MealStateStatus.error){
          return const Center(child: Text('Error'),);
        }else{
          return ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: state.meals?.length,
        itemBuilder: (context, index) {
        return MealItem(meal: state.meals![index]);
      });}}
    ));}
}