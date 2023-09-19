abstract class IBaseModel<T> {
  Map<dynamic, dynamic> toJson();
  T fromJson(Map<dynamic, dynamic> json);
}
