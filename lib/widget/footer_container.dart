import 'package:flutter/material.dart';

class FooterContainer extends StatelessWidget {
  const FooterContainer({
    Key? key,
    required this.totalItems,
    required this.selectedIndex,
    this.defaultColor = Colors.grey,
    this.selectedColor = Colors.redAccent,
  }) : super(key: key);

  final int totalItems;
  final int selectedIndex;
  final Color defaultColor;
  final Color selectedColor;
  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (cntx, index) {
          return Row(
            children: [
              AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15 / 2),
                  color: index == selectedIndex ? selectedColor : defaultColor,
                ),
                duration: const Duration(milliseconds: 250),
                height: 15,
                width: index == selectedIndex ? 30 : 15,
              ),
              const SizedBox(
                width: 5,
              )
            ],
          );
        },
        itemCount: totalItems,
      ),
    );
  }
}
