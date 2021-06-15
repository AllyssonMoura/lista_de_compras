import 'package:flutter/material.dart';
import 'package:lista_de_compras/DAO/productDAO.dart';
import 'package:lista_de_compras/model/product.dart';
import 'package:lista_de_compras/shared/menu.dart';

class FormRegister extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar Produto"), actions: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset("assets/images/icone.png"))
      ]),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(children: [
            TextField(
                decoration: InputDecoration(labelText: "Produto"),
                keyboardType: TextInputType.name,
                controller: nameController),
            SizedBox(height: 10),
            TextField(
                decoration: InputDecoration(labelText: "Quantidade"),
                keyboardType: TextInputType.number,
                controller: quantityController),
            SizedBox(height: 10),
            TextField(
                decoration: InputDecoration(
                    labelText: "Tipo",
                    helperText:
                        "Açougue, padaria, hortifruti, laticínios ou derivados, higiene, etc"),
                keyboardType: TextInputType.text,
                controller: typeController),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  saveRegister(context);
                },
                child: Text("Adicionar"))
          ]),
        ),
      ),
    );
  }

  void saveRegister(BuildContext mainContext) async {
    String name = nameController.text;
    int quantity = int.parse(quantityController.text);
    String type = typeController.text;
    String message;
    Product product = Product(name: name, quantity: quantity, type: type);
    int result = await ProductDAO.insertRecord("products", product.toMap());

    if (result != 0) {
      message = "O produto foi adicionado a sua lista!";
    } else {
      message = "O produto não foi adicionado a sua lista!";
    }

    showDialog(
      context: mainContext,
      builder: (context) => AlertDialog(
        title: Text("Mensagem do Sistema"),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("OK"))
        ],
      ),
    );
  }
}
