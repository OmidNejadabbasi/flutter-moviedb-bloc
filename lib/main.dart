import 'package:flutter/material.dart';
import 'package:movies_app/data/json/movie_json.dart';
import 'package:movies_app/presentation/screen/home_screen/home_screen.dart';
import 'package:movies_app/presentation/screen/movie_detail_screen/movie_detail_screen.dart';
import 'package:movies_app/presentation/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          textTheme: TextTheme(bodyMedium: baseTextStyle)),
      home: const HomeScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case MovieDetailScreen.route:
            return MaterialPageRoute(
              builder: (context) =>
                  MovieDetailScreen(movieJson: settings.arguments as MovieJson),
            );
        }
        return null;
      },
    );
  }
}
