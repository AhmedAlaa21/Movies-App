import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(String serviceName,BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: AnimatedTextKit(
      repeatForever: true,
      isRepeatingAnimation: true,
      animatedTexts: [
        FlickerAnimatedText('Popular Movies',
            textStyle: Theme.of(context).textTheme.headline2)
      ],
      displayFullTextOnTap: false,
    ),
  );
}
