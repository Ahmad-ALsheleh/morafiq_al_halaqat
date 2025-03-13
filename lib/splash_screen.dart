import 'dart:async';

import 'package:flutter/material.dart';
import 'core/constant.dart';
import 'features/account/views/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 0),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColoe,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Logo.png',width: 250,height: 250,),
            Text('مرافق الحلقات',
              style: TextStyle(color:praimaryColor,fontFamily: 'Somar_Regular', fontSize: 50,fontWeight: FontWeight.w600),
            ),

          ],
        ) ,
      ),
    );
  }
}
