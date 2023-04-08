import 'dart:convert';
import 'dart:io';
import 'package:cancer_registry_system/constants/constants.dart';
import 'package:cancer_registry_system/data/repository/patient_repository.dart';
import 'package:cancer_registry_system/models/patient_model.dart';
import 'package:cancer_registry_system/widgets/medium_text.dart';
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
  PatientModel? patientData;

  getPatientData(String patientID) {
    PatientRepository.dummyPatientData.forEach((element) {
      if (element.patientId == patientID) {
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
                    TitleText(text: patientData!.name),
                    BigText(text: "Cancer Type: ${patientData!.cancerType}"),
                    BigText(text: "Cancer Stage: ${patientData!.cancerStage}"),
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
                  body: const TabBarView(
                      children: [AddReports(), ExistingReports()]),
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
    return const Center(
      child: Text("ADD Reports"),
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
  String? base64img;

  scanDocument(BuildContext context) async {
    scannedFile = null;
    base64img = null;
    try {
      File? scannedDoc = await DocumentScannerFlutter.launch(context);
      setState(() {
        scannedFile = scannedDoc;
        dynamic bytes = File(scannedFile!.path).readAsBytesSync();
        base64img = base64Encode(bytes);
      });
      // `scannedDoc` will be the image file scanned from scanner
    } on PlatformException {
      // 'Failed to get document path or operation cancelled!';
    }
  }

  String _dropDownSelectedItem = "NO REPORT SELECTED";

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
                : SizedBox(
                    height: 300,
                    width: 300,
                    child: Image.memory(base64Decode(base64img!)),
                  ),
          ),
          const SizedBox(
            height: 10,
          ),
          scannedFile == null
              ? const BigText(text: "Add New Report")
              : Column(
                  children: [
                    DropdownButton(
                        hint: const MediumText(
                          text: "Select Report",
                        ),
                        focusColor: Constants.primaryColor,
                        items: const [
                          DropdownMenuItem(
                            value: "HAEMATOLOGY",
                            child: Text("HAEMATOLOGY"),
                          ),
                          DropdownMenuItem(
                            value: "BIOCHEMISTRY",
                            child: Text("BIOCHEMISTRY"),
                          ),
                          DropdownMenuItem(
                            value: "IMMUNOLOGY",
                            child: Text("IMMUNOLOGY"),
                          ),
                          DropdownMenuItem(
                            value: "URINE ROUTINE",
                            child: Text("URINE ROUTINE"),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _dropDownSelectedItem = value!;
                          });
                        }),
                    MediumText(
                      text:
                          "Report Selected: ${_dropDownSelectedItem.toString()}",
                      fontWeight: FontWeight.bold,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 255, 64, 109)),
                          minimumSize: const MaterialStatePropertyAll(
                            Size(double.infinity, 50),
                          ),
                        ),
                        child: const Text("Submit"),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
