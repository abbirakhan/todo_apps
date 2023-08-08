import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:todo_apps/pages/login_page.dart';

//import 'package:todo_app/firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initData();
    super.initState();

    //splashScreen.isLogin(context);
  }

  void initData() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 45, 45),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 150),
          Lottie.asset(
            'assets/svgs/note.json',
            repeat: false,
            height: 400,
            width: 400,
          ),
          SizedBox(height: 20),
          Text(
            "DESIGN YOUR TODAY",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ],
      )),
    );
  }
}
