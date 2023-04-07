import 'package:cancer_registry_system/pages/doctor_panel/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';
import 'controllers/weather_controller.dart';


Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<WeatherController>(
      create: (context) => WeatherController(),
    ),

  ], child: HealthApp()));
}

class HealthApp extends StatelessWidget {
  const HealthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Constants.primaryColor,
        debugShowCheckedModeBanner: false,
        home: NavigationPage());
  }
}
