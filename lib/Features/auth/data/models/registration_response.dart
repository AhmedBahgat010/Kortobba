class RegistrationResponse {
  User? user;
  String? message;


  RegistrationResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
  }

}

class User {
  int? id;
  bool? isSuperuser;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isStaff;
  bool? isActive;
  String? dateJoined;
  // List<dynamic>? groups;
  // List<dynamic>? userPermissions;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isSuperuser = json['is_superuser'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isStaff = json['is_staff'];
    isActive = json['is_active'];
    dateJoined = json['date_joined'];
    // if (json['groups'] != null) {
    //   groups = <Null>[];
    //   json['groups'].forEach((v) {
    //     groups!.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['user_permissions'] != null) {
    //   userPermissions = <Null>[];
    //   json['user_permissions'].forEach((v) {
    //     userPermissions!.add(new Null.fromJson(v));
    //   });
    // }
  }

}