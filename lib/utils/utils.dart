import 'package:flutter/material.dart';

import 'navigator.dart';

String getCurrentLocalization() =>
    Localizations.localeOf(appNavigator.context).languageCode;
