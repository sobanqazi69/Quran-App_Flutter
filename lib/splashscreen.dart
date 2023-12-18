// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:holy_quran/homepage.dart';
import 'package:lottie/lottie.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
          ()=>Get.to(()=>const homepage() , transition: Transition.downToUp),);
  }
  Widget build(BuildContext context) {
   

    return Scaffold(
      body: Center(
        child: BounceInDown(child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/splash.json'),

            const SizedBox(height: 10,),
            FadeInUp(
              child: const Text(
                  'MY QURAN',
                  style: TextStyle(
                      color: Color.fromARGB(255, 154, 116, 3),
                      fontSize: 35,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w900,
                      height: 0,
                  ),
              ),
            
            ),
            const SizedBox(height: 10,),
            // ignore: prefer_const_constructors
            FadeInUp(child: Text(
    'Learn Quran every day and \nrecite once everyday',
    textAlign: TextAlign.center,
    style: const TextStyle(
        color: Colors.amber,
        fontSize: 20,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        height: 0,
    ),
))
          ],
        )),
      ),
    );
  }
}
