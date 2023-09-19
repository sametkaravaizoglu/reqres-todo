class ApplicationConstants {
  ApplicationConstants._();
  static final ApplicationConstants _instance = ApplicationConstants._();
  static ApplicationConstants get instance => _instance;

  final String _appName = "Reqres App";
  final String _baseURL = "https://reqres.in/";

  get appName => _appName;
  get baseURL => _baseURL;
}
