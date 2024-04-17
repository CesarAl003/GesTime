import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestime/presentation/pages/checkEmail_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestime/presentation/pages/home_page.dart';
import 'package:gestime/presentation/pages/note_page.dart';

class SignUpProvider extends ChangeNotifier {
  Future<void> signIn(
      BuildContext context, String email, String contrasena) async {
    String mensaje = "";
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: contrasena);

      // Verificar si el correo electrónico ha sido verificado
      if (!credential.user!.emailVerified) {
        // Enviar correo de verificación
        await credential.user!.sendEmailVerification();
      }
      // Registro exitoso
      
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const checkEmail()));
          print('object');
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
