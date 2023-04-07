import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../routes/routes.dart';
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
      child: Scaffold(

        body: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/Untitled design.png",fit: BoxFit.fill,)),

              Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Cancer Registry App",style: TextStyle(fontSize: 30),),
                  //Sign in text
                  const Text("Sign in",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  const SizedBox(height: 10,),

                  //Username Text field
                  CustomTextField(
                    textEditingController: userNameTxtCtl,
                    hintText: "Username",
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
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink),
                      minimumSize: const MaterialStatePropertyAll(
                        Size(double.infinity, 50),
                      ),
                    ),
                    child: const Text("Sign In"),
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
                          Navigator.push(context, Routes.registrationPage);
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
            ),]
          ),
        ),
      ),
    );
  }
}
