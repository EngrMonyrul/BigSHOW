import 'package:bigshow/core/providers/home_screen_provider.dart';
import 'package:bigshow/core/screens/video_file_screen.dart';
import 'package:bigshow/core/screens/video_player_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/pexels_videos.dart';
import '../../utils/constants/strings.dart';

class AllFileScreen extends StatefulWidget {
  final String title;
  final List<Video> videos;
  const AllFileScreen({super.key, required this.title, required this.videos});

  @override
  State<AllFileScreen> createState() => _AllFileScreenState();
}

class _AllFileScreenState extends State<AllFileScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<HomeScreenProvider>(
        builder: (context, child, value) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: widget.videos.length,
            itemBuilder: (context, index) {
              final item = widget.videos[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoFileScreen(video: item)));
                },
                child: Container(
                  height: screenSize.height * .2,
                  width: screenSize.width,
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(item.image!, height: screenSize.height * .2, width: screenSize.width * .3, fit: BoxFit.fill),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.user!.name!, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.primary)),
                            Text(item.user!.id!.toString()),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoPlayerScreen(videoLink: item.videoFiles![0].link!)));
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
                                if(!child.favList.any((element) => element.user!.name == item.user!.name)){
                                  child.setFavList(value: item);
                                } else {
                                  child.removeFavList(video: item);
                                }
                              },
                              child: Row(
                                children: [
                                  Icon(!child.favList.any((element) => element.user!.name == item.user!.name)? Icons.add_circle_outlined:Icons.check_circle),
                                  const SizedBox(width: 5),
                                  const Text(AppsStrings.vdoFavTxt),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
