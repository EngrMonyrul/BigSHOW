import 'package:bigshow/core/screens/all_file_screen.dart';
import 'package:bigshow/core/screens/video_file_screen.dart';
import 'package:flutter/material.dart';

import '../../data/models/pexels_videos.dart';

class CategoryVideo extends StatelessWidget {
  const CategoryVideo({
    super.key,
    required this.screenSize, required this.label, required this.videoList,
  });

  final Size screenSize;
  final String label;
  final List<Video> videoList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.primary)),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AllFileScreen(title: label, videos: videoList)));
                },
                  child: Text("See All", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.primary))),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: screenSize.height * .2,
            width: screenSize.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                final item = videoList[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> VideoFileScreen(video: item)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(item.image!,height: screenSize.height * .3, width: screenSize.width * .3, fit: BoxFit.fill)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
