class User {
  String id;
  String username;
  String email;
  // You can add more properties as needed, such as profile picture, bio, etc.

  User({
    required this.id,
    required this.username,
    required this.email,
  });

  // Factory constructor to create a User object from a map (e.g., from Firebase)
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['email'],
    );
  }

  // Method to convert User object to a map (e.g., for Firebase)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }
}
