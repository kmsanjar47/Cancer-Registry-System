import 'package:cancer_registry_system/constants/constants.dart';
import 'package:cancer_registry_system/data/repository/auth_repository.dart';
import 'package:cancer_registry_system/widgets/medium_text.dart';
import 'package:flutter/material.dart';

import '../../widgets/big_text.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Constants.primaryColor,
                  foregroundImage: const AssetImage("assets/doctor_male.png"),
                  radius: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    BigText(text: "DR ANJU"),
                    BigText(text: "Square Hospitals LTD"),
                    BigText(text: "01851656558")
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: const Center(child: BigText(text: "Placeholder",),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  await AuthRepository().firebaseAuth.signOut();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 255, 64, 109)),
                  minimumSize: const MaterialStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                ),
                child: const Text("Signout"),
              ),)

              ],
        ),
      ),
    );
  }
}
