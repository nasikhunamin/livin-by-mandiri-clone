import 'package:flutter/material.dart';
import 'package:register/src/screens/register_product_screen.dart';
import 'package:dependencies/dependencies.dart';
import 'package:register/src/screens/select_debit_card_screen.dart';

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

abstract class RegisterNavigation {
  static void navigateToSelectDebitCard(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const SelectDebitCardScreen()));
  }
}
