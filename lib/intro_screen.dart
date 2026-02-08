import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'tier_selection.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  int _page = 0;

  final List<Color> pages = [
    Colors.brown,
    Colors.brown.shade300,
    Colors.brown,
  ];

  void _next() {
    if (_page < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToTierSelection();
    }
  }

  void _goToTierSelection() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const TierSelectionScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pages.length,
            onPageChanged: (i) => setState(() => _page = i),
            itemBuilder: (_, i) => Container(
              color: pages[i],
              child: const Center(
                child: Text(
                  'Right Hand Mike',
                  style: TextStyle(
                    fontSize: 34,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Row(
              children: [
                TextButton(
                  onPressed: _goToTierSelection,
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                Expanded(
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: pages.length,
                      effect:  WormEffect(
                        activeDotColor: Colors.white,
                        dotColor: Colors.white54,
                      ),
                    ),
                  ),
                ),

                TextButton(
                  onPressed: _next,
                  child: Text(
                    _page == pages.length - 1 ? 'Done' : 'Next',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}