import 'package:cancer_registry_system/pages/doctor_panel/doctor_dashboard_page.dart';
import 'package:cancer_registry_system/pages/doctor_panel/doctor_profile_page.dart';
import 'package:cancer_registry_system/pages/doctor_panel/patients_page.dart';
import 'package:cancer_registry_system/pages/doctor_panel/reports_page.dart';
import 'package:cancer_registry_system/responsive/responsive_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_navigation_bar_ui.dart';
import '../../widgets/navigation_item.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? index;
  static PageController? _pageController;
  static GlobalKey<ScaffoldState>? globalKey;

  @override
  void initState() {
    super.initState();
    index = 0;
    _pageController = PageController(
      initialPage: index!,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _pages = [
      const DoctorDashboardPage(),
      const PatientsPage(),
      const ReportsPage(),
      const DoctorProfile(),
    ];
    return ResponsiveLayout
      (mobileScaffold: Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (indexX) {
          index = indexX;
        },
        children: _pages,
      ),
      bottomNavigationBar: CustomNavigationBar(
        items: [
          NavBarItemWidget(
            onTap: () {
              if (_pageController!.hasClients) {
                _pageController!.jumpToPage(0);
              }
              setState(() {
                index = 0;
              });
            },
            color: Colors.purple,
            icon: const Icon(Icons.home),
            isSelected: index == 0,
            title: "Home",
          ),
          NavBarItemWidget(
            onTap: () {
              if (_pageController!.hasClients) {
                _pageController!.jumpToPage(1);
              }
              setState(() {
                index = 1;
              });
            },
            color: Colors.red,
            icon: const Icon(CupertinoIcons.heart_fill),
            isSelected: index == 1,
            title: "Wishlist",
          ),
          NavBarItemWidget(
            onTap: () {
              if (_pageController!.hasClients) {
                _pageController!.jumpToPage(2);
              }
              setState(() {
                index = 2;
              });
            },
            color: Colors.green,
            icon: const Icon(Icons.chat_bubble),
            isSelected: index == 2,
            title: "Orders",
          ),
          NavBarItemWidget(
            onTap: () {
              if (_pageController!.hasClients) {
                _pageController!.jumpToPage(3);
              }
              setState(() {
                index = 3;
              });
            },
            icon: const Icon(CupertinoIcons.profile_circled),
            isSelected: index == 3,
            title: "Profile",
          ),
        ],
        currentIndex: index!,
        elevation: 16,
      ),
    ),
        tabletScaffold: Scaffold(),
        desktopScaffold: Scaffold());

  }
}
