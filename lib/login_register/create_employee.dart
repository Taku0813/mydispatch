import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewEmployee extends StatefulWidget {
  @override
  _NewEmployeeState createState() => _NewEmployeeState();
}

class _NewEmployeeState extends State<NewEmployee> {

  String _text = '';

  void _handleText(String e) {
    setState(() {
      _text = e;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Create New Users'),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              "$_text",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500
              ),
            ),
            TextField(
              enabled: true,
              style: TextStyle(color: Colors.black),
              obscureText: false,
              maxLines:1 ,
              decoration: const InputDecoration(
                icon: Icon(Icons.face),
                hintText: '名前を入力してください',
                labelText: 'Name *',
              ),
              //パスワード
              onChanged: _handleText,
            ),
             TextField(
              enabled: true,
              style: TextStyle(color: Colors.black),
              obscureText: false,
              maxLines:1 ,
              decoration: const InputDecoration(
                icon: Icon(Icons.factory),
                hintText: '所属を入力してください',
                labelText: 'Affiliation *',
              ),
              onChanged: _handleText,
            ),
             TextField(
              enabled: true,
              style: TextStyle(color: Colors.black),
              obscureText: false,
              maxLines:1 ,
              decoration: const InputDecoration(
                icon: Icon(Icons.fire_truck_outlined),
                hintText: '担当トラックを入力してください',
                labelText: 'Truck *',
              ),
              onChanged: _handleText,
            ),
             TextField(
              enabled: true,
              style: TextStyle(color: Colors.black),
              obscureText: false,
              maxLines:1 ,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: '電話番号を入力してください',
                labelText: 'Phone *',
              ),
              onChanged: _handleText,
            ),
             TextField(
              enabled: true,
              style: TextStyle(color: Colors.black),
              obscureText: false,
              maxLines:1 ,
              decoration: const InputDecoration(
                icon: Icon(Icons.email),
                hintText: 'メールアドレスを入力してください',
                labelText: 'email *',
              ),
              onChanged: _handleText,
            ),
             TextField(
              enabled: true,
              style: TextStyle(color: Colors.black),
              obscureText: false,
              maxLines:1 ,
              decoration: const InputDecoration(
                icon: Icon(Icons.password),
                hintText: 'パスワードを入力してください',
                labelText: 'password *',
              ),
              onChanged: _handleText,
            ),
            ElevatedButton(
                onPressed: () => create(context, 'taku08132001@icloud.com','taku0813'),
                child: Text('Register')
            ),
          ],
        ),
      ),
    );
  }
}
 void create(BuildContext context, String email, String password) async {
   try {
     final credential = await FirebaseAuth.instance
         .createUserWithEmailAndPassword(
       email: email,
       password: password,
     );
     Navigator.of(context).pop();
   } on FirebaseAuthException catch (e) {
     if (e.code == 'weak-password') {
       print('The password provided is too weak.');
     } else if (e.code == 'email-already-in-use') {
       print('The account already exists for that email.');
     }
   } catch (e) {
     print(e);
   }
 }