import 'package:flutter/material.dart';

abstract class MainScreenStyle {
  //Image loading for loadingBuilder
  static final ImageLoading =
      (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
    if (loadingProgress == null) {
      return child;
    }
    return Center(
      child: CircularProgressIndicator(
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  };
//  nextButton style
  static final nextButtonStyle = ButtonStyle(
    padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    )),
    backgroundColor: MaterialStateProperty.all(Colors.amber),
  );
  //historyButtonStyle
  static final historyButtonStyle = ButtonStyle(
    padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    )),
    backgroundColor: MaterialStateProperty.all(Colors.blue),
  );
  static const backgroundImageTheme = BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/images/4.jpg'),
      fit: BoxFit.fill,
    ),
  );
  static const catInfoTextStyle = TextStyle(
      color: Colors.white70, fontSize: 19, fontWeight: FontWeight.w600);
}
