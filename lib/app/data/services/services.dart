import 'package:reqres_app/core/init/network/network_manager.dart';

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
}
