import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:animate_do/animate_do.dart';

import '../main.dart';
import 'home_screen.dart';

class SplashScreeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img_3.jpg"),
              fit: BoxFit.cover,

            ),
          ),
          child: FadeIn(
              duration: Duration(seconds: 5),
              child: Center(

                  child: SplashScreen(
                      navigateAfterSeconds: MyHomePage(),
                      seconds: 4,
                      title: Text('Your News',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: Colors.orange)),
                      loadingText: Text('By:Raafat Husseny',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black12)),
                      loaderColor: Colors.orange,
                      backgroundColor: Colors.white10))),
        ));
  }
}
