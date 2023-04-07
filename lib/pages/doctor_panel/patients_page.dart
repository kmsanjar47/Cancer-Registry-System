import 'package:cancer_registry_system/data/repository/patient_repository.dart';
import 'package:cancer_registry_system/pages/doctor_panel/patient_description_page.dart';
import 'package:cancer_registry_system/widgets/patient_card.dart';
import 'package:cancer_registry_system/widgets/title_text.dart';
import 'package:flutter/material.dart';

class PatientsPage extends StatefulWidget {
  const PatientsPage({Key? key}) : super(key: key);

  @override
  State<PatientsPage> createState() => _PatientsPageState();
}

class _PatientsPageState extends State<PatientsPage> {
  String myText = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const TitleText(
            text: "Patients",
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            Card(
              child: TextField(
                decoration: const InputDecoration(
                    focusColor: Colors.black,
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search...."),
                onChanged: (val) {
                  setState(() {
                    myText = val;
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                return PatientCard(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PatientDescriptionPage(patientID:PatientRepository.dummyPatientData[index]["patientID"])));
                  },
                    patientName: PatientRepository.dummyPatientData[index]["name"], cancerType: PatientRepository.dummyPatientData[index]["cancerType"], cancerStage: PatientRepository.dummyPatientData[index]["cancerStage"]);
              },
                  separatorBuilder: (context, index) {
                return const SizedBox(height: 10,);
                  },
                  itemCount: PatientRepository.dummyPatientData.length),
            )

          ],
        ),
      ),
    );
  }
}
