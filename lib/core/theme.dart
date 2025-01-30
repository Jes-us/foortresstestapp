import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF121212), // Fondo oscuro
  primaryColor: Color(0xFF1DB954), // Color primario
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF1DB954), // Botones y elementos principales
    secondary: Color(0xFFBB86FC), // Color para detalles y elementos secundarios
    background: Color(0xFF121212), // Color de fondo general
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color(0xFF121212),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xFF1DB954),
    textTheme: ButtonTextTheme.primary,
  ),
);
