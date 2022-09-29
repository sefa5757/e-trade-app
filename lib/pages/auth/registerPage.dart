import 'package:flutter/material.dart';
import 'package:odev/pages/auth/loginPage.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: Text(
          'KAYIT OL',
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
                padding: const EdgeInsets.only(top: 0, bottom: 0),
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
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                initialValue: 'example@hotmail.com',
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      color: Colors.blue.shade500,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                initialValue: '**********',
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                  labelStyle: TextStyle(
                      color: Colors.blue.shade500,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                initialValue: '**********',
                maxLength: 20,
                decoration: InputDecoration(
                  labelText: 'Şifre Tekrarı',
                  labelStyle: TextStyle(
                      color: Colors.blue.shade500,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  suffixIcon: Icon(
                    Icons.check_circle,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                    },
                    child: Text(
                      'KAYIT OL',
                      style: TextStyle(color: Colors.blue.shade100),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    (Container(
                      child: Text('Zaten Bir Hesabım var ',
                          style: TextStyle(color: Colors.black38)),
                    )),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                        },
                        child: Text(
                          'Giriş Yap',
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
