import 'dart:convert';

AppInfo appInfoFromJson(String str) => AppInfo.fromJson(json.decode(str));

String appInfoToJson(AppInfo data) => json.encode(data.toJson());

class AppInfo {
  String? phone;
  String? link;
  String? version;
  String? email;

  AppInfo({
    this.phone,
    this.link,
    this.version,
    this.email,
  });

  AppInfo copyWith({
    String? phone,
    String? link,
    String? version,
    String? email,
  }) =>
      AppInfo(
        phone: phone ?? this.phone,
        link: link ?? this.link,
        version: version ?? this.version,
        email: email ?? this.email,
      );

  factory AppInfo.fromJson(Map<String, dynamic> json) => AppInfo(
        phone: json["phone"],
        link: json["link"],
        version: json["version"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "link": link,
        "version": version,
        "email": email,
      };
}
