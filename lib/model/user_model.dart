class UserModel {
  String? userId ;
  String? email ;
  String? name ;
  String pic;

  UserModel({required this.name, required this.email, required this.userId, required this.pic});

  UserModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        email = json['email'],
        name = json['name'],
        pic = json['pic'];

  toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'pic': pic,
    };
  }

  // Map<String, dynamic> toJson() => {
  //       'name': name,
  //       'email': email,
  //     };
}


// class UserModel {
//   String userId, email, name, pic;
//   UserModel(
//       {required this.userId,
//       required this.email,
//       required this.name,
//       required this.pic});

//   UserModel.fromJson(Map<dynamic, dynamic> map) {
//     if (map == null) {
//       return;
//     }
//     userId = map['userID'];
//     email = map['email'];
//     name = map['name'];
//     pic = map['pic'];
//   }
// }



