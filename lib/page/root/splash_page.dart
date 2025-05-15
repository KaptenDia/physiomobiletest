import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:physiomobile/const/images.dart';
import 'package:physiomobile/exlib.dart';
import 'package:physiomobile/page/root/splash_provider.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(splashProvider);
    provider.setRef(ref);
    return Scaffold(
      backgroundColor: appColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: appColors.backgroundPrimary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Center(
          child: Image.asset(
            logoPhysioMobile,
            width: MediaQuery.of(context).size.width / 2 - 24,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
