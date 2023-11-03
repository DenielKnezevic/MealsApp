import 'package:flutter/material.dart';

import '../domain/meal.dart';
import 'meals_details.dart';

class MealItem extends StatelessWidget {
  const MealItem({required this.meal, super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:EdgeInsets.symmetric(vertical:6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MealDetails(meal: meal)));
        },
        child: Stack(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 44,
                ),
                child: Text(
                  meal.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  )
                )
              )
            )
          ]
        ),
      ),
    );
  }
}