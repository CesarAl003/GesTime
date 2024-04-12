import 'package:gestime/presentation/Providers/Contdown_provider.dart';
import 'package:gestime/presentation/Providers/Navigation_provider.dart';
import 'package:gestime/presentation/Providers/Login_provider.dart';
import 'package:gestime/presentation/Providers/Signup_provider.dart';
import 'package:gestime/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp()); 
}

// StatelessWidget se utiliza cuando la parte visual del widget no cambia.
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    // Construir la UI
    return MultiProvider(
      providers: [
        //Creamos una una instancia de mi clase CountDownProvider
        ChangeNotifierProvider(create: ((_) => CountDownProvider())),
        ChangeNotifierProvider(create: ((_) => NavigationBarProvider())),
        ChangeNotifierProvider(create: ((_) => LoginProvider())),
        ChangeNotifierProvider(create: ((_) => SignUpProvider()))
      ],
      child: const MaterialApp(
        title: 'Material App', // Nombre de la app
        debugShowCheckedModeBanner: false, // Quitar la marca de debug
        home: Login(), // La vista principal
        // theme: AppTheme().currentTheme,
      ),
    );
  }
}
