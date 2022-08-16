class User {
  final String name;
  final String email;

  const User({required this.name, required this.email});

  User copyWith({String? name, String? email}) {
    return User(name: name ?? this.name, email: email ?? this.email);
  }
}
