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
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only( right: 25.0),
      child: GestureDetector(
          onTap: () {
            callback.call();
          },
          child: themeChangeProvider.darkTheme
              ? Icon(
                  FontAwesomeIcons.moon,
                  color: Theme.of(context).primaryColor,
                )
              : Icon(
                  FontAwesomeIcons.sun,
                  color: Theme.of(context).primaryColor,
                )),
    );
  }
}
