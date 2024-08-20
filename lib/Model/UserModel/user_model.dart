// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  var name;
  var email;
  var dateofBirth;
  var phoneNumber;
  var sex;
  var height;
  var weight;
  var targetWeight;
  var goal;
  var id;
  UserModel({
     this.name,
    this.email,
     this.dateofBirth,
     this.phoneNumber,
    this.sex,
     this.height,
     this.weight,
     this.targetWeight,
     this.goal,
     this.id,
  });
  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'dateofBirth': dateofBirth,
      'phoneNumber': phoneNumber,
      'sex': sex,
      'height': height,
      'weight': weight,
      'targetWeight': targetWeight,
      'goal': goal,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      dateofBirth: map['dateofBirth'] as String,
      phoneNumber: map['phoneNumber'] as String,
      sex: map['sex'] as String,
      height: map['height'] as String,
      weight: map['weight'] as String,
      targetWeight: map['targetWeight'] as String,
      goal: map['goal'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
