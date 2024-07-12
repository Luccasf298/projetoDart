import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutterdart10/firebase_options.dart";
import "package:flutterdart10/pages/cart_pages.dart";
import "package:flutterdart10/pages/login_pages.dart";
import "package:flutterdart10/services/auth_provider.dart";
import "pages/intro_page.dart";
import "pages/shop_page.dart";
import "themes/theme.provider.dart";
import "package:provider/provider.dart";
import 'models/shop.dart';
  


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:  DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => Shop()),
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => UserProvider()),
    
  ], child: const MyApp(
    
  ),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner:false,                                                                 
      home:  LoginPages(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/intro_page' :(context) => const IntroPage(),
        '/shop_page' :(context) => const ShopPage(),
        '/cart_page' :(context) => const CartPage()
      },
    );
  }
} 

