import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../repository/dark_theme_repository.dart';

class DarkModeIcon extends StatelessWidget {
  final DarkThemeProvider themeChangeProvider;

  const DarkModeIcon({required this.themeChangeProvider});

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
            if (themeChangeProvider.darkTheme) {
              themeChangeProvider.darkTheme = false;
            } else {
              themeChangeProvider.darkTheme = true;
            }
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

Widget _logo(DarkThemeProvider themeChangeProvider, context) {
  var size = MediaQuery.of(context).size;

  return Container(
    margin:
        const EdgeInsets.only(top: 40, bottom: 0.0, left: 25.0, right: 25.0),
    height: size.height / 6,
    width: size.width / 2,
    child: GestureDetector(
        onTap: () {},
        child: themeChangeProvider.darkTheme
            ? const Icon(
                FontAwesomeIcons.lightbulb,
                color: Colors.blue,
              )
            : const Icon(
                FontAwesomeIcons.solidLightbulb,
                color: Colors.blue,
              )),
  );
}
