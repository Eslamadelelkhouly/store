import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/constant/common_functions.dart';
import 'package:store/constant/constants.dart';
import 'package:store/controller/provider/product_provider/product_provider.dart';
import 'package:store/utils/colors.dart';
import 'package:store/view/seller/add_product_screen/widgets/add_product_detials_textfield.dart';

class AddProductsScreen extends StatefulWidget {
  const AddProductsScreen({super.key});

  @override
  State<AddProductsScreen> createState() => _AddProductsScreenState();
}

class _AddProductsScreenState extends State<AddProductsScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productCategoryController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productBrandNameController = TextEditingController();
  TextEditingController productManufacturerNameController =
      TextEditingController();
  TextEditingController productCountryOfOriginController =
      TextEditingController();
  TextEditingController productspecificationsController =
      TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productDiscountedPriceController =
      TextEditingController();
  TextEditingController productProductIDController = TextEditingController();
  TextEditingController productProductSellerIDController =
      TextEditingController();
  TextEditingController productInStockController = TextEditingController();
  TextEditingController productDiscountPercentageController =
      TextEditingController();
  TextEditingController productUploadedAtController = TextEditingController();
  String dropDownValue = 'Select Category';

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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Consumer<SellerProductProvider>(
                  builder: (context, provider, child) {
                    return Builder(
                      builder: (context) {
                        if (context
                            .read<SellerProductProvider>()
                            .productImages
                            .isEmpty) {
                          return InkWell(
                            onTap: () {
                              context
                                  .read<SellerProductProvider>()
                                  .fetchProductImagesFromGallery(
                                      context: context);
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
                          List<File> images = context
                              .read<SellerProductProvider>()
                              .productImages;
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
                    );
                  },
                ),
                CommonFunctions.blankSpace(height * 0.08, width),
                ProductDetails(height, textTheme, width),
                CommonFunctions.blankSpace(height * 0.03, width),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(width, height * 0.06),
                    backgroundColor: amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Add Product',
                    style: textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column ProductDetails(double height, TextTheme textThemem, double width) {
    return Column(
      children: [
        AddProductDetialsCommonTextfield(
          textController: productBrandNameController,
          title: 'Product Name',
          hintText: 'name',
        ),
        CommonFunctions.blankSpace(height * 0.015, 0),
        ProductCategoryDropDown(height, textThemem, width),
        CommonFunctions.blankSpace(height * 0.015, 0),
        AddProductDetialsCommonTextfield(
          title: 'Description',
          hintText: 'description',
          textController: productDescriptionController,
        ),
        CommonFunctions.blankSpace(height * 0.015, 0),
        AddProductDetialsCommonTextfield(
          title: 'Manufacturer Name',
          hintText: 'name',
          textController: productManufacturerNameController,
        ),
        CommonFunctions.blankSpace(height * 0.015, 0),
        AddProductDetialsCommonTextfield(
          title: 'Brand Name',
          hintText: 'name',
          textController: productBrandNameController,
        ),
        CommonFunctions.blankSpace(height * 0.015, 0),
        AddProductDetialsCommonTextfield(
          title: 'Country of Origin',
          hintText: '',
          textController: productCountryOfOriginController,
        ),
        CommonFunctions.blankSpace(height * 0.015, 0),
        AddProductDetialsCommonTextfield(
          title: 'Product Specification',
          hintText: 'specification',
          textController: productspecificationsController,
        ),
        CommonFunctions.blankSpace(height * 0.015, 0),
        AddProductDetialsCommonTextfield(
          title: 'Product Price',
          hintText: 'price',
          textController: productPriceController,
          textInputType: TextInputType.number,
        ),
        CommonFunctions.blankSpace(height * 0.015, 0),
        AddProductDetialsCommonTextfield(
          title: 'Discounted Product Price',
          hintText: 'Discounted price',
          textController: productDiscountPercentageController,
          textInputType: TextInputType.number,
        ),
      ],
    );
  }

  Column ProductCategoryDropDown(
      double height, TextTheme textTheme, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Category',
          style: textTheme.bodyMedium,
        ),
        CommonFunctions.blankSpace(height * 0.01, width),
        Container(
          height: height * 0.06,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: grey,
            ),
          ),
          child: DropdownButton(
            value: dropDownValue,
            underline: const SizedBox(),
            isExpanded: true,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: productCategories.map(
              (String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              },
            ).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  dropDownValue = newValue;
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
