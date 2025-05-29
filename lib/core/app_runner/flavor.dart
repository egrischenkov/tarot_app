enum Flavor {
  dev,
  prod;

  bool get isProd => this == Flavor.prod;

  bool get isDev => this == Flavor.dev;
}
