import 'package:flutter/material.dart';
import 'package:odev/pages/save/BrandSave.dart';
import 'package:odev/pages/save/CarTypeSave.dart';
import 'package:odev/pages/save/HistorieSave.dart';
import 'package:odev/pages/save/ProductSave.dart';
import 'package:odev/pages/save/modelSave.dart';

class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: const Text(
          'Kargo Takip',
          style: TextStyle(
              fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                 ElevatedButton(
                    onPressed: () {
Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HistorieSave()));

                    },
                    child: Text(
                      'TARİHÇE DÜZENLE',
                      style: TextStyle(color: Colors.blue.shade100),
                    )), 

                    ElevatedButton(
                    onPressed: () {
Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => BrandSave()));

                    },
                    child: Text(
                      'MARKA DÜZENLİ',
                      style: TextStyle(color: Colors.blue.shade100),
                    )), 
                                        ElevatedButton(
                    onPressed: () {
Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CarTypeSave()));

                    },
                    child: Text(
                      'ARAÇA TİPİ KAYDET',
                      style: TextStyle(color: Colors.blue.shade100),
                    )),
                     ElevatedButton(
                    onPressed: () {
Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ModelSave()));

                    },
                    child: Text(
                      'MODEL DÜZENLE',
                      style: TextStyle(color: Colors.blue.shade100),
                    )),
                     ElevatedButton(
                    onPressed: () {
Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductSave()));

                    },
                    child: Text(
                      'ÜRÜN DÜZENLE',
                      style: TextStyle(color: Colors.blue.shade100),
                    )),
                    
              
            ],
          ),
        ),
      ),
    );
  }
}
