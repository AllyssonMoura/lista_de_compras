import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/", (route) => false);
                },
                icon: Icon(Icons.shopping_cart_outlined),
                label: Text("Listar Produtos")),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/register", (route) => false);
                },
                icon: Icon(Icons.add_shopping_cart_outlined),
                label: Text("Adicionar Produto")),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/edit", (route) => false);
                },
                icon: Icon(Icons.edit_outlined),
                label: Text("Editar Produto")),
            TextButton.icon(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/remove", (route) => false);
                },
                icon: Icon(Icons.delete_outlined),
                label: Text("Remover Produto")),
          ],
        ),
      ),
    );
  }
}
