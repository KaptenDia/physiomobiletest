import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:physiomobile/const/images.dart';
import 'package:physiomobile/exlib.dart';
import 'package:physiomobile/page/submit/submit_provider.dart';
import 'package:physiomobile/utils/size.dart';

class SubmitPage extends ConsumerWidget {
  const SubmitPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(submitProvider);
    return Scaffold(
      backgroundColor: appColors.backgroundPrimary,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: paddingScreen().bottom + 16),
            child: Container(
              color: appColors.backgroundPrimary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    logoPhysioMobile,
                    height: 180,
                  ),
                  const _Form(),
                  const _Button(),
                  Visibility(
                      visible: provider.isValid, child: const _ShowData()),
                  const _Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends ConsumerWidget {
  const _Form();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.read(submitProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Form(
        key: login.key,
        autovalidateMode: login.autoValidateMode,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FieldDefault(
              controller: login.usernameController,
              hint: 'Full Name',
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validationType: ValidationType.required,
            ),
            FieldDefault(
              controller: login.emailController,
              hint: 'Email',
              textInputAction: TextInputAction.done,
              validationType: ValidationType.email,
              textInputType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends ConsumerWidget {
  const _Button();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(submitProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
      child: ButtonDefault(
          title: 'Submit',
          margin: const EdgeInsets.only(top: 24),
          color: appColors.primary,
          onPressed: () => login.submit()),
    );
  }
}

class _ShowData extends ConsumerWidget {
  const _ShowData();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final login = ref.watch(submitProvider);
    return Card(
      color: appColors.separator,
      margin: const EdgeInsets.only(top: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text('Full Name: ${login.usernameController.text}'),
            Text('Email: ${login.emailController.text}'),
          ],
        ),
      ),
    );
  }
}

class _Footer extends ConsumerWidget {
  const _Footer();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.read(submitProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: paddingScreen().bottom + 16),
            child: Text(
              '© 2025 PhysioMobile',
              style: AppTextStyle.body.copyWith(
                fontWeight: FontWeight.w500,
                color: appColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
