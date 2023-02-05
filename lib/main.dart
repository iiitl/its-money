import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'screens/home_page.dart';
import 'screens/instructions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: const Instructions(),
      duration: 3000,
      imageSize: 600,
      imageSrc: "assets/its_money.png",
      text: "CREATING...",
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(fontSize: 30.0, fontFamily: 'MinecraftTen'),
      colors: const [
        Colors.purple,
        Colors.yellow,
        Colors.blue,
      ],
      backgroundColor: Colors.yellow,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: example1,
      routes: {
        '/home_page': (context) => const HomePage(),
      },
      // theme: themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
    );
  }
}
