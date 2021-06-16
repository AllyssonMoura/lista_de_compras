import 'package:flutter/material.dart';
import 'package:lista_de_compras/model/product.dart';
import 'package:lista_de_compras/shared/menu.dart';
import 'package:lista_de_compras/style.dart';

class MainScreen extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final dynamic _data;
  late final List<Product> _products;

  MainScreen(this._data);

  @override
  Widget build(BuildContext context) {
    _products = prepareProducts(_data);
    return Scaffold(
      appBar: AppBar(title: Text("Meus Produtos"), actions: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset("assets/images/icone.png"))
      ]),
      drawer: Menu(),
      body: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: ListView.separated(
            itemBuilder: builder,
            separatorBuilder: (BuildContext context, int _) {
              return Divider(
                  color: greenDivider, thickness: 1, indent: 50, endIndent: 50);
            },
            itemCount: _products.length),
      ),
    );
  }

  Widget builder(BuildContext context, int index) {
    return ListTile(
      leading: Image.asset("assets/images/grocery.png"),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                Text("ID"),
                Text(_products.elementAt(index).id!.toString())
              ]),
              Column(children: [
                Text("Produto"),
                Text(_products.elementAt(index).name!)
              ]),
              Column(children: [
                Text("Tipo"),
                Text(_products.elementAt(index).type!)
              ]),
              Column(children: [
                Text("Quantidade"),
                Text(
                    "${_products.elementAt(index).quantity!.toString()} un./KG")
              ]),
            ],
          ),
        ],
      ),
    );
  }

  List<Product> prepareProducts(dynamic data) {
    List<Product> products = [];
    for (int index = 0; index < data.length; index++) {
      products.add(Product.toObject(data[index]));
    }
    return products;
  }
}
