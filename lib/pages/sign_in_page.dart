import 'package:cancer_registry_system/pages/doctor_panel/doctor_dashboard_page.dart';
import 'package:cancer_registry_system/pages/doctor_panel/navigation_page.dart';
import 'package:cancer_registry_system/pages/registration_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controllers.dart';
import '../widgets/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController? userNameTxtCtl;
  TextEditingController? passwordTxtCtl;


  @override
  void initState() {
    super.initState();
    userNameTxtCtl = TextEditingController();
    passwordTxtCtl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthController>(
        builder: (_, snapshot,___) {
          return Scaffold(

            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(

                  children: [
                    const SizedBox(height: 20,),
                    Image.asset("assets/ribbon.png",height: 200,width: 200,),
                    const SizedBox(height: 100,),
                    //Sign in text
                    const Text("Sign in",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                    const SizedBox(height: 10,),

                    //Username Text field
                    CustomTextField(
                      textEditingController: userNameTxtCtl,
                      hintText: "Email",
                    ),

                    //Password Text field
                    CustomTextField(
                      obscureText: true,
                      textEditingController: passwordTxtCtl,
                      hintText: "Password",
                    ),

                    const SizedBox(height: 10,),

                    //Sign in button
                    ElevatedButton(
                      onPressed: () async {

                        User? user = await snapshot.signIn(
                            userNameTxtCtl!.text,
                            passwordTxtCtl!.text,
                            context);
                        if (user != null) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NavigationPage(),),(route)=>true);
                        }

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink),
                        minimumSize: const MaterialStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      ),
                      child:snapshot.isLoading == true?const Center(child: CircularProgressIndicator(),): const Text("Sign In"),
                    ),
                    const SizedBox(height: 10,),

                    //New User?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationPage()));
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                  ),
              ),
            ),
          );
        }
      ),
    );
  }
}
