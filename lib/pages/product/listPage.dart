import 'package:flutter/material.dart';
import 'package:odev/models/product.dart';
import 'package:odev/utils/productDbHelper.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Products> products = [];
  ProductDbHelper productDbHelper = ProductDbHelper();

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          title: Image.asset(
            "images/logo.png",
            height: 50,
          ),
          actions: [
            TextButton(
              style: style,
              onPressed: () {},
              child: const Text(
                'ÜRÜNLER',
                style: TextStyle(fontSize: 24, color: Colors.blue),
              ),
            ),
          ],
        ),
        body: Wrap(
          alignment: WrapAlignment.start,
          children: products
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18),
                  child: Column(
                    children: [
                      Image.asset(
                        "images/${e.image}",
                        width: 100,
                        height: 100,
                      ),
                       Text(e.name),
                       Text("${e.price} \$")
                    ],
                  ),
                ),
              )
              .toList(),
        ));
  }

  Future getProducts() async {
    //await productDbHelper.insertEntity(Products("abs","300","1.jpg"));
    // await productDbHelper.insertEntity(Products("Disk","200","2.jpg"));
    // await productDbHelper.insertEntity(Products("Fren","500","3.png"));
    // await productDbHelper.insertEntity(Products("Vites","600","4.png"));
    //await productDbHelper.deleteEntity(3);
    var result = await productDbHelper.getEntities();
    setState(() {
      products = result.cast();
    });
  }
}
