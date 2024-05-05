import 'package:flutter/widgets.dart';
import 'livin_localizations.dart';

extension Localizations on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
