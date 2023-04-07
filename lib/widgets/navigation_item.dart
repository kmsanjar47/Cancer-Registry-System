import 'package:flutter/material.dart';

class NavBarItemWidget extends StatelessWidget {
  final Color color ;
  final Function()? onTap;
  final Widget icon;
  final String? title;
  final bool? isSelected;


  const NavBarItemWidget({
    Key? key,
    this.color = Colors.blue,
    @required this.onTap,
    @required this.isSelected,
    @required this.title,
    required this.icon
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: isSelected!
              ? []
              : [
             const BoxShadow(
              color: Colors.white,
              offset: Offset(-5.0, -5.0),
              blurRadius: 10.0,
              spreadRadius: 0.0,
            ),
            BoxShadow(
              color: Colors.pinkAccent.shade100.withOpacity(0.7),
              offset: const Offset(5.0, 5.0),
              blurRadius: 10.0,
              spreadRadius: 0.0,
            ),
          ],
          gradient: isSelected!
              ? LinearGradient(colors: [
            Colors.grey.shade500,
            Colors.grey.shade400,
            Colors.grey.shade300,
            Colors.grey.shade200,
            Colors.grey.shade100
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)
              : null,
        ),
        child: IconTheme(
          data: IconThemeData(
            size: 25.0,
            color: isSelected! ? color : Colors.grey[800],
          ),
          child: icon,
        ),
      ),
    );
  }}