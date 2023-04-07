import "package:flutter/material.dart";

import '../pages/doctor_panel/doctor_dashboard_page.dart';
import "../pages/registration_page.dart";
import "../pages/sign_in_page.dart";


class Routes {

  static MaterialPageRoute registrationPage =
      MaterialPageRoute(builder: (context) => const RegistrationPage());
  static MaterialPageRoute signInPage =
      MaterialPageRoute(builder: (context) => const SignInPage());
  static MaterialPageRoute dashboardPage =
      MaterialPageRoute(builder: (context) => const DoctorDashboardPage());
}
