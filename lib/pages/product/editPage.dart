import 'package:flutter/material.dart';

class ProductEditPage extends StatelessWidget {
  const ProductEditPage({Key? key}) : super(key: key);

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
              'Ürün Düzenle',
              style: TextStyle(fontSize: 24, color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Table(border: TableBorder.all(), children: [
        TableRow(children: [
          Text(
            'Ürün Adı',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Kategori',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text('Ürün Fiyatı', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Ürün Resim ', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('#', style: TextStyle(fontWeight: FontWeight.bold)),
        ]),
        TableRow(children: [
          Text(
            'Abs Disk',
          ),
          Text('Abs'),
          Text('700'),
          Text('1.jpg'),
          Container(
              child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(primary: Colors.blue.shade400),
            child: Text(
              'Edit   ' + 'Delete   ' + 'Details',
              style: TextStyle(
                  decoration: TextDecoration.underline, color: Colors.black54),
            ),
          ))
        ]),
        TableRow(children: [
          Text('Direksiyon Simidi'),
          Text('Direksiyon'),
          Text('600'),
          Text('2.jpg'),
          Container(
              child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(primary: Colors.blue.shade400),
            child: Text(
              'Edit   ' + 'Delete   ' + 'Details',
              style: TextStyle(
                  decoration: TextDecoration.underline, color: Colors.black54),
            ),
          ))
        ]),
      ]),
    );
  }
}
