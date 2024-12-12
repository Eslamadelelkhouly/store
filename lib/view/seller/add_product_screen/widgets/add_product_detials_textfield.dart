import 'package:flutter/material.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/utils/colors.dart';

class AddProductDetialsCommonTextfield extends StatelessWidget {
  AddProductDetialsCommonTextfield({
    super.key,
    required this.textController,
    required this.title,
    required this.hintText,
    this.textInputType,
  });

  final TextEditingController textController;
  final String title;
  final String hintText;
  TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: textTheme.bodyMedium),
        CommonFunctions.blankSpace(height * 0.01, 0),
        TextField(
          controller: textController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 0,
              horizontal: width * 0.03,
            ),
            hintText: hintText,
            hintStyle: textTheme.bodySmall,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(
                color: secondaryColor,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
