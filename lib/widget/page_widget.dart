import 'package:flutter/material.dart';
import 'package:zz_animate_pkg/widget/image_info_widget.dart';

class PageViewWidget extends StatelessWidget {
  const PageViewWidget({
    Key? key,
    required this.imageArray,
    this.scrollDirection = Axis.horizontal,
    this.pageSnapping = true,
    required this.pageController,
    required this.onPageChange,
    required this.borderRadius,
    required this.borderWidth,
    required this.borderColor,
    required this.isViewPortVisible,
    required this.textStyle,
  }) : super(key: key);

  final List<Map<String, String>> imageArray;
  final Axis scrollDirection;
  final bool pageSnapping;
  final Function onPageChange;
  final PageController pageController;
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;
  final bool isViewPortVisible;
  final TextStyle textStyle;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      scrollDirection: scrollDirection,
      onPageChanged: (page) {
        onPageChange(page);
      },
      itemBuilder: (cntx, index) {
        return Container(
          margin: const EdgeInsets.all(10),
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius + 2),
              border: Border.all(color: borderColor, width: borderWidth)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Stack(
              fit: StackFit.expand,
              children: [
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    strokeWidth: 2.0,
                  ),
                ),
                Image.asset(
                  'assets/images/${(imageArray.map((e) => e['image']!)).toList()[isViewPortVisible ? index : (index + 1)]}',
                  fit: BoxFit.fill,
                ),
                ImageInfoWidget(
                  message:
                      (imageArray.map((e) => e['message']!)).toList()[index],
                  textStyle: textStyle,
                ),
              ],
            ),
          ),
        );
      },
      itemCount: imageArray.length,
    );
  }

  builder(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, child) {
        double value = 1.0;
        if (pageController.position.haveDimensions) {
          value = pageController.page! - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        } else {
          value = 0.6;
        }

        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * 400,
            width: Curves.easeOut.transform(value) * 350,
            child: child,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        color: index % 2 == 0 ? Colors.blue : Colors.red,
      ),
    );
  }
}
