library zz_animate_pkg;

import 'package:flutter/material.dart';
import 'package:zz_animate_pkg/widget/footer_container.dart';
import 'package:zz_animate_pkg/widget/page_widget.dart';

class HomeScreen extends StatefulWidget {
  final List<Map<String, String>> imagesArray;
  final pageController = PageController();
  bool isViewFraction;
  double cardCornerRadius;
  double viewportFraction;
  TextStyle textStyle;
  HomeScreen({
    Key? key,
    required this.imagesArray,
    this.isViewFraction = false,
    this.cardCornerRadius = 0.0,
    this.viewportFraction = 0.8,
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
  }) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  int selectedIndex = 0;

  @override
  initState() {
    super.initState();
    pageController = widget.isViewFraction
        ? PageController(
            initialPage: selectedIndex,
            keepPage: true,
            viewportFraction: widget.viewportFraction,
          )
        : PageController();
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: PageViewWidget(
                imageArray: widget.imagesArray,
                scrollDirection: Axis.horizontal,
                pageSnapping: false,
                onPageChange: (val) => {onPageChange(val)},
                pageController: pageController,
                borderColor: Colors.grey,
                borderRadius: 10.0,
                borderWidth: 1.0,
                isViewPortVisible: widget.isViewFraction,
                textStyle: widget.textStyle,
              ),
            ),
            FooterContainer(
              totalItems: widget.imagesArray.length,
              selectedIndex: selectedIndex,
            ),
          ],
        ),
      ),
    );
  }

  void onPageChange(int page) {
    setState(() {
      selectedIndex = page;
    });
  }
}
