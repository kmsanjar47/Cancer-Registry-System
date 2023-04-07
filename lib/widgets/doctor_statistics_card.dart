import 'package:cancer_registry_system/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'big_text.dart';

class DoctorStatCard extends StatelessWidget {
  final Color? progressColor;
  final double percent;
  final String subtitle;
  final String centerText;

  const DoctorStatCard(
      {this.progressColor,
      required this.percent,
      required this.centerText,
      required this.subtitle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 220,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              offset: Offset(2, 2),
              blurRadius: 7
            ),
          ],
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularPercentIndicator(
            radius: 50.0,
            lineWidth: 10.0,
            percent: percent,
            center: MediumText(text: centerText),
            progressColor: progressColor ?? Colors.green,
          ),
          SizedBox(
            height: 10,
          ),
          BigText(text: subtitle)
        ],
      ),
    );
  }
}
