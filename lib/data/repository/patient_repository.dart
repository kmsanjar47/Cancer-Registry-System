import 'package:cancer_registry_system/models/patient_model.dart';

class PatientRepository {

  static  List<PatientModel> dummyPatientData = [

    PatientModel(
      address: "Dhaka",
      patientID: "XJHKHKJ@#!@",
      name: "TANU",
      age: 24,
      contactNum: "01851656558",
      email: "kmsanjar47@gmail.com",
      emergencyContact: "01851656558",
      creationDate: DateTime.now(),
      qrCode: "",
      cancerStage: "3",
      cancerType: "Lung"),

    PatientModel(
        address: "Dhaka",
        patientID: "XJHKHKDAJ@#!@",
        name: "MUSA",
        age: 24,
        contactNum: "01851656558",
        email: "kmsanjar47@gmail.com",
        emergencyContact: "01851656558",
        creationDate: DateTime.now(),
        qrCode: "",
        cancerStage: "3",
        cancerType: "Lung"),


    PatientModel(
        address: "Dhaka",
        patientID: "XJHKHKASDJ@#!@",
        name: "SIFAT",
        age: 24,
        contactNum: "01851656558",
        email: "kmsanjar47@gmail.com",
        emergencyContact: "01851656558",
        creationDate: DateTime.now(),
        qrCode: "",
        cancerStage: "3",
        cancerType: "Lung"),

    PatientModel(
        address: "Dhaka",
        patientID: "XJHKHASDKJ@#!@",
        name: "ANJAR",
        age: 24,
        contactNum: "01851656558",
        email: "kmsanjar47@gmail.com",
        emergencyContact: "01851656558",
        creationDate: DateTime.now(),
        qrCode: "",
        cancerStage: "3",
        cancerType: "Lung")

  ];
}

