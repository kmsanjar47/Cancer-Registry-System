import 'package:cancer_registry_system/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/big_text.dart';
import '../../widgets/title_text.dart';

class AddPatientPage extends StatefulWidget {
  const AddPatientPage({Key? key}) : super(key: key);

  @override
  State<AddPatientPage> createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  TextEditingController nameTxtCtl = TextEditingController();
  TextEditingController emailTxtCtl = TextEditingController();
  TextEditingController ageTxtCtl = TextEditingController();
  TextEditingController addressTxtCtl = TextEditingController();
  TextEditingController contactTxtCtl = TextEditingController();
  TextEditingController emergencyContactTxtCtl = TextEditingController();
  TextEditingController heightTxtCtl = TextEditingController();
  TextEditingController weightTxtCtl = TextEditingController();
  TextEditingController bloodGroupTxtCtl = TextEditingController();
  TextEditingController cancerTypeTxtCtl = TextEditingController();
  TextEditingController cancerStageTxtCtl = TextEditingController();

  @override
  void dispose() {
    nameTxtCtl.dispose();
    emailTxtCtl.dispose();
    ageTxtCtl.dispose();
    addressTxtCtl.dispose();
    contactTxtCtl.dispose();
    emergencyContactTxtCtl.dispose();
    heightTxtCtl.dispose();
    weightTxtCtl.dispose();
    bloodGroupTxtCtl.dispose();
    cancerTypeTxtCtl.dispose();
    cancerStageTxtCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const TitleText(text: "Patient Registration"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: Constants.primaryColor,
              foregroundImage:
                  const AssetImage("assets/patient_placeholder.png"),
              radius: 70,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                textEditingController: nameTxtCtl, hintText: "Name"),
            CustomTextField(textEditingController: ageTxtCtl, hintText: "Age"),
            CustomTextField(
                textEditingController: addressTxtCtl, hintText: "Address"),
            CustomTextField(
                textEditingController: contactTxtCtl, hintText: "Contact No"),
            CustomTextField(
                textEditingController: emergencyContactTxtCtl,
                hintText: "Emergency Contact No"),
            CustomTextField(
                textEditingController: emailTxtCtl, hintText: "Email"),
            CustomTextField(
                textEditingController: heightTxtCtl, hintText: "Height"),
            CustomTextField(
                textEditingController: weightTxtCtl, hintText: "Weight"),
            CustomTextField(
                textEditingController: bloodGroupTxtCtl,
                hintText: "Blood Group"),
            CustomTextField(
                textEditingController: cancerTypeTxtCtl,
                hintText: "Cancer Type"),
            CustomTextField(
                textEditingController: cancerStageTxtCtl,
                hintText: "Cancer Stage"),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 6,
                          offset: const Offset(2, 2),
                          color: Colors.grey.shade500)
                    ],
                    color: Constants.primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ),
                const BigText(text: "Add Reports"),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {


                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 255, 64, 109)),
                    minimumSize: const MaterialStatePropertyAll(
                      Size(double.infinity, 50),
                    ),
                  ),
                  child: const Text("Submit"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
