import 'dart:convert';

class UserModel {
  final String id;
  final String nama;
  final String email;
  final String role;

  UserModel({
    required this.id,
    required this.nama,
    required this.email,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nama': nama,
      'email': email,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      nama: map['nama'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'role': role,
    };
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, nama: $nama, email: $email, role: $role)';
  }
}
