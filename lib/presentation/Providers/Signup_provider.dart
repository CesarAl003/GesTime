import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestime/presentation/pages/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpProvider extends ChangeNotifier {
  Future<void> signIn(
      BuildContext context, String email, String contrasena) async {
    String mensaje = "";
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: contrasena);
    // Registro exitoso
    Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        mensaje = "Contraseña debil";
      } else if (e.code == 'email-already-in-use') {
        mensaje = "Cuenta ya existente";
      }
    }

    if (mensaje != "") {
      print(mensaje);
      Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
    notifyListeners();
  }
}
