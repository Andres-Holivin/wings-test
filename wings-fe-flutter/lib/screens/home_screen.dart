import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wings/models/status_enum.dart';
import 'package:wings/provider/home_provider.dart';
import 'package:wings/provider/login_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeProvider>(context, listen: false).getProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("List Product")),
      body: SafeArea(
        child: Consumer<HomeProvider>(builder: (context, value, child) {
          if (value.status == Status.loading) {
            return const CircularProgressIndicator();
          }
          if (value.status == Status.failed) {
            return const Text("error");
          }
          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(value.product.length, (index) {
                    return Product(product: value.product[index]);
                  })),
                ),
              ),
              Column(
                children: [
                  Divider(),
                  FilledButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "check_out");
                      },
                      child: Text("CheckOut"))
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({super.key, required this.product});
  final Map<String, dynamic> product;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: CircleAvatar(radius: 40),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['productname'],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                product['discount'] != 0
                    ? Text(
                        "Rp.${product['price']},-",
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 10),
                      )
                    : SizedBox(),
                Text(
                  "Rp.${(product['price'] * (100 - product['discount']) / 100).floor()},-",
                  style: TextStyle(fontSize: 12),
                ),
                FilledButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, "detail_product/${product['productcode']}");
                    },
                    child: Text("Buy"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
