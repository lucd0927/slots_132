
enum PBPeizhiEnv {
  dev(name: "dev"),
  prod(name: "prod");

  const PBPeizhiEnv({required this.name});

  final String name;
}
