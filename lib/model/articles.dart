class Articles {
  String title;
  String slug;
  Category category;
  String image;
  String resume;
  String body;
  String video;
  String createdAt;
  Author author;

  Articles(
      {required this.title,
        required this.slug,
        required this.category,
        required this.image,
        required this.resume,
        required this.body,
        required this.video,
        required this.createdAt,
        required this.author,
        });

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      title: json['title'] as String,
      body: json['resume'] as String,
      createdAt: json['created_at'] as String,
      author:  Author.fromJson(json['author']),
      slug: json['slug'] as String,
      video: json['video'] as String,
      image: json['image'] as String,
      category:Category.fromJson(json['category']),
      resume: json['resume'] as String,
    );
  }
}

class Category {
  String title;
  String slug;

  Category({required this.title,required this.slug});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        title: json['title'] as String,
        slug: json['slug'] as String);
  }
}

class Author {
  String firstName;
  String lastName;
  String email;

  Author({required this.firstName,required this.lastName,required this.email});

  factory Author.fromJson(Map<String, dynamic> json) {
   return Author(
       firstName: json['firstName'] as String,
       lastName: json['lastName'] as String,
       email: json['email'] as String);
  }

}
