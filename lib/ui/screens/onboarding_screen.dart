import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/core/models/onboarding_model.dart';
import 'package:onboarding/data_dummy.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.1,
              child: CarouselSlider(
                items: data.map((item) => _items(OnBoardingModel.fromJson(item))).toList(),
                options: CarouselOptions(
                  initialPage: _currentIndex,
                  height: double.infinity,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                carouselController: _carouselController,
              ),
            ),
            _dotIndicator(),
            _button(),
          ],
        ),
      ),
    );
  }

  Widget _button() {
    return _currentIndex == 2
        ? Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  _carouselController.animateToPage(2);
                },
                child: Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                  child: const Text(
                    'Start',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          )
        : Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  _carouselController.animateToPage(2);
                },
                child: Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                  child: const Text(
                    'Skip',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          );
  }

  Widget _dotIndicator() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 50,
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: _currentIndex == 0 ? Colors.black : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: _currentIndex == 1 ? Colors.black : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                color: _currentIndex == 2 ? Colors.black : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _items(OnBoardingModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 100),
          SizedBox(
            height: 300,
            width: 300,
            child: CircleAvatar(backgroundImage: NetworkImage(item.imageUrl ?? "")),
          ),
          const SizedBox(height: 50),
          Text(item.title ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black), textAlign: TextAlign.center),
          const SizedBox(height: 30),
          Text(item.subtitle ?? "", style: const TextStyle(fontSize: 16, color: Colors.grey), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
