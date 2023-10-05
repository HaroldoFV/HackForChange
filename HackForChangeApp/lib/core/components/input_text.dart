import 'package:caminho_da_esperanca_hackaton_fiap_alura/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../fonts.dart';

class InputText extends StatefulWidget {
  final String? mainLabel;
  final TextEditingController controller;
  final TextStyle? textStyle;
  final TextInputType inputType;
  final bool isPassword;
  final Iterable<String>? autoFillHints;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final String? hintText;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final Color inputBackground;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color hintTextColor;
  final double? fontSizeMainLabel;
  final bool useMainLabel;

  const InputText({
    Key? key,
    required this.mainLabel,
    required this.controller,
    this.textStyle,
    this.inputType = TextInputType.text,
    this.isPassword = false,
    this.autoFillHints,
    this.inputFormatters,
    this.onSaved,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.hintText,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.inputBackground = Colors.transparent,
    this.enabledBorderColor = const Color(0xFF959595),
    this.focusedBorderColor = const Color(0xFF9098E0),
    this.hintTextColor = const Color(0xFFD2D2D2),
    this.fontSizeMainLabel,
    this.useMainLabel = true,
  }) : super(key: key);

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.mainLabel ?? "",
          style: widget.textStyle ??
              FontStyles.i.poppinsMedium.copyWith(
                color: ColorsTheme.mainColor,
                fontSize: widget.fontSizeMainLabel ?? 16,
              ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: widget.controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            counter: const Offstage(),
            helperText: " ",
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: widget.focusedBorderColor, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: widget.enabledBorderColor, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: Color(0xFFF06969), width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(color: Color(0xFFF06969), width: 1.5),
            ),
            suffixIcon: widget.suffixIcon,
            hintText: widget.hintText,
            hintStyle: FontStyles.i.poppinsMedium.copyWith(
              color: widget.hintTextColor,
            ),
            contentPadding:
                const EdgeInsets.only(left: 16, right: 8, bottom: 18, top: 18),
            //isDense: true,
            filled: true,
            fillColor: widget.inputBackground,
          ),
          textCapitalization: widget.textCapitalization,
          style: FontStyles.i.poppinsMedium
              .copyWith(color: const Color(0xFF1C1C1C)),
          keyboardType: widget.inputType,
          obscureText: widget.isPassword,
          cursorColor: const Color(0xFF595959),
          autofillHints: widget.autoFillHints,
          inputFormatters: widget.inputFormatters,
          onSaved: widget.onSaved,
          onChanged: widget.onChanged,
          validator: widget.validator,
          maxLength: widget.maxLength,
        ),
      ],
    );
  }
}
