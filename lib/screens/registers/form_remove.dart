import 'package:flutter/material.dart';
import 'package:lista_de_compras/DAO/productDAO.dart';
import 'package:lista_de_compras/model/product.dart';
import 'package:lista_de_compras/shared/menu.dart';

class FormRemove extends StatelessWidget {
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Remover Produto"), actions: [
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
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    removeRecord(context);
                  },
                  child: Text("Remover"),
                  style: ElevatedButton.styleFrom(primary: Colors.red))
            ],
          ),
        ),
      ),
    );
  }

  void removeRecord(BuildContext mainContext) async {
    int _id = int.parse(idController.text);
    late String message;

    Product product = Product(id: _id);
    int _result = await ProductDAO.removeRecord("products", product.id!);

    if (_result != 0) {
      message = "O produto foi removido da sua lista!";
    } else {
      message = "O produto não foi removido da sua lista!";
    }

    showDialog(
      context: mainContext,
      builder: (BuildContext builder) => AlertDialog(
        title: Text("Mensagem do Sistema"),
        content: Text(message),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(mainContext);
              },
              child: Text("OK")),
        ],
      ),
    );
  }
}
