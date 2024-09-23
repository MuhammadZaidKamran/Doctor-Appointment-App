// ignore: duplicate_ignore
// ignore: file_names, duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:doctor_appointment_app/Screens/home_screen.dart';
import 'package:doctor_appointment_app/Screens/profile_screen.dart';
import 'package:doctor_appointment_app/Screens/schedule_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  List widgetList = [
    const HomeScreen(),
    const ScheduleScreen(),
    const ProfileScreen(),
  ];

  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: Center(
          child: widgetList[myIndex],
        ),
         bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(255, 43, 131, 204),
          unselectedItemColor: const Color.fromARGB(255, 110, 110, 110),
          type: BottomNavigationBarType.shifting,
          onTap: (value) {
            myIndex = value;
            setState(() {});
          },
          enableFeedback: true,
          elevation: 0,
          selectedFontSize: 14,
          unselectedFontSize: 10,
          currentIndex: myIndex,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
           items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home",backgroundColor: Colors.white),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_month_rounded),label: "Appointments",backgroundColor: Colors.white),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded),label: "Account",backgroundColor: Colors.white
          ),
          ]
          ),
      ),
    );
  }
}













