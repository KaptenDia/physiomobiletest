import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

import '../../utils/validator.dart';
import 'app_colors.dart';
import 'app_text_style.dart';

class FieldDefault extends StatelessWidget {
  final TextEditingController? controller;
  final String? title;
  final String hint;
  final ValidationType? validationType;
  final String? validatorMessage;
  final String? valuePassword2;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final EdgeInsets margin;
  final bool obscureText;
  final bool readOnly;
  final Function(String)? onChanged;
  final Function? onTap;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final bool isDatePicker;
  final bool isWithNumberFormatter;
  final bool isWithNpwpFormatter;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final String? counterText;
  final TextCapitalization? textCapitalization;
  final int? minLength;

  const FieldDefault({
    super.key,
    this.controller,
    this.title,
    required this.hint,
    this.validationType,
    this.validatorMessage,
    this.valuePassword2,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.margin = const EdgeInsets.fromLTRB(0, 0, 0, 20),
    this.obscureText = false,
    this.readOnly = false,
    this.onChanged,
    this.onTap,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.suffixIcon,
    this.isDatePicker = false,
    this.isWithNumberFormatter = false,
    this.isWithNpwpFormatter = false,
    this.validator,
    this.counterText,
    this.textCapitalization,
    this.minLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text(
                title ?? '-',
                style: AppTextStyle.body,
              ),
            ),
          TextFormField(
            controller: controller,
            validator: validator ?? _validator,
            readOnly: readOnly,
            autocorrect: false,
            style: AppTextStyle.field.copyWith(color: appColors.textPrimary),
            textInputAction: textInputAction,
            keyboardType: textInputType,
            obscureText: obscureText,
            maxLines: obscureText
                ? 1
                : minLines > 1
                    ? minLines
                    : maxLines,
            minLines: obscureText ? 1 : minLines,
            maxLength: (textInputType == TextInputType.phone) ? 13 : maxLength,
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            onChanged: onChanged,
            inputFormatters: [
              if (textInputType == TextInputType.name)
                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z\\'\\s\\.]")),
              if (textInputType == TextInputType.number ||
                  textInputType == TextInputType.phone)
                FilteringTextInputFormatter.digitsOnly,
              if (maxLength == 15)
                LengthLimitingTextInputFormatter(15,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced),
              if (isWithNumberFormatter) ThousandsFormatter(),
              if (isWithNpwpFormatter)
                MaskTextInputFormatter(
                  mask: '##.###.###.#-###.###',
                  filter: {"#": RegExp(r'[0-9]')},
                  type: MaskAutoCompletionType.lazy,
                )
            ],
            onTap: () => onTap?.call(),
            decoration: InputDecoration(
              counterText: counterText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              hintText: hint,
              hintStyle: AppTextStyle.hint.copyWith(color: appColors.textHint),
              prefixIcon: isDatePicker
                  ? Container(
                      padding: const EdgeInsets.only(right: 0),
                      child: const Icon(
                        Icons.calendar_today,
                        size: 22,
                      ),
                    )
                  : null,
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: appColors.fieldBackground,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: appColors.fieldBackground),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: appColors.fieldFocusBorder),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: appColors.fieldError, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: appColors.fieldError, width: 2),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? _validator(String? value) {
    switch (validationType ?? '') {
      case ValidationType.required:
        return requiredValidator(value, validatorMessage);
      case ValidationType.email:
        return emailValidator(value);
      case ValidationType.none:
        return null;
    }
    return null;
  }
}

enum ValidationType {
  none,
  required,
  email,
}
