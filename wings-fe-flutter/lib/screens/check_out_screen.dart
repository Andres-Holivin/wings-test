import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wings/provider/check_out_provider.dart';

import '../models/status_enum.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
        centerTitle: true,
      ),
      body: Consumer<CheckOutProvider>(builder: (context, value, child) {
        if (value.status == Status.loading) {
          return const CircularProgressIndicator();
        }
        if (value.status == Status.failed) {
          return const Text("error");
        }
        return SafeArea(
          child: Column(
            children: [
              Text("Total Price: "),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      value.cart.length,
                      (index) => Product(
                            product: value.cart[index],
                          )),
                ),
              )),
              TextButton(onPressed: () {}, child: Text("Confirm"))
            ],
          ),
        );
      }),
    );
  }
}

class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.product,
  });
  final dynamic product;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: const CircleAvatar(radius: 40),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['productname'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(product['quantity'].toString(),
                          style: TextStyle(fontSize: 12)),
                      // Expanded(
                      //     flex: 2,
                      //     child: TextField(
                      //       keyboardType: TextInputType.number,
                      //       decoration: InputDecoration(
                      //           contentPadding: EdgeInsets.symmetric(
                      //               horizontal: 10, vertical: 10)),
                      //     )),
                      Expanded(
                        flex: 8,
                        child: Text(
                          " x Rp.${(product['price'] * (100 - product['discount']) / 100).floor()},-",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Sub Total: ${product['quantity'] * (product['price'] * (100 - product['discount']) / 100).floor()}",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
