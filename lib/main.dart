import 'package:flutter/material.dart';
import 'package:my_app/homepage.dart';
import 'package:provider/provider.dart';
import 'Styles.dart';
import 'repository/dark_theme_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

/*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
          textTheme: TextTheme(
              headline1: const TextStyle(
                  fontSize: 70,
                  color: Colors.white,
                  fontFamily: 'DMSerifDisplay'),
              headline2: const TextStyle(
                  fontSize: 55,
                  color: Colors.white,
                  fontFamily: 'DMSerifDisplay'),
              headline3: const TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: 'DMSerifDisplay'),
              subtitle1: TextStyle(fontSize: 30, color: Colors.grey[500]),
              subtitle2: TextStyle(fontSize: 20, color: Colors.grey[500]),
              bodyText1: const TextStyle(fontSize: 20, color: Colors.white, height: 1.25),
              bodyText2: const TextStyle(fontSize: 17, color: Colors.white, height: 1.25),
              caption: const TextStyle(fontSize: 15, color: Colors.white, height: 1.25),
              button: const TextStyle(fontSize: 17, color: Color(0xff1e1e24))),
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }*/
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}
