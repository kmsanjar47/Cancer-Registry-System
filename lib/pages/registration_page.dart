import 'package:cancer_registry_system/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/auth_controllers.dart';
import '../widgets/custom_text_form_field.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController? userNameTxtCtl;
  TextEditingController? passwordTxtCtl;
  TextEditingController? emailTxtCtl;
  GlobalKey<FormState>? formKey;

  @override
  void initState() {
    super.initState();
    userNameTxtCtl = TextEditingController();
    passwordTxtCtl = TextEditingController();
    emailTxtCtl = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AuthController>(
        builder: (_, snapshot, ___) {
          return Scaffold(
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Register
                    const Text(
                      "Register",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 10,),

                    //Username
                    CustomTextFormField(
                      hintText: "Username",
                      textEditingController: userNameTxtCtl,
                      validator: (value) {
                        return value;
                      },
                    ),

                    //Email
                    CustomTextFormField(
                      hintText: "Email",
                      textEditingController: emailTxtCtl,
                      validator: (value) {
                        return value;
                      },
                    ),

                    //Password
                    CustomTextFormField(
                      obscureText: true,
                      hintText: "Password",
                      textEditingController: passwordTxtCtl,
                      validator: (value) {
                        return value;
                      },
                    ),

                    const SizedBox(height: 10,),
                    //Register button
                    ElevatedButton(
                      onPressed: () async {

                        User? user = await snapshot.signUpNewUser(
                            emailTxtCtl!.text,
                            passwordTxtCtl!.text);
                        if (user != null) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Registered Successfully"),
                              ),
                            );
                          }
                          if (context.mounted) Navigator.pop(context);
                        }


                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Constants.primaryColor),
                        minimumSize: const MaterialStatePropertyAll(
                          Size(double.infinity, 50),
                        ),
                      ),
                      child: snapshot.isLoading == true? const Center(child: CircularProgressIndicator(color: Colors.white,),):const Text("Register"),
                    ),

                    const SizedBox(height: 10,),

                    //Already registered?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already registered?"),
                        const SizedBox(
                          width: 7,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Sign in",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
