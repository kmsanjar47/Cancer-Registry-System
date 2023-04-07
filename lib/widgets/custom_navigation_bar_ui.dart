import 'dart:math' as math;
import 'package:cancer_registry_system/widgets/navigation_item.dart';
import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final double scaleFactor;
  final bool? isFloating;
  final BorderRadius? borderRadius;
  final double? elevation;
  final List<Widget> items;
  final Function()? onTap;
  final int currentIndex;
  final Color? backgroundColor;
  final Color? strokeColor;
  final Curve? bubbleCurve;
  final Curve? scaleCurve;

  const CustomNavigationBar(
      {Key? key,
      required this.items,
      this.onTap,
      this.currentIndex = 0,
      this.scaleFactor = 0.2,
      this.elevation = 8.0,
      this.borderRadius,
      this.backgroundColor = Colors.white,
      this.strokeColor = Colors.blueAccent,
      this.bubbleCurve = Curves.linear,
      this.scaleCurve = Curves.linear,
      this.isFloating = false})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 70,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      margin: const EdgeInsets.only(bottom: 20,left: 10,right: 10),
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      //height: 56, //+ (widget.isFloating ? 0.0 : additionalBottomPadding),
      // width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items
      ),
    );
  }
}

