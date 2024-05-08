import 'package:flutter/material.dart';
import 'package:register/src/screens/number_phone_screen.dart';
import 'package:register/src/screens/register_product_screen.dart';
import 'package:dependencies/dependencies.dart';
import 'package:register/src/screens/register_tnc_screen.dart';
import 'package:register/src/screens/select_debit_card_screen.dart';
import 'package:register/src/screens/take_id_screen.dart';
import 'package:ui/ui.dart';

import '../screens/search_country_code_screen.dart';

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
    Navigator.of(context)
        .push(Transition.createRoute(const SelectDebitCardScreen()));
  }

  static void navigateToTnc(BuildContext context) {
    Navigator.of(context)
        .push(Transition.createRoute(const RegisterTncScreen()));
  }

  static void navigateToTakeId(BuildContext context) {
    Navigator.of(context).push(Transition.createRoute(const TakeidScreen()));
  }

  static void navigateToNumberPhone(BuildContext context) {
    Navigator.of(context)
        .push(Transition.createRoute(const NumberPhoneScreen()));
  }

  static Future<String>? navigateToSearchCountryCode(
      BuildContext context) async {
    var result = await Navigator.of(context)
        .push(Transition.createRoute(const SearchCountryCodeScreen()));

    if (result != null) {
      return result;
    } else {
      return "";
    }
  }
}
