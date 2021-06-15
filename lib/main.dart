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
          primarySwatch: MaterialColor(0xFF32CD32, {
            50: Color(0xFFF5FDF5),
            100: Color(0xFFEBFAEB),
            200: Color(0xFFCCF3CC),
            300: Color(0xFFABEBAB),
            400: Color(0xFF70DC70),
            500: Color(0xFF32CD32),
            600: Color(0xFF2DB72D),
            700: Color(0xFF1E7B1E),
            800: Color(0xFF175D17),
            900: Color(0xFF0F3C0F),
          }),
          inputDecorationTheme:
              InputDecorationTheme(border: OutlineInputBorder())),
    ));
  } else {
    runApp(CupertinoApp());
  }
}
