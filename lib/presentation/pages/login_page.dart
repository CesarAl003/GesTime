import 'package:gestime/presentation/Providers/Login_provider.dart';
import 'package:gestime/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // Instancia del provider
    final loginProvider = Provider.of<LoginProvider>(context);

    return LoginView(loginProvider: loginProvider);
  }
}

class LoginView extends StatefulWidget {
  final LoginProvider loginProvider;
  const LoginView({Key? key, required this.loginProvider}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<LoginView> {
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
                'Iniciar sesión',
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
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text(
                  '¿Aun no tienes cuenta? Presiona aquí',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                // Botón de Aceptar
                onPressed: () async {
                  // Para acceder a mi mensaje en caso de error
                  print(_txtEmail.text);
                  print(_txtPass.text);
                  widget.loginProvider
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
