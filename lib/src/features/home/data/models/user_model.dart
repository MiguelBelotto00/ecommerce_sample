//Model Example:
//  {
//   "id": 1,
//   "firstName": "Terry",
//   "lastName": "Medhurst",
//   "maidenName": "Smitham",
//   "age": 50,
//   "gender": "male",
//   "email": "atuny0@sohu.com",
//   "phone": "+63 791 675 8914",
//   "username": "atuny0",
//   "password": "9uQFF1Lh",
//   "birthDate": "2000-12-25",
//   "image": "https://robohash.org/Terry.png?set=set4"
//   }

import 'package:ecommerce_sample/src/features/home/domain/entities/user_entity.dart';
import 'package:intl/intl.dart';

class UserModel {
  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.birthDate,
    required this.email,
    required this.gender,
    required this.phone,
    required this.image,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String birthDate;
  final String image;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      maidenName: json['maidenName'] as String,
      age: json['age'] as int,
      birthDate: json['birthDate'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      phone: json['phone'] as String,
      image: json['image'] as String,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
        id: id,
        firstName: firstName,
        lastName: lastName,
        maidenName: maidenName,
        age: age,
        gender: gender,
        phone: phone,
        birthDate: DateFormat('yyyy-MM-dd').parse(birthDate),
        image: image,
        email: email);
  }

  @override
  String toString() {
    return '''UserModel(
        id: $id,
        firstName: $firstName,
        lastName: $lastName,
        maidenName: $maidenName,
        age: $age,
        birthDate: $birthDate,
        email: $email,
        gender: $gender,
        phone: $phone,
        image: $image)''';
  }
}
