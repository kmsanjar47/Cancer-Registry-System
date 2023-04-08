import 'dart:math';
import 'package:cancer_registry_system/constants/constants.dart';
import 'package:cancer_registry_system/controllers/auth_controllers.dart';
import 'package:cancer_registry_system/controllers/weather_controller.dart';
import 'package:cancer_registry_system/pages/doctor_panel/add_patient_page.dart';
import 'package:cancer_registry_system/widgets/doctor_statistics_card.dart';
import 'package:cancer_registry_system/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

class DoctorDashboardPage extends StatefulWidget {
  const DoctorDashboardPage({Key? key}) : super(key: key);

  @override
  State<DoctorDashboardPage> createState() => _DoctorDashboardPageState();
}

class _DoctorDashboardPageState extends State<DoctorDashboardPage> {
  var getResult = 'QR Code Result';
  int totalPatients = 150;
  int patientsAvailable = 140;
  Color _randomColor = Colors.green;
  List cancerType = [
    ["Brest Cancer", 0.1],
    ["Lung Cancer", 0.4],
    ["Oesophagus Cancer", 0.2],
    ["Skin Cancer", 0.3]
  ];



  Color generateRandomColor() {
    _randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return _randomColor;
  }

  void scanQRCode() async {
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }

  }



  @override
  void initState() {
    super.initState();
    WeatherController weatherController = Provider.of(context, listen: false);
    weatherController.isLoading = true;
    weatherController.getLatLon();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherController>(builder: (_, snapshot, __) {
      return Consumer<AuthController>(
        builder: (_, auth, ___) {
          return Scaffold(
            extendBody: true,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Top Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                foregroundImage:
                                    const AssetImage("assets/doctor_male.png"),
                                radius: 25,
                                backgroundColor: Constants.primaryColor,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  MediumText(
                                    text: "Hello Doctor",
                                  ),
                                  MediumText(text: "Square Hospital LTD")
                                ],
                              ),
                            ],
                          ),
                          snapshot.isLoading == false &&
                                  snapshot.weatherData != null
                              ? Row(
                                  children: [
                                    Image.network(
                                      "https://openweathermap.org/img/wn/${snapshot.weatherData!.weather![0].icon!}@2x.png",
                                      height: 50,
                                      width: 50,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        MediumText(
                                            text:
                                                "${snapshot.weatherData!.main!.temp}°"),
                                        MediumText(
                                            text: snapshot.weatherData!.name!)
                                      ],
                                    )
                                  ],
                                )
                              : const MediumText(
                                  text: "No Weather Data",
                                  overflow: TextOverflow.ellipsis,
                                )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DoctorStatCard(
                            centerText: "$totalPatients",
                            subtitle: "Total Patients",
                            percent: 1,
                          ),
                          DoctorStatCard(
                            centerText: "$patientsAvailable/$totalPatients",
                            subtitle: "Current Patients",
                            percent: patientsAvailable / totalPatients,
                            progressColor: Colors.red,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 15,
                            );
                          },
                          itemCount: cancerType.length,
                          itemBuilder: (context, index) {
                            return LinearPercentIndicator(
                              lineHeight: 15,
                              barRadius: const Radius.circular(10),
                              center: Text(
                                  "${(cancerType[index][1] * 100).toString()}%"),
                              progressColor: generateRandomColor(),
                              percent: cancerType[index][1],
                              trailing: Text(cancerType[index][0]),
                            );
                          }),
                      const SizedBox(
                        height: 30,
                      ),

                      ElevatedButton(
                        onPressed: () async {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPatientPage(),),);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 255, 64, 109)),
                          minimumSize: const MaterialStatePropertyAll(
                            Size(double.infinity, 50),
                          ),
                        ),
                        child: const Text("Register New Patient"),
                      ),

                      const SizedBox(
                        height: 30,
                      ),

                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            scanQRCode();

                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Constants.primaryColor),
                            minimumSize: const MaterialStatePropertyAll(
                              Size(80, 80),
                            ),
                          ),
                          child: const Icon(
                            Icons.qr_code_scanner,
                            size: 40,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      );
    });
  }
}

