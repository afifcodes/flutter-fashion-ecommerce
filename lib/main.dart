import 'package:flutter/material.dart';
import 'package:flutter_fashion_ecommerce/screens/detail_screen.dart';
import 'package:flutter_fashion_ecommerce/screens/home_screen.dart';
import 'package:flutter_fashion_ecommerce/utils/route_animation.dart';
import 'package:flutter_fashion_ecommerce/utils/route_arguments.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(fontFamily: 'Manrope'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final arguments = settings.arguments;
        if (settings.name == '/detail') {
          DetailScreenArguments args = arguments as DetailScreenArguments;
          return RouteAnimation.slide(
              settings,
              DetailScreen(
                  name: args.name,
                  price: args.price,
                  is_liked: args.is_liked,
                  image_url: args.image_url));
        } else {
          return RouteAnimation.slide(settings, const HomeScreen());
        }
      },
    ));
