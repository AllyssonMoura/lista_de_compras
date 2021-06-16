import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:lista_de_compras/screens/home/listOfProducts.dart';
import 'package:lista_de_compras/screens/registers/form_edit.dart';
import 'package:lista_de_compras/screens/registers/form_register.dart';
import 'package:lista_de_compras/screens/registers/form_remove.dart';

void main() {
  if (Platform.isAndroid) {
    runApp(MaterialApp(
      title: "Lista de Compras",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => ListOfProducts(),
        "/register": (BuildContext context) => FormRegister(),
        "/edit": (BuildContext context) => FormEdit(),
        "/remove": (BuildContext context) => FormRemove(),
      },
      theme: ThemeData(
          primarySwatch: MaterialColor(0xFFFFDAB9, {
            50: Color(0xFFFFFEFC),
            100: Color(0xFFFFFCF8),
            200: Color(0xFFFFF6EE),
            300: Color(0xFFFFF0E3),
            400: Color(0xFFFFE6CE),
            500: Color(0xFFFFDAB9),
            600: Color(0xFFE3C3A5),
            700: Color(0xFF99836F),
            800: Color(0xFF736354),
            900: Color(0xFF4A4036),
          }),
          inputDecorationTheme:
              InputDecorationTheme(border: OutlineInputBorder())),
    ));
  } else {
    runApp(CupertinoApp());
  }
}
