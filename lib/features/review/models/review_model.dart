class Review {
  final String id;
  final String userId;
  final String guideId;
  final String placeId;
  final double rating;
  final String comment;
  final DateTime createdAt;
  final List<String>? photos;

  Review({
    required this.id,
    required this.userId,
    required this.guideId,
    required this.placeId,
    required this.rating,
    required this.comment,
    required this.createdAt,
    this.photos,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'guideId': guideId,
    'placeId': placeId,
    'rating': rating,
    'comment': comment,
    'createdAt': createdAt.toIso8601String(),
    'photos': photos,
  };

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json['id'],
    userId: json['userId'],
    guideId: json['guideId'],
    placeId: json['placeId'],
    rating: json['rating'].toDouble(),
    comment: json['comment'],
    createdAt: DateTime.parse(json['createdAt']),
    photos: json['photos'] != null ? List<String>.from(json['photos']) : null,
  );
}
