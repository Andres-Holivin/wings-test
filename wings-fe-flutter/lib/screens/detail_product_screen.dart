import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/status_enum.dart';
import '../provider/check_out_provider.dart';
import '../provider/product_detail_provider.dart';

class DetailProductScreen extends StatefulWidget {
  const DetailProductScreen({super.key, required this.productCode});
  final String productCode;

  @override
  State<DetailProductScreen> createState() => _DetailProductScreenState();
}

class _DetailProductScreenState extends State<DetailProductScreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductDetailProvider>(context, listen: false)
          .getDetailProduct(code: widget.productCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        centerTitle: true,
      ),
      body: Consumer<ProductDetailProvider>(
        builder: (context, value, child) {
          if (value.status == Status.loading) {
            return const CircularProgressIndicator();
          }
          if (value.status == Status.failed) {
            return const Text("error");
          }
          if (value.detail != null) {
            return SafeArea(
                child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(radius: 42),
                    SizedBox(
                      height: 32,
                    ),
                    Text(value.detail['productname'],
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Price:"),
                        Text("${value.detail['price'].toString()}"),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Dimension:"),
                        Text(value.detail['dimension'].toString()),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Unit:"),
                        Text(value.detail['unit'].toString())
                      ],
                    ),
                    FilledButton(
                        onPressed: () {
                          context
                              .read<CheckOutProvider>()
                              .addProductToCart(product: value.detail);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Success add to cart'),
                          ));
                          Navigator.pop(context);
                        },
                        child: Text("Buy"))
                  ]),
            ));
          }
          return SizedBox();
        },
      ),
    );
  }
}
