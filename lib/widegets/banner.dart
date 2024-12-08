import 'package:flutter/material.dart';

class SlideshowBanner extends StatefulWidget {
  @override
  _SlideshowBannerState createState() => _SlideshowBannerState();
}

class _SlideshowBannerState extends State<SlideshowBanner> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  final List<String> _imagePaths = [
    'assets/slide1.png',
    'assets/slide2.png',
    'assets/slide3.png',
  ];

  @override
  void initState() {
    super.initState();
    _startSlideshow();
  }

  void _startSlideshow() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        int nextIndex = (_currentIndex + 1) % _imagePaths.length;
        _pageController.animateToPage(
          nextIndex,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentIndex = nextIndex;
        });
        _startSlideshow();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _imagePaths.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              _imagePaths[index],
              fit: BoxFit.cover,
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
