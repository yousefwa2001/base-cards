import 'package:base_cards/core/extensions/context_padding_extension.dart';
import 'package:base_cards/core/extensions/context_typography_extension.dart';
import 'package:base_cards/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? label;
  final bool obscureText;
  final bool isReadOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextStyle? textStyle;
  final FontWeight fontWeight;
  final int maxLines;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final Color? fillColor;
  final bool filled;
  final InputBorder? border;

  const CustomTextField({
    super.key,
    required this.textEditingController,
    this.label,
    this.obscureText = false,
    this.isReadOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.errorText,
    this.validator,
    this.textStyle,
    this.fontWeight = FontWeight.w400,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.fillColor,
    this.filled = false,
    this.border,
    this.onFieldSubmitted,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(widget.label!, style: widget.textStyle ?? context.bold16()),
          SizedBox(height: 8.h),
        ],
        TextFormField(
          controller: widget.textEditingController,
          onFieldSubmitted: widget.onFieldSubmitted,
          focusNode: widget.focusNode,
          obscureText: _isObscured,
          readOnly: widget.isReadOnly,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          validator: widget.validator,
          onChanged: widget.onChanged,
          style: widget.textStyle ?? context.medium14(),
          decoration: InputDecoration(
            hintText: widget.hintText,
            errorText: widget.errorText,
            filled: widget.filled,
            fillColor: widget.fillColor,
            prefixIcon: widget.prefixIcon,
            suffixIcon:
                widget.obscureText
                    ? IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    )
                    : widget.suffixIcon,
            border:
                widget.border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: AppColors.black),
                ),
            enabledBorder:
                widget.border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: AppColors.grey),
                ),
            focusedBorder:
                widget.border ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.cyan),
                ),
            contentPadding: context.paddingSymmetric(
              horizontal: 12,
              vertical: 14,
            ),
          ),
        ),
      ],
    );
  }
}
