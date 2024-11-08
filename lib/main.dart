import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/controller/provider/auth_provider/auth_provider.dart';
import 'package:store/controller/provider/password_provider/password_provide.dart';
import 'package:store/view/signin_view.dart';

void main() {
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
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const SigninView(),
      ),
    );
  }
}
