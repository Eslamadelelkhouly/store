import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/controller/provider/product_provider/product_provider.dart';
import 'package:store/main.dart';
import 'package:store/utils/colors.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage(
                    'assets/images/amazon_black_logo.png',
                  ),
                  width: height * 0.1,
                ),
                // const Spacer(),
                Text(
                  'Add Product',
                  style: textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          width: width,
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  if (context
                      .read<SellerProductProvider>()
                      .productImages
                      .isEmpty) {
                    return InkWell(
                      onTap: () {
                        context
                            .read<SellerProductProvider>()
                            .fetchProductImagesFromGallery(context: context);
                      },
                      child: Container(
                        height: height * 0.23,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: greyShade3),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              size: height * 0.09,
                              color: greyShade3,
                            ),
                            Text(
                              'Add Product',
                              style: textTheme.displayMedium!.copyWith(
                                color: greyShade3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    List<File> images =
                        context.read<SellerProductProvider>().productImages;
                    return CarouselSlider(
                      options: CarouselOptions(
                        height: height * 0.23,
                        autoPlay: true,
                      ),
                      items: images.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: FileImage(
                                    File(i.path),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
                  }
                  // return Container(
                  //   height: height * 0.23,
                  //   width: width,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     border: Border.all(color: greyShade3),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
