class Guide {
  final String id;
  final String name;
  final double rating;
  final int reviewCount;
  final String availability;
  final String availabilityTime;

  Guide({
    required this.id,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.availability,
    required this.availabilityTime,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'rating': rating,
    'reviewCount': reviewCount,
    'availability': availability,
    'availabilityTime': availabilityTime,
  };

  factory Guide.fromJson(Map<String, dynamic> json) => Guide(
    id: json['id'],
    name: json['name'],
    rating: json['rating'].toDouble(),
    reviewCount: json['reviewCount'],
    availability: json['availability'],
    availabilityTime: json['availabilityTime'],
  );
}
