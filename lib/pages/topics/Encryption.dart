// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:toycathon/constants.dart';
import 'package:toycathon/pages/main/background.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Encryption extends StatelessWidget {
  const Encryption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String videoId;
    videoId = YoutubePlayer.convertUrlToId("https://youtu.be/op7FrssvW7s")!;

    YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ));

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.07,
        title: const Text(
          "Encryption / Decryption",
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
            Navigator.pop(context);
          },
          color: kPrimaryLightColor,
        ),
      ),
      body: Background(
        child: Column(
          children: <Widget>[
            // ignore: avoid_unnecessary_containers
            SizedBox(height: size.height * 0.001),
            SizedBox(
              height: size.height * 0.4,
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              color: kPrimaryLightColor,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  "In Cryptograhy, encryption is the process of encoding information. This process converts the original representation of the information, known as plain text, into an alternative form known as ciphertext. Ideally, only authorized parties can decipher a ciphertext back to plain text and access the original information. Encryption does not itself prevent interface but denies the intelligble contetnt to a would-be interceptor",
                  style: TextStyle(fontSize: 23, color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
