import 'package:expence_tracker_app/widgets/expenses.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var kcolorscheme=ColorScheme.fromSeed(seedColor:const Color.fromARGB(255, 96, 59, 181));
var kDarkcolorscheme=ColorScheme.fromSeed(
   brightness: Brightness.dark,
  seedColor:const Color.fromARGB(255, 5, 99, 125),
  );

void main() {
  SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitUp
  ]
  ).then((fn){runApp(const MyApp());});
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme:kDarkcolorscheme,
         cardTheme:const CardTheme().copyWith(
          color: kDarkcolorscheme.secondaryContainer,
          margin:const EdgeInsets.symmetric(horizontal:16,vertical:8),
        ),
        elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkcolorscheme.primaryContainer,
            foregroundColor: kDarkcolorscheme.onPrimaryContainer,
          ), 
        ),
      ),

      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kcolorscheme,
        appBarTheme:const AppBarTheme().copyWith(
          backgroundColor: kcolorscheme.onPrimaryContainer,
          foregroundColor: kcolorscheme.primaryContainer,
        ),
        cardTheme:const CardTheme().copyWith(
          color: kcolorscheme.secondaryContainer,
          margin:const EdgeInsets.symmetric(horizontal:16,vertical:8),
        ),
        elevatedButtonTheme:ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorscheme.primaryContainer
          ),  
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: kcolorscheme.onSecondaryContainer,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          )
        ),
        ), 
        themeMode: ThemeMode.system,
      home:const Expenses(),
    );
  }
}
