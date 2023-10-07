import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Check Out"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("Total Price: "),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: List.generate(10, (index) => Product()),
              ),
            )),
            TextButton(onPressed: () {}, child: Text("Confirm"))
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10)),
                          )),
                      Expanded(
                        flex: 8,
                        child: Text(
                          " x Rp.10000",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Sub Total:",
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
