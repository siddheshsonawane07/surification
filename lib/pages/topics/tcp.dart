import 'package:flutter/material.dart';
import 'package:toycathon/constants.dart';
import 'package:toycathon/pages/main/background.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TCP extends StatelessWidget {
  const TCP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String videoId;
    videoId = YoutubePlayer.convertUrlToId("https://youtu.be/A3eJb6bniKE")!;

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
          "TCP/IP Protocol",
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
            SizedBox(height: size.height * 0.03),
            Container(
              color: kPrimaryLightColor,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  "TCP stands for Transmission Control Protocol a communications standard that enables application programs and computing devices to exchange messages over a network. It is designed to send packets across the internet and ensure the successful delievery of data and messages over networks",
                  style: TextStyle(fontSize: 25, color: Colors.black),
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
