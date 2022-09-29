import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odev/models/car_type.dart';
import 'package:odev/models/product.dart';
import 'package:odev/utils/carTypeDbHelper.dart';
import 'package:odev/utils/productDbHelper.dart';

class ProductSave extends StatefulWidget {
  ProductSave({Key? key}) : super(key: key);

  @override
  State<ProductSave> createState() => _ProductSave();
}

class _ProductSave extends State<ProductSave> {
  var nameController = TextEditingController();
var imagesController = TextEditingController();
var priceController = TextEditingController();


  var helper = ProductDbHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: const Text(
          'Hakkımızda',
          style: TextStyle(
              fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Center(
                    child: Image.asset(
                  "images/logo.png",
                  height: 100,
                  width: 100,
                )),
              ),
              TextFormField(
                controller: nameController,
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'Ürün adı',
                  labelStyle: TextStyle(
                      color: Colors.blue.shade500,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  suffixIcon: const Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
                            TextFormField(
                controller: imagesController,
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'İmages',
                  labelStyle: TextStyle(
                      color: Colors.blue.shade500,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  suffixIcon: const Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
                            TextFormField(
                controller: priceController,
                cursorColor: Theme.of(context).cursorColor,
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'Price',
                  labelStyle: TextStyle(
                      color: Colors.blue.shade500,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  suffixIcon: const Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    var entity = Products(nameController.text,priceController.text,imagesController.text);
                    helper.insertEntity(entity);
                    Navigator.pop(context);
                  },
                  child: const Text("SAVE"))
            ],
          ),
        ),
      ),
    );
  }
}
