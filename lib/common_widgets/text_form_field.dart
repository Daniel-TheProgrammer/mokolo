import 'package:flutter/material.dart';
import 'package:mokolo/utils/validators.dart';

import '../constants/color_constants.dart';
import 'custom_text.dart';

class TextFieldWidget extends StatefulWidget {
  final String hint;
  final TextEditingController? confirm;
  final TextEditingController controller;

  final String errMsg;

  const TextFieldWidget(
      {Key? key,
      required this.hint,
      this.confirm,
      required this.controller,
      required this.errMsg})
      : super(key: key);
  static const txtStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        style: AppTextStyle.jakarta(fontSize: 16, fontWeight: FontWeight.w500),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(16),
            hintText: widget.hint,
            fillColor: CColor.bgGreyMokolo),
        validator: (value) {
          Validators.txtvalidator(value!, widget.errMsg);
          return null;
        },
      ),
    );
  }
}

class TextAreaWidget extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String errMsg;

  const TextAreaWidget(
      {Key? key,
      required this.controller,
      required this.errMsg,
      required this.hint})
      : super(key: key);
  static const txtStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

  @override
  State<TextAreaWidget> createState() => _TextAreaWidgetState();
}

class _TextAreaWidgetState extends State<TextAreaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        maxLines: 6,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            errorMaxLines: 2,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            contentPadding:
                const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
            hintText: widget.hint,
            fillColor: CColor.bgGreyMokolo),
        validator: (value) {
          if (value!.isEmpty) {
            return widget.errMsg;
          }

          return null;
        },
      ),
    );
  }
}
