import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/controller/provider/auth_provider/auth_provider_login.dart';
import 'package:store/utils/show_snack_bar.dart';
import 'package:store/view/user/home/home_view.dart';
import 'package:store/view/Auth%20Screen/signin_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
          child: Consumer<AuthProviderLogin>(
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
                          'Log in',
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
                          text: 'Log in',
                          width: width,
                          height: height,
                          onPress: (BuildContext context) async {
                            () async {
                              if (_formKey.currentState!.validate()) {
                                await provide.Login(
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
    ;
  }
}
