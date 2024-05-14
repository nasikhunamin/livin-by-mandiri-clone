import 'package:flutter/material.dart';
import 'package:ui/ui.dart';

class DynamicMenuWidget extends StatelessWidget {
  DynamicMenuWidget({super.key});

  final List<String> titles = [
    "Transfer Rupiah",
    "Top Up",
    "Bayar",
    "Sukha",
    "e-Money",
    "QR Terima Transfer",
    "Transfer Valas",
    "Tap to Pay",
    "QR Bayar",
    "Investasi"
  ];

  final List<String> images = [
    "https://tdwcontent.telkomsel.com/s3fs-public/images/pages/assets/Mobile-gift.png",
    "https://tdwcontent.telkomsel.com/s3fs-public/images/pages/assets/Frame_0.png",
    "https://tdwcontent.telkomsel.com/s3fs-public/images/pages/assets/Mobile-purchase-package.png",
    "https://tdwcontent.telkomsel.com/s3fs-public/images/pages/assets/Mobile-dailycheckin.png",
    "https://tdwcontent.telkomsel.com/s3fs-public/images/pages/assets/Umrah-icon.png",
    "https://tdwcontent.telkomsel.com/s3fs-public/images/pages/assets/Mobile-jelajah-nusantara.png",
    "https://tdwcontent.telkomsel.com/s3fs-public/images/pages/assets/Mobile-credit.png",
    "https://tdwcontent.telkomsel.com/s3fs-public/images/pages/assets/TahilalatstakeoverJH---Pojok-Seru-ALT-1-%281%29-%281%29_0%20%281%29.png",
    "https://tdwcontent.telkomsel.com/s3fs-public/images/pages/assets/IBL%202024%20%20Corner.png",
    "https://tdwcontent.telkomsel.com/s3fs-public/images/pages/assets/Mobile-inet-voucher.png"
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 1.2,
      crossAxisCount: 2,
      scrollDirection: Axis.horizontal,
      mainAxisSpacing: 4,
      crossAxisSpacing: 8,
      shrinkWrap: true,
      children: List.generate(
          10,
          (index) =>
              ItemDynamicMenu(title: titles[index], image: images[index])),
    );
  }
}

class ItemDynamicMenu extends StatelessWidget {
  final String title;
  final String image;

  const ItemDynamicMenu({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        MyNetworkImage(
          url: image,
          width: 48,
          height: 48,
          fit: BoxFit.fitHeight,
        ),
        4.verticalSpace,
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12.sp, overflow: TextOverflow.ellipsis),
          maxLines: 2,
        ),
      ],
    );
  }
}
