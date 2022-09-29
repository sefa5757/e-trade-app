import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:odev/models/car_type.dart';
import 'package:odev/utils/carTypeDbHelper.dart';

class CarTypeSave extends StatefulWidget {
  CarTypeSave({Key? key}) : super(key: key);

  @override
  State<CarTypeSave> createState() => _CarTypeSave();
}

class _CarTypeSave extends State<CarTypeSave> {
  var nameController = TextEditingController();
  var helper = CarTypeDbHelper();
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
                  labelText: 'Car Type Name',
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
                    var entity = CarType(nameController.text);
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
