import 'dart:convert';

PexelsVideos pexelsVideosFromJson(String str) =>
    PexelsVideos.fromJson(json.decode(str));

String pexelsVideosToJson(PexelsVideos data) => json.encode(data.toJson());

class PexelsVideos {
  int? page;
  int? perPage;
  List<Video>? videos;
  int? totalResults;
  String? nextPage;
  String? url;

  PexelsVideos({
    this.page,
    this.perPage,
    this.videos,
    this.totalResults,
    this.nextPage,
    this.url,
  });

  PexelsVideos copyWith({
    int? page,
    int? perPage,
    List<Video>? videos,
    int? totalResults,
    String? nextPage,
    String? url,
  }) =>
      PexelsVideos(
        page: page ?? this.page,
        perPage: perPage ?? this.perPage,
        videos: videos ?? this.videos,
        totalResults: totalResults ?? this.totalResults,
        nextPage: nextPage ?? this.nextPage,
        url: url ?? this.url,
      );

  factory PexelsVideos.fromJson(Map<String, dynamic> json) => PexelsVideos(
        page: json["page"],
        perPage: json["per_page"],
        videos: json["videos"] == null
            ? []
            : List<Video>.from(json["videos"]!.map((x) => Video.fromJson(x))),
        totalResults: json["total_results"],
        nextPage: json["next_page"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "videos": videos == null
            ? []
            : List<dynamic>.from(videos!.map((x) => x.toJson())),
        "total_results": totalResults,
        "next_page": nextPage,
        "url": url,
      };

  @override
  String toString() {
    return 'PexelsVideos{page: $page, perPage: $perPage, videos: $videos, totalResults: $totalResults, nextPage: $nextPage, url: $url}';
  }
}

class Video {
  int? id;
  int? width;
  int? height;
  int? duration;
  dynamic fullRes;
  List<dynamic>? tags;
  String? url;
  String? image;
  dynamic avgColor;
  User? user;
  List<VideoFile>? videoFiles;
  List<VideoPicture>? videoPictures;

  Video({
    this.id,
    this.width,
    this.height,
    this.duration,
    this.fullRes,
    this.tags,
    this.url,
    this.image,
    this.avgColor,
    this.user,
    this.videoFiles,
    this.videoPictures,
  });

  Video copyWith({
    int? id,
    int? width,
    int? height,
    int? duration,
    dynamic fullRes,
    List<dynamic>? tags,
    String? url,
    String? image,
    dynamic avgColor,
    User? user,
    List<VideoFile>? videoFiles,
    List<VideoPicture>? videoPictures,
  }) =>
      Video(
        id: id ?? this.id,
        width: width ?? this.width,
        height: height ?? this.height,
        duration: duration ?? this.duration,
        fullRes: fullRes ?? this.fullRes,
        tags: tags ?? this.tags,
        url: url ?? this.url,
        image: image ?? this.image,
        avgColor: avgColor ?? this.avgColor,
        user: user ?? this.user,
        videoFiles: videoFiles ?? this.videoFiles,
        videoPictures: videoPictures ?? this.videoPictures,
      );

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        width: json["width"],
        height: json["height"],
        duration: json["duration"],
        fullRes: json["full_res"],
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
        url: json["url"],
        image: json["image"],
        avgColor: json["avg_color"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        videoFiles: json["video_files"] == null
            ? []
            : List<VideoFile>.from(
                json["video_files"]!.map((x) => VideoFile.fromJson(x))),
        videoPictures: json["video_pictures"] == null
            ? []
            : List<VideoPicture>.from(
                json["video_pictures"]!.map((x) => VideoPicture.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "width": width,
        "height": height,
        "duration": duration,
        "full_res": fullRes,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "url": url,
        "image": image,
        "avg_color": avgColor,
        "user": user?.toJson(),
        "video_files": videoFiles == null
            ? []
            : List<dynamic>.from(videoFiles!.map((x) => x.toJson())),
        "video_pictures": videoPictures == null
            ? []
            : List<dynamic>.from(videoPictures!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Video{id: $id, width: $width, height: $height, duration: $duration, fullRes: $fullRes, tags: $tags, url: $url, image: $image, avgColor: $avgColor, user: $user, videoFiles: $videoFiles, videoPictures: $videoPictures}';
  }
}

class User {
  int? id;
  String? name;
  String? url;

  User({
    this.id,
    this.name,
    this.url,
  });

  User copyWith({
    int? id,
    String? name,
    String? url,
  }) =>
      User(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };

  @override
  String toString() {
    return 'User{id: $id, name: $name, url: $url}';
  }
}

class VideoFile {
  int? id;
  Quality? quality;
  FileType? fileType;
  int? width;
  int? height;
  double? fps;
  String? link;

  VideoFile({
    this.id,
    this.quality,
    this.fileType,
    this.width,
    this.height,
    this.fps,
    this.link,
  });

  VideoFile copyWith({
    int? id,
    Quality? quality,
    FileType? fileType,
    int? width,
    int? height,
    double? fps,
    String? link,
  }) =>
      VideoFile(
        id: id ?? this.id,
        quality: quality ?? this.quality,
        fileType: fileType ?? this.fileType,
        width: width ?? this.width,
        height: height ?? this.height,
        fps: fps ?? this.fps,
        link: link ?? this.link,
      );

  factory VideoFile.fromJson(Map<String, dynamic> json) => VideoFile(
        id: json["id"],
        quality: qualityValues.map[json["quality"]]!,
        fileType: fileTypeValues.map[json["file_type"]]!,
        width: json["width"],
        height: json["height"],
        fps: json["fps"]?.toDouble(),
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quality": qualityValues.reverse[quality],
        "file_type": fileTypeValues.reverse[fileType],
        "width": width,
        "height": height,
        "fps": fps,
        "link": link,
      };

  @override
  String toString() {
    return 'VideoFile{id: $id, quality: $quality, fileType: $fileType, width: $width, height: $height, fps: $fps, link: $link}';
  }
}

enum FileType { VIDEO_MP4 }

final fileTypeValues = EnumValues({"video/mp4": FileType.VIDEO_MP4});

enum Quality { HD, SD }

final qualityValues = EnumValues({"hd": Quality.HD, "sd": Quality.SD});

class VideoPicture {
  int? id;
  int? nr;
  String? picture;

  VideoPicture({
    this.id,
    this.nr,
    this.picture,
  });

  VideoPicture copyWith({
    int? id,
    int? nr,
    String? picture,
  }) =>
      VideoPicture(
        id: id ?? this.id,
        nr: nr ?? this.nr,
        picture: picture ?? this.picture,
      );

  factory VideoPicture.fromJson(Map<String, dynamic> json) => VideoPicture(
        id: json["id"],
        nr: json["nr"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nr": nr,
        "picture": picture,
      };

  @override
  String toString() {
    return 'VideoPicture{id: $id, nr: $nr, picture: $picture}';
  }
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }

  @override
  String toString() {
    return 'EnumValues{map: $map, reverseMap: $reverseMap}';
  }
}
