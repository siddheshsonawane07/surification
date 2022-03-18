import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toycathon/components/user_model.dart';
import 'package:flutter/material.dart';
import 'package:toycathon/constants.dart';
import 'package:toycathon/pages/login/components/body.dart';
import 'package:toycathon/pages/main/background.dart';
import 'package:toycathon/pages/main/theorems.dart';
import 'package:toycathon/pages/main/words.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      // ignore: unnecessary_this
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Background(
          child: Column(children: <Widget>[
        SizedBox(height: size.height * 0.13),
        const Text("SURICTIONARY",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                color: Colors.amber)),
        const Text("Melody to Understand & Retain Concepts",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black)),
        SizedBox(height: size.height * 0.035),
        Text("Hello, ${loggedInUser.firstName}",
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.amber)),
        SizedBox(height: size.height * 0.03),
        const why_songs(),
        SizedBox(height: size.height * 0.05),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [learn_words(), learn_theorems()],
        ),
        SizedBox(height: size.height * 0.04),
        ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child: ElevatedButton(
                onPressed: () {
                  logout(context);
                },
                child: const Text("LOGOUT"),
                style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    textStyle: const TextStyle(
                        color: kPrimaryLightColor,
                        fontSize: 25,
                        fontWeight: FontWeight.bold))))
      ])),
    ));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Login()));
  }
}

// ignore: camel_case_types
class learn_words extends StatelessWidget {
  const learn_words({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
            child: const Text('Learn Words',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Words()));
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10))));
  }
}

// ignore: camel_case_types
class learn_theorems extends StatelessWidget {
  const learn_theorems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
            child: const Text('Learn Theorems',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Theorems()));
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10))));
  }
}

// ignore: camel_case_types
class why_songs extends StatefulWidget {
  const why_songs({Key? key}) : super(key: key);

  @override
  _why_songsState createState() => _why_songsState();
}

// ignore: camel_case_types
class _why_songsState extends State<why_songs> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ExpansionPanelList(
            animationDuration: const Duration(milliseconds: 1000),
            children: [
              ExpansionPanel(
                hasIcon: false,
                  backgroundColor: Colors.amber,
                  headerBuilder: (context, isExpanded) {
                    return const ListTile(
                        title: Text('Why Songs ?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold)));
                  },
                  body: const ListTile(
                      title: Text(
                          'Researches has found that music engages the parts of the brain that controls attention span, ability to make predictions, and the strength of memory retention. Music plays a key evolutionary role in our ability to digest patterns, anticipate events, and create order out of the chaotic strands of human experience. Some highlighted benefits of music are that it relaxes the mind, increases concentration, lenses distraction, improves focus,  improves performance in high pressure situations, such as mid terms and finals week, etc',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))),
                  isExpanded: _expanded,
                  canTapOnHeader:true)
            ],
            expansionCallback: (panelIndex, isExpanded) {
              _expanded = !_expanded;
              setState(() {});
            }));
  }
}
