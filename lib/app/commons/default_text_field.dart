import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/colors_guide.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool obscureText;
  final TextAlign? textAlign;
  final Iterable<String>? autofillHints;
  final void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;
  const DefaultTextField({
    Key? key,
    this.obscureText = false,
    required this.controller,
    this.focusNode,
    this.nextFocusNode,
    this.prefixIcon,
    this.validator,
    required this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.sufixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.autofillHints,
    this.textAlign,
    this.onChanged,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius defaultBorderRadius = BorderRadius.circular(10);
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 20),
      child: TextFormField(
        focusNode: focusNode,
        enabled: enabled,
        autovalidateMode: autovalidateMode,
        controller: controller,
        autofillHints: autofillHints,
        style: GoogleFonts.inter(
          fontSize: 4.4.w,
          fontWeight: FontWeight.w500,
          height: 1.5,
          color: ColorsGuide.darkOcean,
        ),
        onChanged: onChanged,
        onFieldSubmitted: (value) {
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        obscureText: obscureText,
        readOnly: readOnly,
        onTap: onTap,
        textAlign: textAlign ?? TextAlign.start,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 4.25.w, vertical: 10),
          hintText: hintText,
          filled: true,
          suffixIcon: sufixIcon,
          border: OutlineInputBorder(
            borderRadius: defaultBorderRadius,
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
          ),
          prefixIcon: prefixIcon,
          errorStyle: TextStyle(color: Colors.red, fontSize: 4.w),
          fillColor: ColorsGuide.lightGray.withOpacity(0.1),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
            borderRadius: defaultBorderRadius,
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
            borderRadius: defaultBorderRadius,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
            borderRadius: defaultBorderRadius,
          ),
          hintStyle: GoogleFonts.lato(
            color: Colors.grey[700],
            fontSize: 4.5.w,
            height: 1.5,
            fontWeight: FontWeight.w400,
          ),
        ),
        validator: validator,
      ),
    );
  }
}
