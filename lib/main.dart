import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/controller/provider/auth_provider/auth_provider_login.dart';
import 'package:store/controller/provider/auth_provider/auth_provider_signup.dart';
import 'package:store/controller/provider/password_provider/password_provide.dart';
import 'package:store/utils/theme.dart';
import 'package:store/view/Auth%20Screen/signin_view.dart';
import 'package:store/view/user/address_screen/address_screen.dart';
import 'package:store/view/user/home/home_view.dart';
import 'package:store/view/user/user_data_screen/user_data_input_screen.dart';
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

  // This widget is the root of your application.
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: AddressScreen(),
      ),
    );
  }
}
