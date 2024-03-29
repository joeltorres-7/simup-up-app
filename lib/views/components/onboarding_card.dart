import 'package:flutter/material.dart';
import 'package:simup_up/views/components/slider_dots.dart';
import 'package:simup_up/views/styles/spaces.dart';

class OnboardingCard extends StatelessWidget {
  final int currentIndex;
  final List<Map<String, String>> items;
  final VoidCallback onNextPressed;

  const OnboardingCard({super.key, required this.onNextPressed, required this.currentIndex, required this.items});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 32.0,
            right: 24.0,
            bottom: 32.0,
            left: 24.0
        ),
        child: SizedBox(
          height: screenHeight / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${items[currentIndex]['title']}',
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 32,
                          letterSpacing: -0.6,
                          height: 0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0B1215)
                      ),
                      textAlign: TextAlign.start,
                    ),
                    VerticalSpacing(8.0),
                    Text(
                      '${items[currentIndex]['subtitle']}',
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          height: 1.6,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF666666)),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SliderDots(
                    dotNumber: 3,
                    currentDot: currentIndex,
                  ),
                  GestureDetector(
                    onTap: onNextPressed,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: const Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),);
  }
}
