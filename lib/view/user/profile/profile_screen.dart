import 'package:flutter/material.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/utils/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              children: [
                Image(
                  image: const AssetImage(
                    'assets/images/amazon_black_logo.png',
                  ),
                  width: height * 0.1,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    size: height * 0.03,
                  ),
                  color: black,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: height * 0.03,
                  ),
                  color: black,
                ),
              ],
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: height * 0.02),
          width: width,
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonFunctions.blankSpace(height * 0.01, 0),
                UserGreetings(width: width, textTheme: textTheme),
                CommonFunctions.blankSpace(height * 0.01, 0),
                GridButtons(width, textTheme),
                CommonFunctions.blankSpace(height * 0.02, 0),
                UserOrders(width: width, height: height, textTheme: textTheme),
                CommonFunctions.blankSpace(height * 0.01, 0),
                CommonFunctions.divider(),
                KeepShopping(
                    width: width, height: height, textTheme: textTheme),
                CommonFunctions.blankSpace(height * 0.01, 0),
                CommonFunctions.divider(),
                BuyAgain(width: width, height: height, textTheme: textTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GridView GridButtons(double width, TextTheme textTheme) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3,
      ),
      itemCount: 4,

      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),

      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: grey,
            ),
            borderRadius: BorderRadius.circular(50),
            color: greyShade2,
          ),
          alignment: Alignment.center,
          child: Builder(builder: (context) {
            if (index == 0) {
              return Text('Your Orders', style: textTheme.bodyMedium);
            }
            if (index == 1) {
              return Text('Buy Again', style: textTheme.bodyMedium);
            }
            if (index == 2) {
              return Text('Your Account', style: textTheme.bodyMedium);
            }
            if (index == 3) {
              return Text(
                'Your Wish List',
                style: textTheme.bodyMedium,
              );
            } else {
              return Text('');
            }
          }),
        );
      },
      // Add this to define grid items
    );
  }
}

class KeepShopping extends StatelessWidget {
  const KeepShopping({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Keep shopping for',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Browsing history',
                style: textTheme.bodySmall!.copyWith(
                  color: blue,
                ),
              ),
            ],
          ),
          CommonFunctions.blankSpace(height * 0.01, 0),
          GridView.builder(
            physics: const PageScrollPhysics(),
            itemCount: 5,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: greyShade3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Text('Product', style: textTheme.bodyMedium),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

class BuyAgain extends StatelessWidget {
  const BuyAgain({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Buy Again',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all',
                style: textTheme.bodySmall!.copyWith(
                  color: blue,
                ),
              ),
            ],
          ),
          CommonFunctions.blankSpace(
            height * 0.02,
            0,
          ),
          SizedBox(
            height: height * 0.17,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: width * 0.4,
                  height: height * 0.14,
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: greyShade3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserOrders extends StatelessWidget {
  const UserOrders({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Orders',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all',
                style: textTheme.bodySmall!.copyWith(
                  color: blue,
                ),
              ),
            ],
          ),
          CommonFunctions.blankSpace(
            height * 0.02,
            0,
          ),
          SizedBox(
            height: height * 0.17,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const PageScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: width * 0.4,
                  height: height * 0.17,
                  margin: EdgeInsets.symmetric(
                    horizontal: width * 0.02,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: greyShade3,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserGreetings extends StatelessWidget {
  const UserGreetings({
    super.key,
    required this.width,
    required this.textTheme,
  });

  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
      ),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Hello, ',
                  style: textTheme.bodyLarge ?? const TextStyle(fontSize: 16),
                ),
                TextSpan(
                  text: 'Elkhouly',
                  style: (textTheme.bodyLarge ?? const TextStyle(fontSize: 16))
                      .copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CircleAvatar(
            backgroundColor: greyShade3,
            radius: 30,
          ),
        ],
      ),
    );
  }
}
