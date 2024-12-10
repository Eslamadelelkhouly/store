import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/controller/provider/address_provider.dart';
import 'package:store/controller/provider/auth_provider/auth_provider_login.dart';
import 'package:store/controller/provider/auth_provider/auth_provider_signup.dart';
import 'package:store/controller/provider/password_provider/password_provide.dart';
import 'package:store/controller/provider/product_provider/product_provider.dart';
import 'package:store/utils/theme.dart';
import 'package:store/view/seller/add_product_screen/add_products_screen.dart';
import 'package:store/view/seller/seller_presetint_navber/seller_navbar_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PasswordProvide>(
            create: (_) => PasswordProvide()),
        ChangeNotifierProvider<AuthProviderSignUpCreate>(
          create: (_) => AuthProviderSignUpCreate(),
        ),
        ChangeNotifierProvider<AuthProviderLogin>(
          create: (_) => AuthProviderLogin(),
        ),
        ChangeNotifierProvider<AddressProvider>(
          create: (_) => AddressProvider(),
        ),
        ChangeNotifierProvider<SellerProductProvider>(
          create: (_) => SellerProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: AddProductsScreen(),
      ),
    );
  }
}
