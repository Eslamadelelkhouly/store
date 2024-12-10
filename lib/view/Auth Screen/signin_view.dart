import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/controller/provider/auth_provider/auth_provider_signup.dart';
import 'package:store/controller/provider/password_provider/password_provide.dart';
import 'package:store/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:store/utils/colors.dart';
import 'package:store/utils/show_snack_bar.dart';
import 'package:store/view/Auth%20Screen/login_view.dart';
import 'package:store/view/user/user_data_screen/user_data_input_screen.dart';
import 'package:store/view/user/user_persistant/nav_bar_home.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  checkUser() async {
    // Ensure userAlready always gets a boolean value, even if checkUser() returns null.
    bool userAlready = await UserDataCRUD.checkUser() ?? false;

    // Navigate based on the value of userAlready.
    if (userAlready) {
      Navigator.push(
        context,
        PageTransition(
          child: SigninView(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    } else {
      Navigator.push(
        context,
        PageTransition(
          child: UserDataInputScreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    checkUser();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          // Dismiss the keyboard when tapping outside of text fields
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Consumer<AuthProviderSignUpCreate>(
            builder: (context, provide, child) {
              return ModalProgressHUD(
                inAsyncCall: provide.isLoading,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/amazon_logo.png',
                          scale: 4,
                        ),
                        CommonFunctions.blankSpace(height * 0.05, 0),
                        const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                        CommonFunctions.blankSpace(height * 0.05, 0),
                        CustomTextFormField(
                          onChanged: (data) {
                            email = data;
                          },
                          hinttext: 'Email',
                          width: width,
                        ),
                        CommonFunctions.blankSpace(height * 0.03, 0),
                        TextFormFieldPassword(
                          onChanged: (data) {
                            password = data;
                          },
                          width: width,
                        ),
                        CommonFunctions.blankSpace(height * 0.05, 0),
                        CustomButton(
                          text: 'Sign Up',
                          width: width,
                          height: height,
                          onPress: (BuildContext context) async {
                            () async {
                              if (_formKey.currentState!.validate()) {
                                await provide.signUp(
                                    email: email, password: password);
                                if (provide.error.isNotEmpty &&
                                    provide.error != 'success') {
                                  ShowSnackBar(context, provide.error);
                                  log('error');
                                } else if (provide.state == true) {
                                  log('Signed up successfully');
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                      child: HomeScreen(),
                                      type: PageTransitionType.leftToRight,
                                    ),
                                  );
                                }
                              }
                            }();
                          },
                        ),
                        CommonFunctions.blankSpace(height * 0.05, 0),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: LoginView(),
                                    type: PageTransitionType.rightToLeft));
                          },
                          child: Text('Are you have an account?'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
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
  final Future<void> Function(BuildContext)
      onPress; // Update type to Future<void> Function(BuildContext)
  final String text;

  @override
  Widget build(BuildContext context) {
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
        onPressed: () async => await onPress(context), // Await async function
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
  final void Function(String)? onChanged;

  const TextFormFieldPassword({super.key, required this.width, this.onChanged});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: width * 0.90,
      child: Consumer<PasswordProvide>(
        builder: (context, provider, child) {
          return TextFormField(
            onChanged: onChanged,
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
    this.onChanged,
  });

  final double width;
  final String hinttext;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: width * 0.90,
      child: TextFormField(
        onChanged: onChanged,
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
