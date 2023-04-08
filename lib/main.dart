import 'package:cancer_registry_system/controllers/auth_controllers.dart';
import 'package:cancer_registry_system/data/repository/auth_repository.dart';
import 'package:cancer_registry_system/pages/doctor_panel/navigation_page.dart';
import 'package:cancer_registry_system/pages/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';
import 'controllers/weather_controller.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<WeatherController>(
          create: (context) => WeatherController(),
        ),
        ChangeNotifierProvider<AuthController>(
          create: (context) => AuthController(),
        ),
      ],
      child: const HealthApp(),
    ),
  );
}

class HealthApp extends StatelessWidget {
  const HealthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Constants.primaryColor,
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
          stream: AuthRepository().firebaseAuth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return NavigationPage();
            } else {
              return const SignInPage();
            }
          }),
    );
  }
}
