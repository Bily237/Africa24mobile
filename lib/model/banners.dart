class Banners {
  final String path;
  Banners({
    required this.path,

  });
  factory Banners.fromJson(Map<String, dynamic> json) {
    return Banners(
      path: json['path'] as String,
    );
  }
}
