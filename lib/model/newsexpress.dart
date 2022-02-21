class Newsexpress {
  final String title;
  final String body;
  final String date;

  Newsexpress({
    required this.title,
    required this.body,
    required this.date,
  });
  factory Newsexpress.fromJson(Map<String, dynamic> json) {
    return Newsexpress(
      title: json['title'] as String,
      body: json['resume'] as String,
      date: json['created_at'] as String,
    );
  }
}