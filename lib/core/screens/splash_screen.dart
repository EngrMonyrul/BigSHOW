import 'dart:ui';

import 'package:bigshow/common/const_files/const.dart';
import 'package:bigshow/core/screens/home_screen.dart';
import 'package:bigshow/data/local/local_storage.dart';
import 'package:bigshow/utils/constants/colors.dart';
import 'package:bigshow/utils/constants/images.dart';
import 'package:bigshow/utils/constants/others.dart';
import 'package:bigshow/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LocalStorage localStorage = LocalStorage();
  PageController pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              itemCount: AppsConst.splashMovies.length,
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemBuilder: (context, index) {
                final imageItem = AppsConst.splashMovies[index];
                return Center(
                  child: Column(
                    children: [
                      Image.asset(imageItem["image"]!, fit: BoxFit.fill, height: screenSize.height, width: screenSize.width),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: screenSize.height * .5,
              width: screenSize.width,
              padding: const EdgeInsets.only(top: 200.0, bottom: 8.0),
              decoration: BoxDecoration(
                gradient: AppsColors.linearColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(AppsConst.splashMovies[currentPage]["title"]!, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                  Text(AppsConst.splashMovies[currentPage]["subTitle"]!, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondary)),
                  const Spacer(),
                  SmoothPageIndicator(
                    axisDirection: Axis.horizontal,
                    controller: pageController,
                    count: AppsConst.splashMovies.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Theme.of(context).colorScheme.primary,
                      dotColor: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: (){
                      if(currentPage < (AppsConst.splashMovies.length-1)){
                        pageController.nextPage(duration: AppsOthersConst.pageChangeDuration, curve: Curves.easeInOut);
                      } else {
                        localStorage.setLogged();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const HomeScreen()));
                      }
                    },
                    child: Text(
                      currentPage < (AppsConst.splashMovies.length-1)?
                          "Go Next":"Get Started",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
