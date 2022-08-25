import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

final theme= ThemeData(
primaryColor: HexColor("#1ABC00"),
scaffoldBackgroundColor: Colors.white,
appBarTheme: const AppBarTheme(
systemOverlayStyle: SystemUiOverlayStyle(
statusBarBrightness: Brightness.dark,
statusBarColor: Colors.grey,
),
iconTheme: IconThemeData(
color: Colors.black,
),
backgroundColor: Colors.white,
elevation: 0.0,
),
bottomNavigationBarTheme:  BottomNavigationBarThemeData(
backgroundColor: Colors.white,
  showUnselectedLabels: true,
  showSelectedLabels: false,
type: BottomNavigationBarType.fixed,
elevation: 0.0,
selectedItemColor: HexColor("#1ABC00"),
unselectedItemColor: Colors.deepOrangeAccent,
selectedIconTheme: IconThemeData(size: 50),
),
primarySwatch: Colors.grey,
textTheme:  const TextTheme(
bodyText1: TextStyle(
color: Colors.black,
fontSize: 14,
fontWeight: FontWeight.bold,
),
)
);
