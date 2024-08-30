class UserDetails {
  final String name;
  final String email;

  final int age;
  final String password;

  UserDetails({
    required this.name,
    required this.email,
    required this.age,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'age': age, 'password': password};
  }

  factory UserDetails.fromMap(Map<String, dynamic> map) {
    return UserDetails(
        name: map['name'],
        email: map['email'],
        age: map['age'],
        password: map['password']);
  }
}
