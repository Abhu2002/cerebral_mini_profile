class Profile {
  final String name;
  final int age;
  final String bio;
  final String? description;
  final String image;
  final List<String> interests;

  Profile({
    required this.name,
    required this.age,
    required this.bio,
    required this.description,
    required this.image,
    required this.interests,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'] ?? 'Unknown',
      age: json['age'] ?? 0,
      bio: json['bio'] ?? '',
      description: json['description'],
      image: json['image'] ?? '',
      interests: List<String>.from(json['interests'] ?? []),
    );
  }
}
