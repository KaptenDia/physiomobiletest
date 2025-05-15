import 'package:flutter/material.dart';

import 'navigator.dart';

/// Returns the padding of the screen.
/// The padding is obtained from the [MediaQuery] of the [appNavigator.context].
EdgeInsets paddingScreen() => MediaQuery.of(appNavigator.context).padding;

/// Returns the size of the screen.
///
/// This function uses the `MediaQuery` class to obtain the size of the screen
/// based on the `context` of the `appNavigator`. It returns a `Size` object
/// representing the width and height of the screen.
Size sizeScreen() => MediaQuery.of(appNavigator.context).size;
