import 'dart:io';

import 'package:cancer_registry_system/constants/constants.dart';
import 'package:cancer_registry_system/data/repository/patient_repository.dart';
import 'package:cancer_registry_system/widgets/title_text.dart';
import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/big_text.dart';

class PatientDescriptionPage extends StatefulWidget {
  final String patientID;

  const PatientDescriptionPage({required this.patientID, Key? key})
      : super(key: key);

  @override
  State<PatientDescriptionPage> createState() => _PatientDescriptionPageState();
}

class _PatientDescriptionPageState extends State<PatientDescriptionPage> {
  Map<String, dynamic>? patientData;

  getPatientData(String patientID) {
    PatientRepository.dummyPatientData.forEach((element) {
      if (element["patientID"] == patientID) {
        setState(() {
          patientData = element;
        });
      }
    });
  }

  @override
  void initState() {
    getPatientData(widget.patientID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Constants.primaryColor,
                  foregroundImage:
                      const AssetImage("assets/patient_placeholder.png"),
                  radius: 70,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(text: patientData!["name"]),
                    BigText(text: "Cancer Type: ${patientData!["cancerType"]}"),
                    BigText(
                        text: "Cancer Stage: ${patientData!["cancerStage"]}"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 0,
                    backgroundColor: Constants.primaryColor,
                    bottom: const TabBar(dividerColor: Colors.green, tabs: [
                      Tab(
                        icon: Icon(Icons.add),
                        text: "Add Report",
                      ),
                      Tab(
                        icon: Icon(Icons.pages),
                        text: "Reports",
                      )
                    ]),
                  ),
                  body: TabBarView(children: [AddReports(), ExistingReports()]),
                ),
              ),
            ),
          ],
        ));
  }
}

class ExistingReports extends StatelessWidget {
  const ExistingReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("ADD Reports"),
      ),
    );
  }
}

class AddReports extends StatefulWidget {
  const AddReports({Key? key}) : super(key: key);

  @override
  State<AddReports> createState() => _AddReportsState();
}

class _AddReportsState extends State<AddReports> {
  File? scannedFile;

  scanDocument(BuildContext context) async {
    scannedFile = null;
    try {
      File? scannedDoc = await DocumentScannerFlutter.launch(context);
      setState(() {
        scannedFile = scannedDoc;
      });
      // `scannedDoc` will be the image file scanned from scanner
    } on PlatformException {
      // 'Failed to get document path or operation cancelled!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              scanDocument(context);
            },
            child: scannedFile == null
                ? Container(
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
                  )
                : Container(
                    child: Image.file(scannedFile!),
                    height: 200,
                    width: 200,
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          const BigText(text: "Add New Report")
        ],
      ),
    );
  }
}
