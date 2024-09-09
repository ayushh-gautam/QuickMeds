import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import 'no_leading_whitespace.dart';

class TextFieldWidget extends StatefulWidget {
  final String hintText;
  final String? labelText;
  final double? labelTextFontSize;
  final FontWeight? labelTextFontWeight;
  final TextEditingController controller;
  final FormFieldValidator<String?>? validatorText;
  final InputBorder? border;
  final Widget? suffixIcon;
  final bool? readonly;
  final bool? expands;
  final int? maxLines;
  final int? minLines;
  final int? maxLenth;
  final Widget? prefixIcon;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final TextStyle? hintTextStyle;
  final TextInputType? textInputType;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final VoidCallback? onTap;
  final double? borderRadius;
  final FocusNode? focusNode;
  final bool? autofocus;
  final List<TextInputFormatter>? textInputFormatter;
  bool obscureText;
  void Function(String)? onChanged;
  final Color? fillColor;
  final Color? textColor;
  final TextAlign? textAlign;
  final Color? cursorColor;
  final Color? borderColor;
  final VoidCallback? onEditingComplete;

  TextFieldWidget(
      {super.key,
      required this.hintText,
      this.expands,
      this.labelTextFontWeight,
      this.fillColor,
      required this.controller,
      this.validatorText,
      this.maxLenth,
      this.labelText,
      this.border,
      this.minLines,
      this.suffixIcon,
      this.obscureText = false,
      this.textInputType,
      this.textInputAction,
      this.onTap,
      this.textInputFormatter,
      this.prefixIcon,
      this.contentPadding,
      this.readonly,
      this.borderRadius,
      this.focusNode,
      this.autofocus,
      this.labelStyle,
      this.hintStyle,
      this.maxLines,
      this.onChanged,
      this.style,
      this.textAlign,
      this.borderColor,
      this.cursorColor,
      this.onEditingComplete,
      this.labelTextFontSize,
      this.textColor,
      this.hintTextStyle});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines ?? 1,
      onChanged: widget.onChanged,
      cursorColor: widget.cursorColor,
      textAlign: widget.textAlign ?? TextAlign.start,
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      focusNode: widget.focusNode,
      readOnly: widget.readonly ?? false,
      controller: widget.controller,
      inputFormatters: [
        ...(widget.textInputFormatter ?? []),
        // widget.isNameScreen == true
        //     ? FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]"))
        //     : FilteringTextInputFormatter.singleLineFormatter,
        NoLeadingSpaceFormatter(),
        FilteringTextInputFormatter.deny(RegExp(r"^\s"))
      ],
      style: widget.style,
      obscureText: widget.obscureText,
      validator: widget.validatorText,
      keyboardType: widget.textInputType,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.4.h),
          borderSide: BorderSide(
              color: widget.borderColor ?? Colors.transparent, width: 0.2.w),
        ),
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        hintStyle: widget.hintTextStyle,
        fillColor: widget.fillColor ?? Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1.4.h),
          borderSide: BorderSide(
              color: widget.borderColor ?? Colors.transparent, width: 0.2.w),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(1.4.h),
            borderSide: BorderSide(
                color: widget.borderColor ?? Colors.transparent, width: 0.2.w)),
      ),
    );
  }
}
