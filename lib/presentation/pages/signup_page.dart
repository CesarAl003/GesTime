import 'package:gestime/presentation/Providers/Signup_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    // Instancia del provider
    final signUpProvider = Provider.of<SignUpProvider>(context);

    return SignUpView(signUpProvider: signUpProvider);
  }
}

class SignUpView extends StatefulWidget {
  final SignUpProvider signUpProvider;
  const SignUpView({Key? key, required this.signUpProvider}) : super(key: key);

  @override
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUpView> {
  //final LoginProvider loginProvider;
  final TextEditingController _txtEmail = TextEditingController();
  final TextEditingController _txtPass = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100.0),
              const Text(
                'Registro',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 38,
                ),
              ),
              const SizedBox(height: 60.0),
              // Icono de Usuario
              Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                child: const Icon(
                  Icons.person,
                  size: 100.0,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 30.0),
              // Campo de Correo
              TextField(
                controller: _txtEmail,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  hintText: 'Ingrese su correo',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              // Campo de Contraseña
              TextField(
                controller: _txtPass,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  hintText: 'Ingrese su contraseña',
                  suffixIcon: IconButton(
                    //Cambiar el ícono de visibilidad de la contraseña
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      }); // Modificar la visibilidad de la contraseña
                    },
                  ),
                ),
                obscureText: _obscureText,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                // Botón de Aceptar
                onPressed: () async {
                  // Para acceder a mi mensaje en caso de error
                  print(_txtEmail.text);
                  print(_txtPass.text);
                  widget.signUpProvider
                      .signIn(context, _txtEmail.text, _txtPass.text);
                  //loginProvider.signIn(context, _txtEmail.text, _txtPass.text);
                },
                child: const Text('Aceptar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
