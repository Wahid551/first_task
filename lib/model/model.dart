class Album {
  final int userId;
  final int id;
  final String title;
  final String body;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      body: json['body'],
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
