import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class DebitCardSlider extends StatelessWidget {
  final Function(int index) onChanged;
  final int selectedIndex;
  const DebitCardSlider(
      {super.key, required this.onChanged, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 200,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: false,
          autoPlay: false,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          onPageChanged: (index, reason) {
            onChanged(index);
          },
          scrollDirection: Axis.horizontal),
      items: List.generate(
          4,
          (index) => (index == selectedIndex)
              ? const DebitCard()
              : Stack(
                  children: [
                    const DebitCard(),
                    Opacity(
                      opacity: 0.5,
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
    );
  }
}

class DebitCard extends StatelessWidget {
  const DebitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyNetworkImage(
      url:
          "https://www.mandirikartukredit.com/uploads/media/kartu/visa-gold-front.png",
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
