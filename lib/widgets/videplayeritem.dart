import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/widgets/my_messages_card.dart';

class videplayer extends StatefulWidget {
  const videplayer({super.key, required this.videourl});

  final String videourl;
  @override
  State<videplayer> createState() => _videplayerState();
}

class _videplayerState extends State<videplayer> {
  late CachedVideoPlayerController videoPlayerController;
  bool isplay = false;
  @override
  void initState() {
    // TODO: implement initState

    videoPlayerController = CachedVideoPlayerController.network(widget.videourl)
      ..initialize()
      ..setVolume(1);

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    play() {
      if (isplay) {
        videoPlayerController.pause();
      } else {
        videoPlayerController.play();
      }
      setState(() {
        isplay = !isplay;
      });
    }

    return AspectRatio(
      aspectRatio: 9 / 6,
      child: Stack(children: [
        CachedVideoPlayer(videoPlayerController),
        Center(
            child: IconButton(
                onPressed: () {
                  if (isplay) {
                    videoPlayerController.pause();
                  } else {
                    videoPlayerController.play();
                  }
                  setState(() {
                    isplay = !isplay;
                  });
                },
                icon: isplay
                    ? Icon(Icons.pause_circle)
                    : Icon(Icons.play_circle)))
      ]),
    );
  }
}
