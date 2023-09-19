import 'package:reqres_app/core/init/network/network_manager.dart';

import '../../ui/pages/root_page/model/users_model.dart';

class ServiceManager {
  static final ServiceManager _instace = ServiceManager._init();
  static ServiceManager get instance {
    return _instace;
  }

  ServiceManager._init();

  Future login(String email, String password) async {
    return await NetworkManager.instance.post(path: "/api/login", data: {"email": email, "password": password});
  }

  Future register(String email, String password) async {
    return await NetworkManager.instance.post(path: "/api/register", data: {"email": email, "password": password});
  }

  Future<UsersModel?> getUsers(int page) async {
    return await NetworkManager.instance.get<UsersModel>(
      path: "/api/users",
      queryParameters: {
        "page": page,
      },
      model: UsersModel(),
    );
  }
}
