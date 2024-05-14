enum LivinRoutes {
  // routes
  splash("/splash"),
  onboarding("/onboarding"),
  main("/"),

  // sub-routes
  register("register");

  final String path;
  const LivinRoutes(this.path);
}
