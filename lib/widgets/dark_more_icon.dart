import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../repository/dark_theme_repository.dart';

typedef DarkModeCallback = void Function();

class DarkModeIcon extends StatelessWidget {
  final DarkThemeProvider themeChangeProvider;
  final DarkModeCallback callback;

  const DarkModeIcon(
      {required this.themeChangeProvider, required this.callback});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.centerRight,
      margin:
          const EdgeInsets.only(top: 40, bottom: 0.0, left: 25.0, right: 25.0),
      height: size.height / 6,
      width: size.width / 2,
      child: GestureDetector(
          onTap: () {
            callback.call();
          },
          child: themeChangeProvider.darkTheme
              ? const Icon(
                  FontAwesomeIcons.moon,
                  color: Colors.blue,
                )
              : const Icon(
                  FontAwesomeIcons.sun,
                  color: Colors.blue,
                )),
    );
  }
}
