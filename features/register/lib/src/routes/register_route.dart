import 'package:register/src/screens/register_product_screen.dart';
import 'package:dependencies/dependencies.dart';

final GoRoute registerRoute = GoRoute(
    path: RegisterRoute.register.path,
    name: RegisterRoute.register.name,
    builder: (context, state) {
      return const RegisterProductScreen();
    });

enum RegisterRoute {
  register("register");

  final String path;
  const RegisterRoute(this.path);
}
