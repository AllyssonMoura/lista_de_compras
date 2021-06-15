import 'package:flutter/material.dart';
import 'package:lista_de_compras/DAO/productDAO.dart';
import 'package:lista_de_compras/screens/home/widgets/main_screen.dart';

class ListOfProducts extends StatefulWidget {
  @override
  _ListOfProductsState createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ProductDAO.listRecords("products"), builder: builder);
  }

  Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return Scaffold(body: Center(child: CircularProgressIndicator()));
      default:
        return MainScreen(snapshot.data);
    }
  }
}
