import 'package:bigshow/utils/constants/images.dart';
import 'package:bigshow/utils/constants/strings.dart';

class AppsConst {
  AppsConst._();

  static final splashMovies = [
    {
      "image": AppsImages.imgMovies,
      "title": AppsStrings.welcomeMsg,
      "subTitle": AppsStrings.welcomeMsgSub,
    },
    {
      "image": AppsImages.imgMoviesBolly,
      "title": AppsStrings.bollyTitle,
      "subTitle": AppsStrings.bollySubTitle,
    },
    {
      "image": AppsImages.imgMoviesHolly,
      "title": AppsStrings.hollyTitle,
      "subTitle": AppsStrings.hollySubTitle,
    },
  ];

  static final videoCategory = ["All", "Sci-Fi", "Comedy", "Romantic", "Action", "Emotion", "Others"];
}
