import 'package:flutter/material.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/constant/constants.dart';
import 'package:store/utils/colors.dart';

class UserDataInputScreen extends StatefulWidget {
  const UserDataInputScreen({super.key});

  @override
  State<UserDataInputScreen> createState() => _UserDataInputScreenState();
}

class _UserDataInputScreenState extends State<UserDataInputScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPersistentFrameCallback(
      (_) {
        emailController.text = auth.currentUser!.email ?? ' ';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width, height * 0.08),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.01,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: appBarGradientColor,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage(
                    'assets/images/amazon_black_logo.png',
                  ),
                  width: height * 0.1,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.03, vertical: height * 0.02),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
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
              CommonFunctions.blankSpace(
                height * 0.02,
                0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
