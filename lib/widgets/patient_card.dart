import 'package:flutter/material.dart';

import '../constants/constants.dart';
import 'big_text.dart';
import 'medium_text.dart';

class PatientCard extends StatelessWidget {
  final String patientName;
  final String cancerType;
  final String cancerStage;
  String? lastChecked;
  AssetImage? profileImage;
  Function() onTap;
  PatientCard({required this.onTap,this.profileImage,required this.patientName,required this.cancerType,required this.cancerStage,this.lastChecked,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(left: 6,right: 6),
        height: 150,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(2, 2),
                blurRadius: 6,
                color: Colors.grey.shade500)
          ],
          borderRadius: BorderRadius.circular(20),
          color: Constants.primaryColor.withAlpha(200),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 50,
              foregroundImage: profileImage??
              const AssetImage("assets/patient_placeholder.png"),
            ),
            const SizedBox(
              width: 80,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: patientName,color:Colors.white,fontWeight: FontWeight.bold,),
                MediumText(
                  text: "Cancer Stage: $cancerStage",color: Colors.white,
                ),
                MediumText(
                  text:"Cancer Type: $cancerType",color: Colors.white,
                ),
                MediumText(
                  text: "Last Checked: ${lastChecked??"No Data"}",color: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
