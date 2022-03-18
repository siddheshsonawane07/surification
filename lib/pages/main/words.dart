import 'package:flutter/material.dart';
import 'package:toycathon/constants.dart';
import 'package:toycathon/pages/login/components/background.dart';
import 'package:toycathon/pages/main/dashboard.dart';
import 'package:toycathon/pages/topics/Encryption.dart';
import 'package:toycathon/pages/topics/addiction.dart';
import 'package:toycathon/pages/topics/passport.dart';
import 'package:toycathon/pages/topics/tcp.dart';

class Words extends StatefulWidget {
  const Words({Key? key}) : super(key: key);

  @override
  _WordsState createState() => _WordsState();
}

class _WordsState extends State<Words> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: size.height * 0.07,
          title: const Text("Words",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: kPrimaryLightColor,
              )),
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
          child: GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Addiction()));
                },
                child: Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: gridcolor,
                    ),
                    child: const Text(
                      'Addiction',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ))),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const TCP()));
                },
                child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'TCP/IP Protocol',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: gridcolor,
                    ))),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Encryption()));
                },
                child: Container(
                    padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
                    child: const Text(
                      'Encryption Decryption',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: gridcolor,
                    ))),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Passport()));
                },
                child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      'Passport',
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: gridcolor,
                    )))
          ])),
    );
  }
}
