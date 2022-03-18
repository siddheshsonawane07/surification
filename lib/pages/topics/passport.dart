import 'package:flutter/material.dart';
import 'package:toycathon/constants.dart';
import 'package:toycathon/pages/main/background.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Passport extends StatelessWidget {
  const Passport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String videoId;
    videoId = YoutubePlayer.convertUrlToId("https://youtu.be/aECEM-BxD4o")!;

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
          "Passport",
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
                  "It is an official document issued by a govenment certifying the holder's identity and citizenship and entitling them to travel under its protection to and from foreign countries",
                  style: TextStyle(fontSize: 30, color: Colors.black),
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
