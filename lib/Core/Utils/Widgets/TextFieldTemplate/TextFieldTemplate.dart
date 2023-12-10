import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kortobaa_task/Core/Utils/App%20Textstyle.dart';

import '../../App Colors.dart';
import 'CustomInputDecorator.dart';

class TextFieldTemplate extends StatefulWidget {
  final String name;
  final String titel;
  final String? initialValue;
  final String? label;
  TextEditingController? textEditingController;
  final IconData? leadingIcon;
  final TextInputType inputType;
  final bool enableFocusBorder;
  bool boolleadingIcon;

  final Color? leadingIconColor;
  final int maxLines;
  final String? Function(String?)? validator;
  final bool enabled;
  final void Function(String?)? onChanged;

  TextFieldTemplate({
    super.key,
    required this.name,
    this.titel = "",
    this.initialValue,
    this.label,
    this.textEditingController,
    this.leadingIcon,
    this.inputType = TextInputType.text,
    this.enableFocusBorder = true,
    this.leadingIconColor,
    this.maxLines = 1,
    this.validator,
    this.enabled = true,
    this.onChanged,
    this.boolleadingIcon = false,
  });

  @override
  State<TextFieldTemplate> createState() => _TextFieldTemplateState();
}

class _TextFieldTemplateState extends State<TextFieldTemplate> {
  final focusNode = FocusNode();
  late bool _isObscure;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      setState(() {});
    });

    _isObscure = widget.inputType == TextInputType.visiblePassword;
  }

  void _toggleObscure() => setState(() => _isObscure = !_isObscure);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.titel,
          style: AppTextStyles.w600.copyWith(fontSize: 16, ),
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilderField<String>(
          name: widget.name,
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          validator: (value) => widget.validator!(value),

          builder: (field) {
            final isEmpty = field.value?.isEmpty ?? true;
            return CustomInputDecorator(
              disableTapRippleEffect: true,
              onTap: () => focusNode.requestFocus(),

              focused: focusNode.hasFocus && widget.enableFocusBorder,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),

              // leadingIcon: widget.leadingIcon,
              leadingIconColor: widget.leadingIconColor ??
                  (isEmpty
                      ? AppColors.black.withOpacity(0.40)
                      : AppColors.black),
              body: TextFormField(
                enabled: widget.enabled,
                initialValue: widget.initialValue,
                focusNode: focusNode,
          onChanged: field.didChange,
                 validator: widget.validator,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLines: widget.maxLines,
                keyboardType: widget.inputType,

                obscureText:
                widget.inputType == TextInputType.visiblePassword &&
                    _isObscure,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  height: 1,
                ),
                decoration: InputDecoration(
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  hintText: widget.label,
                  hintStyle: const TextStyle(
                    color: AppColors.darkGrey,
                    fontSize: 16,
                    height: 1,
                  ),
                ),
              ),
              trailing: widget.boolleadingIcon == true
                  ? Icon(
                widget.leadingIcon,
                size: 24,
              )
                  : widget.inputType == TextInputType.visiblePassword
                  ? InkResponse(
                onTap: _toggleObscure,
                child: Icon(
                  _isObscure ? Iconsax.eye_slash : Iconsax.eye,
                  size: 24,
                ),
              )
                  : null,
            );
          },
        ),
      ],
    );
  }
}