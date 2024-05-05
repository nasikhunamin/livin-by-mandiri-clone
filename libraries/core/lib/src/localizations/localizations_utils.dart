import 'package:flutter/widgets.dart';

import 'app_localizations.dart';

extension Localizations on String {
  String trans(BuildContext context) {
    return WmcsLocalizations.of(context).trans(this);
  }
}
