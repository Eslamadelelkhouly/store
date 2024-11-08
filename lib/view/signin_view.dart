import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/controller/provider/password_provider/password_provide.dart';
import 'package:store/utils/colors.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonFunctions.blankSpace(height * 0.10, 0),
              Image.asset(
                'assets/images/amazon_logo.png',
                scale: 4,
              ),
              CommonFunctions.blankSpace(height * 0.05, 0),
              const Text(
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              CommonFunctions.blankSpace(height * 0.05, 0),
              CustomTextFormField(
                hinttext: 'Username',
                width: width,
              ),
              CommonFunctions.blankSpace(height * 0.03, 0),
              TextFormFieldPassword(width: width),
              CommonFunctions.blankSpace(height * 0.05, 0),
              CustomButton(
                text: 'Sign in',
                width: width,
                height: height,
                onPress: () {
                  if (formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.onPress,
    required this.text,
  });

  final double width;
  final double height;
  final void Function()? onPress;
  final String text;

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: width * 0.90,
      height: height * 0.07,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.amber,
        ),
        onPressed: onPress,
        child: Text(
          style: TextStyle(color: black, fontSize: 20),
          text,
        ),
      ),
    );
  }
}

class TextFormFieldPassword extends StatelessWidget {
  final double width;

  const TextFormFieldPassword({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: width * 0.90,
      child: Consumer<PasswordProvide>(
        builder: (context, provider, child) {
          return TextFormField(
            validator: (data) {
              if (data!.isEmpty) {
                return 'Field is required';
              }
              return null;
            },
            obscureText: provider.obcure,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                onPressed: () {
                  provider.clickpassword();
                },
                icon: provider.icon,
              ),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.width,
    required this.hinttext,
  });

  final double width;
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: width * 0.90,
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'Faield is required';
          }
          return null;
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hinttext,
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
