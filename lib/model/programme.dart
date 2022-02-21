class Programme {
  final String title;
  final String slug;

  Programme(  {
    required this.title,
    required this.slug,
  });
  factory Programme.fromJson(Map<String, dynamic> json) {
    return Programme(
      title: json['title'] as String,
      slug: json['slug'] as String,
    );
  }
}
// geo: Geo.fromJson(json["geo"]),