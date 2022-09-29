import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odev/models/Histories.dart';
import 'package:odev/models/brand.dart';
import 'package:odev/models/car_type.dart';
import 'package:odev/models/models.dart';
import 'package:odev/utils/brandsDbHelper.dart';
import 'package:odev/utils/carTypeDbHelper.dart';
import 'package:odev/utils/historiesDbhelper.dart';
import 'package:odev/utils/modelsDbHelper.dart';

class BrandSave extends StatefulWidget {
  BrandSave({Key? key}) : super(key: key);

  @override
  State<BrandSave> createState() => _BrandSave();
}

class _BrandSave extends State<BrandSave> {
  var nameController = TextEditingController();

  var helper = BrandsDbHelper();
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
                  labelText: 'Model ',
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
                    var entity = Brands(nameController.text);
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
