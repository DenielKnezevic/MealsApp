import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapp/startup/service_providers/bloc_providers.dart';
import 'package:mealsapp/startup/tabs.dart';

import '../features/meals/presentation/meals.dart';

class Application extends StatelessWidget {
   Application({super.key});

  var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 18, 189, 166),
);

  @override
  Widget build(BuildContext context) {
    return ContextProviderBloc(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes:{
            Mealss.routeName: (context) => Mealss(),
          } ,
          home: const TabsScreen(),
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: kDarkColorScheme,
            textTheme: GoogleFonts.latoTextTheme(),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              elevation: 30,
              selectedItemColor: kDarkColorScheme.primary,
            ),
          )),
    );
  }
}
