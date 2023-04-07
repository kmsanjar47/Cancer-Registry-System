import 'package:flutter/material.dart';

import '../../widgets/title_text.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: TitleText(text: "Chat"),
        centerTitle: true,
      ),
      body: Center(child: TitleText(text:"Coming Soon"),),
    );
  }
}
