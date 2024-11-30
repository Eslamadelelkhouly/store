import 'package:flutter/material.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/utils/colors.dart';
import 'package:store/view/user/home/home_view.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.08),
          child: HomePageAppBar(width: width, height: height),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          height: height,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Subtotal', style: textTheme.bodyLarge),
                    TextSpan(
                      text: '\$ 53313',
                      style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              CommonFunctions.blankSpace(height * 0.01, 0),
              SizedBox(
                height: height * 0.06,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: teal,
                    ),
                    CommonFunctions.blankSpace(
                      0,
                      width * 0.01,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Your Order is eligible for FREE Delivery.',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: teal,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Select this option at this checkout.',
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
