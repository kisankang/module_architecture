enum Environment { PRODUCTION, STAGING }

class AppConfig {
  Map<String, dynamic> config;
  Environment env;
  AppConfig({required this.config, required this.env});
  get baseURL => config[BASE_URL];
}

const String BASE_URL = "_baseurl";
