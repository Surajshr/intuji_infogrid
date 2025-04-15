import 'package:intuji_infogrid/core/imports/ui_imports.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.labelText,
    this.errorText,
    this.suffixIcon,
    this.keyBoardType,
    this.borderColor,
    this.obscureText = false,
    this.minLines = 1,
    this.labelTextStyle,
    this.focusNode,
    this.prefixIcon,
    this.onSubmitted,
    this.readOnly,
    this.onTap,
    this.fillColor,
    this.scrollController,
    this.hintText,
    this.hintTextStyle,
    this.maxLength,
    this.textCapitalization,
    this.validator,
    this.textInputAction,
    this.maxLines,
    this.height,
    this.showCounter = false,
    this.shouldShowErrorText = true,
  });

  final TextEditingController? controller;
  final ScrollController? scrollController;
  final bool obscureText;
  final Function(String latestString)? onChanged;
  final String? labelText;
  final String? errorText;
  final String? hintText;
  final Widget? suffixIcon;

  final TextInputType? keyBoardType;
  final TextStyle? labelTextStyle;
  final TextStyle? hintTextStyle;
  final Color? borderColor;
  final int minLines;
  final int? maxLines;
  final int? maxLength;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;
  final Function(dynamic value)? onSubmitted;
  final Function()? onTap;
  final bool? readOnly;
  final Widget? prefixIcon;
  final Color? fillColor;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final double? height;
  final bool showCounter;
  final bool shouldShowErrorText;

  @override
  Widget build(BuildContext context) {
    final hasError = errorText != null;
    final borderColor =
        hasError ? Colors.red : (this.borderColor ?? AppColor.kWhiteColor);

    final effectiveMaxLines = maxLines ?? minLines;

    return Column(
      children: [
        Container(
          height: height ?? 66.h, // Adjust height based on minLines
          decoration: BoxDecoration(
            color: AppColor.kWhiteColor,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: AppColor.kBackgroundColor.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(color: borderColor),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 4.w,
              right: 16.w,
              top: 6.h,
              bottom: 12.h,
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      textCapitalization:
                          textCapitalization ?? TextCapitalization.none,
                      maxLength: maxLength,
                      cursorColor: AppColor.kPrimaryColor,
                      scrollController: scrollController,
                      onTap: onTap,
                      controller: controller,
                      keyboardType: keyBoardType,
                      obscureText: obscureText,
                      onChanged: onChanged,
                      obscuringCharacter: '*',
                      readOnly: readOnly ?? false,
                      minLines: minLines,
                      maxLines: effectiveMaxLines,
                      focusNode: focusNode,
                      onFieldSubmitted: onSubmitted,
                      textInputAction: textInputAction ?? TextInputAction.next,
                      style: TextStyle(
                        color: AppColor.kTextColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        height: 24.sp / 16.sp,
                      ),
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle:
                            hintTextStyle ??
                            TextStyle(
                              color: AppColor.kTextDisabledColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                        labelText: labelText,
                        labelStyle: TextStyle(
                          fontFamily: AppConstants.kFontFamily,
                          color: AppColor.kTextDisabledColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          height: 16.sp / 12.sp,
                          letterSpacing: 0.6,
                        ),

                        // focusedBorder: OutlineInputBorder(
                        //   borderSide: BorderSide(color: borderColor),
                        //   borderRadius: BorderRadius.circular(8.r),
                        // ),
                        fillColor: fillColor,
                        filled: fillColor != null,
                        // suffixIcon: suffixIcon,
                        prefixIcon: prefixIcon,
                        // contentPadding: EdgeInsets.symmetric(
                        //   horizontal: 16.w,
                        //   vertical: 16.h,
                        // ),
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        counterText: showCounter ? null : '',
                      ),
                      validator: validator,
                    ),
                  ),
                  if (suffixIcon != null) suffixIcon!,
                ],
              ),
            ),
          ),
        ),
        if (errorText != null && shouldShowErrorText)
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              errorText!,
              style: TextStyle(
                fontFamily: AppConstants.kFontFamily,
                color: Colors.red,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
      ],
    );
  }
}
