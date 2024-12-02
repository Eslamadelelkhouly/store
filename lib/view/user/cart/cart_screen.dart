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
          child: SingleChildScrollView(
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
                                    text:
                                        'Select this option at this checkout.',
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: amber,
                    minimumSize: Size(width, height * 0.06),
                  ),
                  onPressed: () {},
                  child: Text('Proceed to Buy', style: textTheme.bodySmall),
                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                CommonFunctions.divider(),
                CommonFunctions.blankSpace(height * 0.02, 0),
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: height * 0.2,
                      width: width,
                      margin: EdgeInsets.symmetric(
                        vertical: height * 0.01,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyShade1,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                  image: AssetImage(
                                    'assets/images/todays_deals/todaysDeal1.png',
                                  ),
                                  fit: BoxFit.fitWidth,
                                ),
                                CommonFunctions.blankSpace(height * 0.01, 0),
                                Container(
                                  height: height * 0.06,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.02,
                                    vertical: height * 0.01,
                                  ),
                                  width: width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: greyShade3),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          child:
                                              Icon(Icons.remove, color: black),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: greyShade3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          color: white,
                                          alignment: Alignment.center,
                                          child: Text('1'),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          child: Icon(Icons.add, color: black),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              left: BorderSide(
                                                color: greyShade3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CommonFunctions.blankSpace(0, width * 0.02),
                          Expanded(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Product Name',
                                  style: textTheme.bodyLarge,
                                ),
                                CommonFunctions.blankSpace(height * 0.01, 0),
                                Text(
                                  '\$ 1807',
                                  style: textTheme.displayMedium!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CommonFunctions.blankSpace(height * 0.005, 0),
                                Text(
                                  'Eligible for free Shipping',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: grey,
                                  ),
                                ),
                                CommonFunctions.blankSpace(height * 0.005, 0),
                                Text(
                                  'In Stock',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: teal,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Delete',
                                        style: textTheme.bodySmall,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        backgroundColor: white,
                                        side: BorderSide(color: greyShade3),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Save from later',
                                        style: textTheme.bodySmall,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        backgroundColor: white,
                                        side: BorderSide(color: greyShade3),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
