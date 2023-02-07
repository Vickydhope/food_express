import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        title:  const Text(
          "Cart",
        ),
      ),
      body: Center(child: Text("Cart",style: Theme.of(context).textTheme.headline6,)),
    );
  }
}
