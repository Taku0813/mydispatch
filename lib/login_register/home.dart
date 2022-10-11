import 'package:flutter/material.dart';
import 'create_employee.dart';
import 'create_outsider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainPage extends StatefulWidget {
 const MainPage({Key? key}) : super(key: key);

 @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  User? user;

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:
      Container(
        child:SingleChildScrollView(
         child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Image.asset('assets/images/logo.jpg'),
              ),
              Container(
                child: Center(
                  child: Column(
                  children:
                  [TextField
                    (enabled: true,
                    style: TextStyle(color: Colors.black),
                    obscureText: false,
                    maxLines:1 ,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.mail_lock_outlined),
                      hintText: 'メールアドレスを入力してください',
                      labelText: 'Email *',
                    ),),
                    Padding(padding: EdgeInsets.all(10.0))
                  ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    children:
                    [TextField
                      (enabled: true,
                      style: TextStyle(color: Colors.black),
                      obscureText: false,
                      maxLines:1 ,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.security_outlined),
                        hintText: 'パスワードを入力してください',
                        labelText: 'Password *',
                      ),),
                      Padding(padding: EdgeInsets.all(10.0))
                    ],
                  ),
                ),
              ),
              ButtonBar(
                buttonPadding: EdgeInsets.all(30.0),
                  children:[ElevatedButton(
                      onPressed: () =>login('taku08132001@icloud.com', 'taku0813'),
                      child: Text('log in'))]),
              ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/new_employee'), child: Text('社員向け新規登録')),
              ElevatedButton(onPressed: () => Navigator.of(context).pushNamed('/new_outsider'), child: Text('お客様向け新規登録')),
              TextButton(onPressed: () => Navigator.of(context).pushNamed('/miss_password'), child: Text('パスワードをお忘れの方はこちら')),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
void login(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}
