import 'package:bigshow/common/const_files/const.dart';
import 'package:bigshow/core/providers/home_screen_provider.dart';
import 'package:bigshow/core/screens/favorite_screen.dart';
import 'package:bigshow/core/screens/search_screen.dart';
import 'package:bigshow/core/screens/video_file_screen.dart';
import 'package:bigshow/core/screens/video_player_screen.dart';
import 'package:bigshow/data/models/pexels_videos.dart';
import 'package:bigshow/data/services/pexels_web.dart';
import 'package:bigshow/utils/constants/colors.dart';
import 'package:bigshow/utils/constants/strings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/category_video.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<HomeScreenProvider>(
          builder: (context, child, value) {
            if (child.fetchingData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenSize.height * .45,
                    width: screenSize.width,
                    child: Stack(
                      children: [
                        /*--------------> Movie Image <-------------*/
                        CarouselSlider.builder(
                          options: CarouselOptions(
                              autoPlay: true,
                              height: screenSize.height * .45,
                              viewportFraction: 1),
                          itemCount: 10,
                          itemBuilder: (context, index, realIndex) {
                            final item = child.pexelsVideos.videos![index];
                            return Stack(
                              children: [
                                /*---------------> Movie Image <---------------*/
                                Image.network(item.image!,
                                    fit: BoxFit.fill,
                                    height: screenSize.height * .45,
                                    width: screenSize.width),
                                /*---------------> Shadow Colors <--------------*/
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoFileScreen(video: item)));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          gradient: AppsColors.linearColor)),
                                ),
                                /*---------------> Movie Details <---------------*/
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      /*---------------> Movie Name <--------------*/
                                      Text(item.user!.name!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary)),
                                      const SizedBox(height: 10),
                                      /*----------------> Movie Type <----------------*/
                                      Text(item.user!.id!.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary)),
                                      const SizedBox(height: 10),
                                      /*------------> Video Watch Section <------------*/
                                      Row(
                                        children: [
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
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        /*---------------> Appbar <---------------*/
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SizedBox(
                      height: screenSize.height * .04,
                      width: screenSize.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: AppsConst.videoCategory.length,
                        itemBuilder: (context, index) {
                          final item = AppsConst.videoCategory[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2.0),
                            child: ElevatedButton(onPressed: (){}, child: Text(item)),
                          );
                        },
                      ),
                    ),
                  ),
                  CategoryVideo(screenSize: screenSize, label: "New Release", videoList: child.pexelsVideos.videos!),
                  CategoryVideo(screenSize: screenSize, label: "Hollywood", videoList: child.pexelsVideos.videos!),
                  CategoryVideo(screenSize: screenSize, label: "Bollywood", videoList: child.pexelsVideos.videos!),
                  CategoryVideo(screenSize: screenSize, label: "Others", videoList: child.pexelsVideos.videos!),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

