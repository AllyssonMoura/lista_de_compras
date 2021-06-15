import 'package:flutter/material.dart';
import 'package:lista_de_compras/DAO/productDAO.dart';
import 'package:lista_de_compras/model/product.dart';
import 'package:lista_de_compras/shared/menu.dart';

class FormEdit extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar Produto"), actions: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset("assets/images/icone.png"))
      ]),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                  decoration: InputDecoration(labelText: "ID do Produto"),
                  keyboardType: TextInputType.number,
                  controller: idController),
              SizedBox(height: 10),
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
                    saveRecord(context);
                  },
                  child: Text("Editar"))
            ],
          ),
        ),
      ),
    );
  }

  void saveRecord(BuildContext mainContext) async {
    int _id = int.parse(idController.text);
    String _name = nameController.text;
    int _quantity = int.parse(quantityController.text);
    String _type = typeController.text;
    late String message;
    Product product =
        Product(id: _id, name: _name, quantity: _quantity, type: _type);
    int _result = await ProductDAO.updateRecord("products", product.toMap());

    if (_result != 0) {
      message = "O produto foi atualizado na sua lista!";
    } else {
      message = "O produto não foi atualizado na sua lista!";
    }

    showDialog(
      context: mainContext,
      builder: (BuildContext context) => AlertDialog(
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
