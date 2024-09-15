import 'package:flutter/material.dart';
import 'package:freshly/screens/login_screen.dart';
import 'package:freshly/screens/main_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants.dart';
import '../models/content_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController(); // Add a PageController
  int _currentIndex = 0; // Track the current page index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: contents.length,
            onPageChanged: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(contents[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 230,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                contents[index].title,
                                style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                contents[index].description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 25),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MaterialButton(
                                      onPressed: () {
                                        // Add Skip logic here
                                        _controller
                                            .jumpToPage(contents.length - 1);
                                      },
                                      child: const Text(
                                        'Skip',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SmoothPageIndicator(
                                      controller: _controller,
                                      count: contents.length,
                                      effect: const WormEffect(
                                        dotHeight: 10,
                                        dotWidth: 10,
                                        activeDotColor: kPrimaryColor,
                                        dotColor: Colors.grey,
                                      ),
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        if (_currentIndex ==
                                            contents.length - 1) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                     LoginScreen(),
                                              ));
                                        } else {
                                          _controller.nextPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInOut,
                                          );
                                        }
                                      },
                                      child: const Text(
                                        'Next',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
