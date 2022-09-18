import 'package:flutter/material.dart';
import 'package:products_app/screens/check_auth_screen.dart';
import 'package:products_app/screens/home_screen.dart';
import 'package:products_app/screens/login_screen.dart';
import 'package:products_app/screens/product_screen.dart';
import 'package:products_app/screens/register_screen.dart';
import 'package:products_app/services/auth_service.dart';
import 'package:products_app/services/notifications_service.dart';
import 'package:products_app/services/products_service.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService() ),
        ChangeNotifierProvider(create: ( _ ) => ProductsService() ),
      ],
      child: MyApp(),
    );
  }
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products App',
      initialRoute: 'checking',
      routes: {
        'checking': ( _ ) => CheckAuthScreen(),
        'login': ( _ ) => LoginScreen(),
        'home': ( _ ) => HomeScreen(),
        'product' : ( _ ) => ProductScreen(),
        'register': ( _ ) => RegisterScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme:  const AppBarTheme(
          elevation: 0,
          color: Colors.indigo
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 0
        )
      ),
    
    );
  }
}