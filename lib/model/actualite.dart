class Actualite {
  final String title;
  final String datetime;

  Actualite({
    required this.title,
    required this.datetime,
  });
  factory Actualite.fromJson(Map<String, dynamic> json) {
    return Actualite(
      title: json['title'] as String,
      datetime: json['datetime'] as String,
    );
  }
}
