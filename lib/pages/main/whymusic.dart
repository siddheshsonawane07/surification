// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:toycathon/constants.dart';
import 'package:toycathon/pages/login/components/background.dart';
import 'package:toycathon/pages/main/dashboard.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: size.height * 0.07,
            title: const Text(
              "Why Music?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: kPrimaryLightColor,
              ),
            ),
            centerTitle: true,
            backgroundColor: kPrimaryColor,
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const Dashboard()));
              },
              color: kPrimaryLightColor,
            ),
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(16)))),
        body: Background(
            child: ListView(children: <Widget>[
          SizedBox(height: size.height * 0.02),
          Padding(
              padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
              child: Image.asset(
                "assets/images/1.png",
                width: size.width * 0.35,
                height: size.height * 0.2,
              )),
          SizedBox(height: size.height * 0.02),
          Container(
              color: kPrimaryLightColor,
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                      "Researches has found that music engages the parts of the brain that controls attention span, ability to make predictions, and the strength of memory retention. Music plays a key evolutionary role in our ability to digest patterns, anticipate events, and create order out of the chaotic strands of human experience. Some highlighted benefits of music are, it: ",
                      style: TextStyle(fontSize: 22, color: Colors.black)))),
          Container(
              color: kPrimaryLightColor,
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 1, 20, 10),
                  child: Text(
                    "* Relaxes the mind",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                    textAlign: TextAlign.left,
                  ))),
          Container(
              color: kPrimaryLightColor,
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 1, 20, 10),
                  child: Text(
                    "* Increases Concentration",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                    textAlign: TextAlign.left,
                  ))),
          Container(
              color: kPrimaryLightColor,
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 1, 20, 10),
                  child: Text(
                    "* Lessens Distraction",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                    textAlign: TextAlign.left,
                  ))),
          Container(
              color: kPrimaryLightColor,
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    "* Improves Focus",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                    textAlign: TextAlign.left,
                  ))),
          Container(
              color: kPrimaryLightColor,
              child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 1, 20, 25),
                  child: Text(
                    "* Improves performance in high pressure situations, such as mid terms and finals week",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                    textAlign: TextAlign.left,
                  )))
        ])));
  }
}
