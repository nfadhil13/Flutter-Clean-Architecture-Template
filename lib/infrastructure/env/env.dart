enum ENV {
  dev(baseURL: "https://api-dev.utilityfielding.com"),
  prod(baseURL: "https://api.utilityfielding.com");

  final String baseURL;

  const ENV({required this.baseURL});

  static ENV current = ENV.dev;

  static void setEnv(ENV env) => current = env;
}
