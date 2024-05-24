import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sample/model/history.dart';
import 'package:sample/provider/calc_provider.dart';
import 'package:sample/utils/imports.dart';
import 'package:sample/views/calculator.dart';
import 'package:sample/views/history_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryItemAdapter());
  await Hive.openBox<HistoryItem>('history');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorProvider>(
      create: (_) => CalculatorProvider(),
      child: MaterialApp(
        title: 'Calculator App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          appBarTheme: AppBarTheme(
            color: backgroundColor,
            elevation: 0.0,
          ),
          textTheme: TextTheme(
            displaySmall: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 30,
              color: Colors.white,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
              fontSize: 18.0,
            ),
          ),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: yellowColor),
        ),
        routes: {
          '/': (context) => Calculator(),
          '/history': (context) => History(),
        },
      ),
    );
  }
}
