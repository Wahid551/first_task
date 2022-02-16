import 'package:first_task/Screens/MainScreens/Home/HomePage.dart';
import 'package:first_task/services/timer_provider.dart';
import 'package:first_task/services/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiServiceProvider>(
          create: (context) => ApiServiceProvider(),
        ),
        ChangeNotifierProvider<PeriodicTimerProvider>(
          create: (context) => PeriodicTimerProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
