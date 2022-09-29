import 'package:flutter/material.dart';
import 'package:odev/models/Histories.dart';
import 'package:odev/models/brand.dart';
import 'package:odev/models/car_type.dart';
import 'package:odev/models/models.dart';
import 'package:odev/models/product.dart';
import 'package:odev/pages/auth/loginPage.dart';
import 'package:odev/pages/cargo/indexPage.dart';
import 'package:odev/pages/cart/indexPage.dart';
import 'package:odev/pages/product/edit.dart';
import 'package:odev/pages/product/editPage.dart';
import 'package:odev/pages/product/listPage.dart';
import 'package:odev/utils/brandsDbHelper.dart';
import 'package:odev/utils/carTypeDbHelper.dart';
import 'package:odev/utils/historiesDbhelper.dart';
import 'package:odev/utils/modelsDbHelper.dart';
import 'package:odev/utils/productDbHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _secilenTip = null;
  String? _secilenMarka = null;
  String? _secilenModel = null;
  List<CarType> _tumTipler = [];
  List<Brands> _tumMarka = [];
  List<Models> _tumModel = [];
  List<Histories> _history = [];
  //List<Products> products = [];

  CarTypeDbHelper carTypeDbHelper = CarTypeDbHelper();
  BrandsDbHelper brandsDbHelper = BrandsDbHelper();
  ModelsDbHelper modelsDbHelper = ModelsDbHelper();
  HistoriesDbHelper historiesDbHelper = HistoriesDbHelper();
  //ProductDbHelper productDbHelper = ProductDbHelper();

  @override
  void initState() {
    super.initState();
    getCarTypes();
    getBrands();
    getModels();
    getHistories();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade200,
          automaticallyImplyLeading: false,
          title: Text(
            'ANA SAYFA',
            style: TextStyle(color: Colors.blue),
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.blue,
            ),
            TextButton(
              style: style,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartPage()));
              },
              child: Icon(
                Icons.shopping_cart,
                color: Colors.blue,
              ),
            ),
            PopupMenuButton(
                color: Colors.blue.shade300,
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductListPage()));
                            },
                            child: Text("YEDEK PARÇA",
                                style: TextStyle(fontSize: 14))),
                      ),
                      PopupMenuItem(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                            },
                            child: const Text("KULLANICI GİRİŞLERİ",
                                style: TextStyle(fontSize: 14))),
                      ),
                      PopupMenuItem(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductEditPage()));
                            },
                            child: const Text("Ürün Düzenle",
                                style: TextStyle(fontSize: 14))),
                      ),
                      PopupMenuItem(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Cargo()));
                            },
                            child: const Text("Kargo Takip",
                                style: TextStyle(fontSize: 14))),
                      ),
                      PopupMenuItem(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Edit()));
                            },
                            child: const Text("Hakkımızda",
                                style: TextStyle(fontSize: 14))),
                      ),
                      PopupMenuItem(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Edit()));
                            },
                            child: const Text("Düzenle",
                                style: TextStyle(fontSize: 14))),
                      ),
                    ])
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'ARACINIZI SEÇİNİZ',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    'İNDİRİMLİ ÜRÜN',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: DropdownButton<String>(
                hint: Text('Araç Tipi Seçiniz'),
                icon: Icon(Icons.arrow_downward),
                underline: Container(
                  height: 4,
                  color: Colors.black,
                ),
                style: TextStyle(color: Colors.black),
                items: _tumTipler
                    .map((e) => DropdownMenuItem<String>(
                          child: Text(e.name),
                          value: e.id.toString(),
                        ))
                    .toList(),
                onChanged: (String? yeni) {
                  setState(() {});
                  _secilenTip = yeni;
                },
                value: _secilenTip,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    hint: Text('Marka seçiniz     '),
                    icon: Icon(Icons.arrow_downward),
                    underline: Container(
                      height: 4,
                      color: Colors.black,
                    ),
                    style: TextStyle(color: Colors.black),
                    items: _tumMarka
                        .map(
                          (Brands oankiMarka) => DropdownMenuItem<String>(
                            child: Text(oankiMarka.name),
                            value: oankiMarka.id.toString(),
                          ),
                        )
                        .toList(),
                    onChanged: (String? yeni1) {
                      setState(() {});
                      _secilenMarka = yeni1;
                    },
                    value: _secilenMarka,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 30,
                    ),
                    child: Image.asset(
                      "images/6.png",
                      height: 60,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: DropdownButton<String>(
                hint: Text('Model seçiniz      '),
                icon: Icon(Icons.arrow_downward),
                underline: Container(
                  height: 4,
                  color: Colors.black,
                ),
                style: TextStyle(color: Colors.black),
                items: _tumModel
                    .map(
                      (Models oankiModel) => DropdownMenuItem<String>(
                        child: Text(oankiModel.name),
                        value: oankiModel.id.toString(),
                      ),
                    )
                    .toList(),
                onChanged: (String? yeni2) {
                  setState(() {});
                  _secilenModel = yeni2;
                },
                value: _secilenModel,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: Image.asset(
                    "images/kart.png",
                    height: 50,
                  ),
                ),
                Text(
                  'SEFA KART İLE İNDİRİMİ YAKALA!!',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(

            
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _history
                    .map((e) => Image.asset(
                          "images/${e.images}",
                          height: 50,
                        ))
                    .toList()),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _history.map((e) => Text(e.name)).toList()),
            Center(
              child: Text(
                'EN ÇOK SATAN ÜRÜNLER',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "images/1.jpg",
                  height: 50,
                ),
                Image.asset(
                  "images/2.jpg",
                  height: 50,
                ),
                Image.asset(
                  "images/3.png",
                  height: 50,
                ),
                Image.asset(
                  "images/4.png",
                  height: 50,
                ),
              ],
            ),
            Center(
              child: Text(
                'PRATİK BİLGİLER',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Text('Triger seti değiştirmek araç ömrünü  uzatır '),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Text(
                        'Araçlarınızın zamanında bakımını yaptırmak daha az masraf yapmanızı sağlar'),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Text(
                        'Araç çalışmıyorken elektronik aletleri çalıştırmak genellikle akünün ömrünü kısaltır'),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Text(
                        'Her aracın belli bir devir aralığı vardır. Bunun nedeni ise araçtan yüksek performans almaktır.'),
                  ),
                ],
              ),
            ),
            Center(
              child: Text('KULLANICI YORUMLARI',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    child: Text('RECEP ŞEN:Ürünler kaliteli ve güvenli'),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Text(
                        'ALİ DOĞAN:Ürünlerde kolay değişim garantisi bulunmakta'),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Text('AYŞE EREN:   Çok fazla ürün çeşidi var'),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    child: Text('AHMET DOĞAN:Çok uygun fiyatlar'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Future getCarTypes() async {
    // await carTypeDbHelper.insertEntity(CarType('Otobüs'));
    //await helper.deleteEntity(0);
    // await helper.deleteEntity(0);
    var result = await carTypeDbHelper.getEntities();

    setState(() {
      _tumTipler = result.cast();
    });
  }

  Future getBrands() async {
    // await helper1.insertEntity(Brands('PEJO'));
    var result = await brandsDbHelper.getEntities();
    setState(() {
      _tumMarka = result.cast();
    });
  }

  Future getModels() async {
    // await modelsDbHelper.insertEntity(Models("207"));
    var result = await modelsDbHelper.getEntities();
    setState(() {
      _tumModel = result.cast();
    });
  }

  Future getHistories() async {
    //await historiesDbHelper.insertEntity(Histories("dacia", "dacia.png"));
//await historiesDbHelper.deleteEntity(1);
    var result = await historiesDbHelper.getEntities();
    setState(() {
      _history = result.cast();
    });
  }

 /* Future getProducts() async {
    // await helper3.insertEntity(Products("","",""));

    var result = await productDbHelper.getEntities();
    setState(() {
      products = result.cast();
    });
  }*/
}
