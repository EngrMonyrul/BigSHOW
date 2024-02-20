import 'package:bigshow/core/providers/home_screen_provider.dart';
import 'package:bigshow/core/screens/home_screen.dart';
import 'package:bigshow/core/screens/search_screen.dart';
import 'package:bigshow/core/screens/video_player_screen.dart';
import 'package:bigshow/data/models/pexels_videos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/constants/strings.dart';
import 'favorite_screen.dart';

class VideoFileScreen extends StatefulWidget {
  final Video video;
  const VideoFileScreen({super.key, required this.video});

  @override
  State<VideoFileScreen> createState() => _VideoFileScreenState();
}

class _VideoFileScreenState extends State<VideoFileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<HomeScreenProvider>(
          builder: (context, child, value) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      SizedBox(child: Image.network(widget.video.image!, height: screenSize.height * .45, width: screenSize.width, fit: BoxFit.fill)),
                      Container(
                        height: screenSize.height * .05,
                        width: screenSize.width,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Text(AppsStrings.appName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary)),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const SearchScreen()));
                                },
                                icon: Icon(CupertinoIcons.search,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary)),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const FavoriteScreen()));
                                },
                                icon: Icon(Icons.add_circle_outlined,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary)),
                            IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                                },
                                icon: Icon(Icons.home,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.video.user!.name!, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.primary)),
                                const SizedBox(height: 10),
                                Text(widget.video.user!.id!.toString()),
                              ],
                            ),
                            IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.cloud_download, color: Theme.of(context).colorScheme.primary, size: 40),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoPlayerScreen(videoLink: widget.video.videoFiles![0].link!)));
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.play_circle),
                                  SizedBox(width: 5),
                                  Text(AppsStrings.vdoPlyTxt),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                if(!child.favList.any((element) => element.user!.name == widget.video.user!.name)){
                                  child.setFavList(value: widget.video);
                                } else {
                                  child.removeFavList(video: widget.video);
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(!child.favList.any((element) => element.user!.name == widget.video.user!.name)? Icons.add_circle_outlined:Icons.check_circle),
                                  const SizedBox(width: 5),
                                  const Text(AppsStrings.vdoFavTxt),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: (4/5)),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final item = child.pexelsVideos.videos![index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoFileScreen(video: item)));
                          },
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                    child: Image.network(item.image!, fit: BoxFit.fill, height: double.infinity, width: double.infinity)),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(item.user!.name!, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
