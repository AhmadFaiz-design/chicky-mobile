import 'package:chicky/widgets/test.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'widgets/bottom_navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;

  await initializeDateFormatting('id', null).then((_) => runApp(MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: BottomNavbar(index: 0),
    );
  }
}
