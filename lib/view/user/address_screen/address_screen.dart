import 'package:flutter/material.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/utils/colors.dart';
import 'package:store/view/user/address_screen/widget/address_screen_textField.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController housenumberController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController townController = TextEditingController();
  TextEditingController stateController = TextEditingController();

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
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AdressScreenTextField(
                  textController: nameController,
                  hintText: 'Enter your name',
                  title: 'Enter your name',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AdressScreenTextField(
                  textController: emailController,
                  hintText: 'Enter your email',
                  title: 'Enter your email',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AdressScreenTextField(
                  textController: housenumberController,
                  hintText: 'Enter your house number',
                  title: 'Enter your house number',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AdressScreenTextField(
                  textController: areaController,
                  hintText: 'Enter your area',
                  title: 'Enter your area',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AdressScreenTextField(
                  textController: landmarkController,
                  hintText: 'Enter your land mark',
                  title: 'Enter your land mark',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AdressScreenTextField(
                  textController: pincodeController,
                  hintText: 'Enter your PIN code',
                  title: 'Enter your pin code',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AdressScreenTextField(
                  textController: townController,
                  hintText: 'Enter your town',
                  title: 'Enter your town',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AdressScreenTextField(
                  textController: stateController,
                  hintText: 'Enter your state',
                  title: 'Enter your state',
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
