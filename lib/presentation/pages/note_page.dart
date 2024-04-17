import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestime/presentation/pages/login_page.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            salirmeAlaChibgada(context);
          },
          child: const Text('salirme a la chingada de aqui'),
        ),
      ),
    );
  }

  Future<void> salirmeAlaChibgada(BuildContext context) async {

    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
  }
}
