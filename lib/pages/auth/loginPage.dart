import 'package:flutter/material.dart';
import 'package:odev/pages/auth/registerPage.dart';
import 'package:odev/pages/home/indexPage.dart';
import 'package:odev/pages/product/editPage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: const Text(
          'GİRİŞ YAP',
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
                cursorColor: Theme.of(context).cursorColor,
                initialValue: 'Input text',
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
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
                cursorColor: Theme.of(context).cursorColor,
                initialValue: 'Input text',
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'Şifre',
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Parolanızı Unuttunuz ?',
                        style: TextStyle(color: Colors.black38)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    },
                    child: Text(
                      'GİRİŞ YAP',
                      style: TextStyle(color: Colors.blue.shade100),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    (const Text('Üye Olmak İster Misiniz ?',
                        style: TextStyle(color: Colors.black38))),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const RegisterPage()));
                        },
                        child: Text(
                          'KAYIT OL',
                          style: TextStyle(color: Colors.blue.shade100),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
