import 'dart:convert';

GifModel gifModelFromJson(String str) => GifModel.fromJson(json.decode(str));

String gifModelToJson(GifModel data) => json.encode(data.toJson());

class GifModel {
  GifModel({
    required this.data,
  });

  List<Datum> data;

  factory GifModel.fromJson(Map<String, dynamic> json) => GifModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.url,
    required this.slug,
    required this.bitlyGifUrl,
    required this.bitlyUrl,
    required this.embedUrl,
    required this.username,
    required this.source,
    required this.title,
    required this.contentUrl,
    required this.sourceTld,
    required this.sourcePostUrl,
    required this.isSticker,
    required this.importDatetime,
    required this.trendingDatetime,
    required this.images,
    required this.analyticsResponsePayload,
    required this.user,
  });

  Type? type;
  String id;
  String url;
  String slug;
  String bitlyGifUrl;
  String bitlyUrl;
  String embedUrl;
  String username;
  String source;
  String title;
  String contentUrl;
  String sourceTld;
  String sourcePostUrl;
  int isSticker;
  DateTime importDatetime;
  dynamic trendingDatetime;
  Images images;
  String analyticsResponsePayload;
  User? user;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    url: json["url"],
    slug: json["slug"],
    bitlyGifUrl: json["bitly_gif_url"],
    bitlyUrl: json["bitly_url"],
    embedUrl: json["embed_url"],
    username: json["username"],
    source: json["source"],
    title: json["title"],
    contentUrl: json["content_url"],
    sourceTld: json["source_tld"],
    sourcePostUrl: json["source_post_url"],
    isSticker: json["is_sticker"],
    importDatetime: DateTime.parse(json["import_datetime"]),
    trendingDatetime: json["trending_datetime"],
    images: Images.fromJson(json["images"]),
    analyticsResponsePayload: json["analytics_response_payload"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "slug": slug,
    "bitly_gif_url": bitlyGifUrl,
    "bitly_url": bitlyUrl,
    "embed_url": embedUrl,
    "username": username,
    "source": source,
    "title": title,
    "content_url": contentUrl,
    "source_tld": sourceTld,
    "source_post_url": sourcePostUrl,
    "is_sticker": isSticker,
    "import_datetime": importDatetime.toIso8601String(),
    "trending_datetime": trendingDatetime,
    "images": images.toJson(),
    "analytics_response_payload": analyticsResponsePayload,
  };
}

class Images {
  Images({
    required this.original,
    required this.fixedHeight,
    required this.fixedWidth,
  });

  FixedHeight original;
  FixedHeight fixedHeight;
  FixedHeight fixedWidth;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    original: FixedHeight.fromJson(json["original"]),
    fixedHeight: FixedHeight.fromJson(json["fixed_height"]),
    fixedWidth: FixedHeight.fromJson(json["fixed_width"]),
  );

  Map<String, dynamic> toJson() => {
    "original": original.toJson(),
    "fixed_height": fixedHeight.toJson(),
    "fixed_width": fixedWidth.toJson(),
  };
}

class FixedHeight {
  FixedHeight({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4Size,
    required this.mp4,
    required this.webpSize,
    required this.webp,
    this.frames,
    this.hash,
  });

  String height;
  String width;
  String size;
  String url;
  String mp4Size;
  String mp4;
  String webpSize;
  String webp;
  String? frames;
  String? hash;

  factory FixedHeight.fromJson(Map<String, dynamic> json) => FixedHeight(
    height: json["height"],
    width: json["width"],
    size: json["size"],
    url: json["url"],
    mp4Size: json["mp4_size"] ?? null,
    mp4: json["mp4"] ?? null,
    webpSize: json["webp_size"],
    webp: json["webp"],
    frames: json["frames"] ?? null,
    hash: json["hash"] ?? null,
  );

  Map<String, dynamic> toJson() => {
    "height": height,
    "width": width,
    "size": size,
    "url": url,
    "mp4_size": mp4Size == null ? null : mp4Size,
    "mp4": mp4 == null ? null : mp4,
    "webp_size": webpSize,
    "webp": webp,
    "frames": frames == null ? null : frames,
    "hash": hash == null ? null : hash,
  };
}

class User {
  User({
    required this.avatarUrl,
    required this.bannerImage,
    required this.bannerUrl,
    required this.profileUrl,
    required this.username,
    required this.displayName,
    required this.description,
    required this.instagramUrl,
    required this.websiteUrl,
    required this.isVerified,
  });

  String avatarUrl;
  String bannerImage;
  String bannerUrl;
  String profileUrl;
  String username;
  String displayName;
  String description;
  String instagramUrl;
  String websiteUrl;
  bool isVerified;

  factory User.fromJson(Map<String, dynamic> json) => User(
    avatarUrl: json["avatar_url"],
    bannerImage: json["banner_image"],
    bannerUrl: json["banner_url"],
    profileUrl: json["profile_url"],
    username: json["username"],
    displayName: json["display_name"],
    description: json["description"],
    instagramUrl: json["instagram_url"],
    websiteUrl: json["website_url"],
    isVerified: json["is_verified"],
  );

  Map<String, dynamic> toJson() => {
    "avatar_url": avatarUrl,
    "banner_image": bannerImage,
    "banner_url": bannerUrl,
    "profile_url": profileUrl,
    "username": username,
    "display_name": displayName,
    "description": description,
    "instagram_url": instagramUrl,
    "website_url": websiteUrl,
    "is_verified": isVerified,
  };
}