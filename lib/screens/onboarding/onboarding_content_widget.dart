import 'package:flutter/material.dart';
import 'package:livin_clone/screens/onboarding/onboarding.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';

class OnboardingContentWidget extends StatefulWidget {
  final List<Onboarding> data;

  const OnboardingContentWidget({super.key, required this.data});

  @override
  State<OnboardingContentWidget> createState() =>
      _OnboardingContentWidgetState();
}

class _OnboardingContentWidgetState extends State<OnboardingContentWidget>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _animController = AnimationController(vsync: this);

    _loadOnBoarding(animateToPage: false);

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController.stop();
        _animController.reset();
        setState(() {
          if (_currentIndex + 1 < widget.data.length) {
            // _currentIndex += 1;
            // _loadOnBoarding(onBoarding: widget.data[_currentIndex]);
            var newIndex = _currentIndex + 1;
            _updateCurrentIndex(newIndex);
          } else {
            // _currentIndex = 0;
            // _loadOnBoarding(onBoarding: widget.data[_currentIndex]);
            _updateCurrentIndex(0);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _animController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _updateCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
      _loadOnBoarding();
    });
  }

  void _loadOnBoarding({bool animateToPage = true}) {
    _animController.stop();
    _animController.reset();
    _animController.duration = const Duration(seconds: 3);
    _animController.forward();
    if (animateToPage) {
      _pageController.animateToPage(_currentIndex,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      //_pageController.jumpToPage(_currentIndex);
    }
  }

  void _onTap(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;

    if (dx < screenWidth / 3) {
      // left side
      setState(() {
        if (_currentIndex == 0) {
          // _currentIndex = widget.data.length - 1;
          // _loadOnBoarding(onBoarding: widget.data[_currentIndex]);
          var newIndex = widget.data.length - 1;
          _updateCurrentIndex(newIndex);
        } else if (_currentIndex - 1 >= 0) {
          // _currentIndex -= 1;
          // _loadOnBoarding(onBoarding: widget.data[_currentIndex]);
          var newIndex = _currentIndex - 1;
          _updateCurrentIndex(newIndex);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      // right side
      setState(() {
        if (_currentIndex + 1 < widget.data.length) {
          // _currentIndex += 1;
          // _loadOnBoarding(onBoarding: widget.data[_currentIndex]);
          var newIndex = _currentIndex + 1;
          _updateCurrentIndex(newIndex);
        } else {
          // _currentIndex = 0;
          // _loadOnBoarding(onBoarding: widget.data[_currentIndex]);
          _updateCurrentIndex(0);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTap(details),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              var item = widget.data[index];
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                margin: EdgeInsets.only(bottom: 0.1.sh).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyNetworkImage(
                      url: item.image,
                      height: 300.h,
                      fit: BoxFit.fitHeight,
                    ),
                    8.verticalSpace,
                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp),
                    ),
                    8.verticalSpace,
                    Text(
                      item.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'poppins', fontSize: 16.sp),
                    )
                  ],
                ),
              );
            },
          ),

          // progresss bar
          Padding(
            padding: const EdgeInsets.only(top: 16, right: 4, left: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children: List.generate(
                        widget.data.length,
                        (index) => IndicatorWidget(
                            animController: _animController,
                            trackColor: Colors.grey.shade300,
                            indicatorColor: Colors.blue,
                            position: index,
                            currentIndex: _currentIndex))),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
