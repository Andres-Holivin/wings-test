import 'package:flutter/material.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: Column(children: [
          CircleAvatar(),
          Text("Product Name"),
          Text("Product Price"),
          Text("Dimension"),
          Text("price unit")
        ]),
      )),
    );
  }
}
