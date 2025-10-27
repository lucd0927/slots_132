
enum SSHuanjingEnv {
  dev(name: "dev"),
  prod(name: "prod");

  const SSHuanjingEnv({required this.name});

  final String name;
}
