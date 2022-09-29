import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Container(
            child: Image.asset(
          "images/logo.png",
          height: 50,
        )),
        actions: [
          TextButton(
            style: style,
            onPressed: () {},
            child: const Text(
              'Sepetim',
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Table(border: TableBorder.all(), children: [
        TableRow(children: [
          Text(
            'No',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'ÜRÜN ADI',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('ÜRÜN FİYATI', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('#', style: TextStyle(fontWeight: FontWeight.bold)),
        ]),
        TableRow(children: [
          Text(
            '1',
          ),
          Text('Abs Disk'),
          Text('700'),
          Icon(Icons.delete)
        ]),
        TableRow(children: [
          Text('Direksiyon Simidi'),
          Text('Direksiyon'),
          Text('600'),
          Icon(Icons.delete)
        ]),
      ]),
    );
  }
}
