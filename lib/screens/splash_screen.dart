import 'dart:async';

import 'package:doctor_appointment_app/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
     });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/Images/app-background.webp"),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(117, 255, 255, 255),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 170,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: Image.asset("assets/Images/app-icon.png",fit: BoxFit.cover,filterQuality: FilterQuality.high,)
                  ),
                ),
                const SizedBox(height: 10,),
                Text("Dokter",style: GoogleFonts.aDLaMDisplay(
                  fontSize: 40,
                  letterSpacing: 2,
                  color: const Color.fromARGB(255, 29, 70, 103)
                ),)
            ],
          ),
        ),
          ),
    );
  }
}