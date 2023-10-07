import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<dynamic>
  final dio = Dio();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    request();
  }

  void request() async {
    Response response;
    try {
      response = await dio.get('http://127.0.0.1:8000/product');
      print(response.data.toString());
      var res = json.decode(response.data.toString()).toString();
      print(res);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("List Product")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                    children: List.generate(10, (index) {
                  return Product();
                })),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "check_out");
                },
                child: Text("CheckOut"))
          ],
        ),
      ),
    );
  }
}

class Product extends StatelessWidget {
  const Product({
    super.key,
  });

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Product",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Rp.10000" + ",-",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough, fontSize: 10),
                ),
                Text(
                  "Rp.10000",
                  style: TextStyle(fontSize: 12),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "detail_product");
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
