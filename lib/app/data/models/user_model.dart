import 'package:reqres_app/core/base/model/base_model.dart';

class UserModel extends IBaseModel {
  int? id;
  String? token;

  UserModel({
    this.id,
    this.token,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
        id: json["id"],
        token: json["token"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "token": token,
      };

  @override
  fromJson(Map json) {
    return UserModel.fromJson(json);
  }
}
