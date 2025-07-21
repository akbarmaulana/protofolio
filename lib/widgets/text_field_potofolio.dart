import 'package:flutter/material.dart';
import 'package:portofolio/core/constant/color_app.dart';


class TextFieldPotofolio extends StatelessWidget {
  TextFieldPotofolio({super.key, this.hint, required this.controller, this.maxLine, this.typeInput});
  String? hint;
  int? maxLine;
  TextEditingController controller;
  TextInputType? typeInput;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: bgScaffold),
      keyboardType: typeInput ?? TextInputType.text,
      controller: controller,
      maxLines: maxLine ?? 1,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16),
          filled: true,
          fillColor: whiteSecondary,
          focusedBorder: getInputborder,
          enabledBorder: getInputborder,
          border: getInputborder,
          hintText: hint ?? ''
      ),
    );
  }

  OutlineInputBorder get getInputborder {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none
    );
  }
}
