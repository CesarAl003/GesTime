import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestime/presentation/pages/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginProvider extends ChangeNotifier {
  Future<void> signIn(BuildContext context, String email, String contrasena) async {
    String mensaje = "";
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: contrasena);
      // Autenticación exitosa
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        mensaje = "Usuario no encontrado";
      } else if (e.code == 'wrong-password') {
        mensaje = "Contraseña incorrecta";
      } else {
        mensaje = 'Algo salio mal';
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
