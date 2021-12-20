import 'package:flutter/material.dart';

class ImageInfoWidget extends StatelessWidget {
  const ImageInfoWidget({
    Key? key,
    required this.message,
    required this.textStyle,
  }) : super(key: key);

  final TextStyle textStyle;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 10,
      left: 10,
      // width: double.infinity,
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black,
                offset: Offset(1.0, -1.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
