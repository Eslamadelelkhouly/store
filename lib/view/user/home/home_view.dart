import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/constant/constants.dart';
import 'package:store/controller/services/user_data_crud_services/user_data_CRUD_services.dart';
import 'package:store/utils/colors.dart';
import 'package:store/view/user/cart/cart_screen.dart';
import 'package:store/view/user/menu/menu_screen.dart';
import 'package:store/view/user/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _pages = [
    // Replace HomeScreen with your actual home page widget
    HomeWidget(),
    ProfileScreen(),
    CartScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: index,
        items: const <Widget>[
          Icon(Icons.home, size: 25),
          Icon(Icons.person, size: 25),
          Icon(Icons.shopping_cart, size: 25),
          Icon(Icons.menu, size: 25),
        ],
        color: Colors.white,
        backgroundColor: appBarGradientColor[0], // Replace with a single color
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        letIndexChange: (index) => true,
      ),
      backgroundColor: white,
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  CarouselSliderController todaysDealsCourselController =
      CarouselSliderController();

  checkUserAdress() async {
    bool userAdressPresent = await UserDataCRUD.checkUserAdress();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (userAdressPresent == false) {
      showBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: height * 0.3,
              width: width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
            );
          });
    }
  }

  headphones(int Index) {
    switch (Index) {
      case 0:
        return 'Bose';
      case 1:
        return 'boAt';
      case 2:
        return 'Sony';
      case 3:
        return 'OnePlus';
    }
  }

  clothing(int Index) {
    switch (Index) {
      case 0:
        return 'Kurtas , serees & more';
      case 1:
        return 'Tops , dresses & more';
      case 2:
        return 'T-Shirt, jeans & more';
      case 3:
        return 'View all';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        checkUserAdress();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.08),
          child: HomePageAppBar(width: width, height: height),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreenUserAdressAppBar(height: height, width: width),
              CommonFunctions.divider(),
              const HomeScreenCategoriesList(),
              CommonFunctions.blankSpace(height * 0.01, 0),
              CommonFunctions.divider(),
              HomeScreenBanner(height: height, width: width),
              TodaysDealHomeScreenWidget(
                todaysDealsCourselController: todaysDealsCourselController,
              ),
              CommonFunctions.divider(),
              OtherOffGridWidget(
                offerFor: 'headphones',
                btnName: 'Explore More',
                context: context,
                title: 'Latest launch in Headphones',
                ProductPicNamesList: headphonesDeals,
              ),
              Container(
                height: height * 0.35,
                width: width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/offersNsponcered/insurance.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              CommonFunctions.divider(),
              OtherOffGridWidget(
                offerFor: 'clothing',
                btnName: 'See all deals',
                context: context,
                title: 'Minimum 70% off | Top Offers on Clothing',
                ProductPicNamesList: clothingDealsList,
              ),
              CommonFunctions.divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonFunctions.blankSpace(height * 0.01, 0),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                    ),
                    child: Text(
                      'Watch Sixer only on miniTV',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: black,
                          ),
                    ),
                  ),
                  Container(
                    height: height * 0.4,
                    width: width,
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03,
                      vertical: height * 0.01,
                    ),
                    child: Image(
                      image: AssetImage(
                        'assets/images/offersNsponcered/sixer.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container OtherOffGridWidget(
      {required BuildContext context,
      required String offerFor,
      required String title,
      required String btnName,
      required List<String> ProductPicNamesList}) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.01),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: black,
                ),
          ),
          CommonFunctions.blankSpace(height * 0.01, 0),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (item, index) {
              return InkWell(
                onTap: () {},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/offersNsponcered/${ProductPicNamesList[index]}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      offerFor == 'headphones'
                          ? headphones(index)
                          : clothing(index),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              );
            },
            shrinkWrap: true,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              btnName,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: blue,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

class TodaysDealHomeScreenWidget extends StatelessWidget {
  const TodaysDealHomeScreenWidget({
    super.key,
    required this.todaysDealsCourselController,
  });

  final CarouselSliderController todaysDealsCourselController;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonFunctions.blankSpace(height * 0.01, 0),
            Text(
              '50%-80% | Latest deals.',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: black,
                  ),
            ),
            CarouselSlider(
              carouselController: todaysDealsCourselController,
              options: CarouselOptions(
                height: height * 0.23,
                autoPlay: true,
              ),
              items: todaysDeals.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                          fit: BoxFit.fitHeight,
                          image: AssetImage(
                            'assets/images/todays_deals/${i}',
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: red,
                  ),
                  child: Text(
                    'Upto 62% off',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: white,
                        ),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * 0.03),
                Text(
                  'Deal of the day',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: red,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (item, index) {
                return InkWell(
                  onTap: () {
                    log(index.toString());
                    todaysDealsCourselController.animateToPage(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: greyShade3),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/todays_deals/${todaysDeals[index]}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
              shrinkWrap: true,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'See all Deals',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: blue,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: height * 0.23,
        autoPlay: true,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.amber,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(
                    'assets/images/carousel_slideshow/${i}.png',
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class HomeScreenCategoriesList extends StatelessWidget {
  const HomeScreenCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.1,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.01),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage(
                    'assets/images/categories/${categories[index]}.png',
                  ),
                  height: height * 0.07,
                ),
                Text(
                  categories[index],
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class HomeScreenUserAdressAppBar extends StatelessWidget {
  const HomeScreenUserAdressAppBar({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: addressBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.012,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: appBarGradientColor,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: width * 0.81,
            child: TextField(
              onTap: () {
                log('Redirecting you to search product screen');
              },
              cursorColor: black,
              decoration: InputDecoration(
                fillColor: white,
                filled: true,
                hintText: 'Search Amazom.in',
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: black),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt_sharp, color: grey),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: grey),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mic,
              color: black,
            ),
          ),
        ],
      ),
    );
  }
}
