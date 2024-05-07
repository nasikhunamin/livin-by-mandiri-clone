import 'dart:io';

import 'package:flutter/material.dart';
import 'package:register/src/screens/widgets/progress_scaffold_widget.dart';
import 'package:ui/ui.dart';

class TakeidScreen extends StatefulWidget {
  const TakeidScreen({super.key});

  @override
  State<TakeidScreen> createState() => _TakeidScreenState();
}

class _TakeidScreenState extends State<TakeidScreen> {
  File? idFile;

  @override
  Widget build(BuildContext context) {
    return ProgressScaffoldWidget(
        progress: 0.1,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MyNetworkImage(
                  url:
                      "https://sukasari.bandung.go.id/wp-content/uploads/2018/11/ktp-elektronik.png",
                  width: 60,
                  height: 40,
                  fit: BoxFit.fitHeight,
                ),
                16.verticalSpace,
                Text("Take Photo of e-KTP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.bold)),
                8.verticalSpace,
                Text(
                  "Let's start! Tap the camera icon. take a photo of your e-KTP, and we'll verifiy your identitiy.",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 18.sp, color: Colors.grey.shade400),
                ),
                32.verticalSpace,
                DashedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(8).r,
                  dashPattern: const [4, 2],
                  strokeWidth: 2,
                  color: Colors.blue,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8).r,
                    child: idFile == null
                        ? Container(
                            alignment: Alignment.center,
                            height: 150.h,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue.shade100,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.camera),
                              color: Colors.white,
                              onPressed: () async {
                                var result = await showCapture(
                                    context: context);
                                setState(() {
                                  idFile = result;
                                });
                              },
                            ),
                          )
                        : Image.file(idFile!),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RoundedButton(
                text: "Next",
                onPressed: () {},
              ),
            )
          ],
        ));
  }
}
