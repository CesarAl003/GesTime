import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gestime/presentation/pages/home_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class checkEmail extends StatelessWidget {
  const checkEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 150.0),
          const Text(
            'Hemos enviado un correo de verificación. Por favor, has click en el enlace proporcionado',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Flexible(
            child: Image.asset(
              'assets/img/email.png',
              width: 250, // Ajusta según tus necesidades
              height: 250, // Ajusta según tus necesidades
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                 User? user = FirebaseAuth.instance.currentUser;

                await user?.reload();
                user = FirebaseAuth.instance.currentUser; // Obtener el usuario actualizado

                if (user!.emailVerified) {
                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const HomePage()));
                } else {
                  Fluttertoast.showToast(
                    msg: 'Por favor verifica tu correo electrónico.',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                }
              } catch (e) {
                print('Error al volver a autenticar: $e');
              }
            },
            child: const Text('Continuar'),
          ),
        ],
      ),
    );
  }
}
