import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoLink;

  const VideoPlayerScreen({super.key, required this.videoLink});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController videoPlayerController;
  bool _videoPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
      setVideoPlayerScreen();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: _videoPlaying?
      Center(
        child: Stack(
          children: [
            Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.green,
              child: VideoPlayer(
                videoPlayerController,
              ),
            ),
            Container(
              height: screenSize.height * .15,
              width: screenSize.width,
              child: Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_outlined, color: Theme.of(context).colorScheme.primary),
                  ),
                  Text("Video Link Name", style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.primary)),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(videoPlayerController.value.duration.toString(), style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary)),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          height: screenSize.height * 0.03,
                            width: screenSize.width * .73,
                            child: VideoProgressIndicator(videoPlayerController, allowScrubbing: true)),
                        Text(videoPlayerController.value.duration.toString(), style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary)),
                      ],
                    ),
                    IconButton(
                        onPressed: (){
                          setState(() {
                            if(videoPlayerController.value.isPlaying){
                              videoPlayerController.pause();
                            } else {
                              videoPlayerController.play();
                            }
                          });
                        },
                        icon: Icon(videoPlayerController.value.isPlaying? Icons.pause:Icons.play_arrow, size: 50, color: Theme.of(context).colorScheme.primary)),
                  ],
                )),

          ],
        ),
      ):Center(
        child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }

  void setVideoPlayerScreen() async {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(widget.videoLink))..initialize().then((value){
      setState(() {
        videoPlayerController.play();
        _videoPlaying = true;
      });
    });
  }
}
