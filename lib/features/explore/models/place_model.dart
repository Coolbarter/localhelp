class Place {
  final String id;
  final String name;
  final String city;
  final String description;
  final String imageUrl;
  final List<String> tags;
  final double rating;
  final int reviewCount;
  final List<String> availableGuides;

  Place({
    required this.id,
    required this.name,
    required this.city,
    required this.description,
    required this.imageUrl,
    required this.tags,
    required this.rating,
    required this.reviewCount,
    required this.availableGuides,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'city': city,
    'description': description,
    'imageUrl': imageUrl,
    'tags': tags,
    'rating': rating,
    'reviewCount': reviewCount,
    'availableGuides': availableGuides,
  };

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    id: json['id'],
    name: json['name'],
    city: json['city'],
    description: json['description'],
    imageUrl: json['imageUrl'],
    tags: List<String>.from(json['tags']),
    rating: json['rating'].toDouble(),
    reviewCount: json['reviewCount'],
    availableGuides: List<String>.from(json['availableGuides']),
  );
}
