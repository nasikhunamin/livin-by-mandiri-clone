import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:register/register.dart';
import 'package:ui/ui.dart';

class RegisterTncScreen extends StatefulWidget {
  const RegisterTncScreen({super.key});

  @override
  State<RegisterTncScreen> createState() => _RegisterTncScreenState();
}

class _RegisterTncScreenState extends State<RegisterTncScreen> {
  bool _offstage = false;
  bool _expandFirst = true;
  bool _expandSecond = false;
  final ScrollController _scrollController = ScrollController();

  List<TncSection> tncSections = [
    TncSection()
      ..header = "Livin by Mandiri Usage"
      ..url = "https://pub.dev/packages/sticky_and_expandable_list/example"
      ..expanded = false,
    TncSection()
      ..header = "Opening New Account"
      ..url = "https://pub.dev/packages/sticky_and_expandable_list/example"
      ..expanded = false
  ];

  @override
  void initState() {
    _scrollController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _offstage = true;
        });
        return true;
      },
      child: ScaffoldWidget(
        onBack: () {
          setState(() {
            _offstage = true;
          });

          context.pop();
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 32).r,
                child: Column(
                  children: [
                    Text(
                      "Terms & Conditions \nLivin' by Mandiri",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 28.sp, fontWeight: FontWeight.bold),
                    ),
                    8.verticalSpace,
                    Text(
                      "To Proceed to the Next step, you need to read and agree to the Terms and Conditions",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18.sp, color: Colors.grey.shade400),
                    ),
                    16.verticalSpace
                  ],
                ),
              ),
            ),
            SliverAppBar(
              titleSpacing: 0,
              leading: null,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              pinned: _expandFirst,
              scrolledUnderElevation: 0,
              title: GestureDetector(
                  child: Container(
                    color: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 16)
                            .r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "Livin by Mandiri Usage",
                            style: TextStyle(
                                fontFamily: FontFamily.poppins,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.blue),
                          ),
                        ),
                        Icon(
                          _expandFirst ? Icons.minimize : Icons.add,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    //toggle section expand state
                    setState(() {
                      _expandFirst = !_expandFirst;
                      _expandSecond = false;
                      _scrollController.jumpTo(0);
                    });
                  }),
            ),

            SliverToBoxAdapter(
                child: Visibility(
              visible: _expandFirst,
              maintainState: true,
              child: Offstage(
                offstage: _offstage,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16).r,
                  height: 2516,
                  child: const WebWidget(
                    url:
                        "https://pub.dev/packages/sticky_and_expandable_list/example",
                    disableHorizontalScroll: true,
                    disableVerticalScroll: true,
                  ),
                ),
              ),
            )),

            SliverAppBar(
              titleSpacing: 0,
              leading: null,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              elevation: 0,
              pinned: _expandSecond,
              scrolledUnderElevation: 0,
              title: GestureDetector(
                  child: Container(
                    color: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 16)
                            .r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            "Opening New Account",
                            style: TextStyle(
                                fontFamily: FontFamily.poppins,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.blue),
                          ),
                        ),
                        Icon(
                          _expandSecond ? Icons.minimize : Icons.add,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    //toggle section expand state
                    setState(() {
                      _expandSecond = !_expandSecond;
                      _expandFirst = false;
                      _scrollController.jumpTo(0);
                    });
                  }),
            ),

            SliverToBoxAdapter(
                child: Visibility(
              visible: _expandSecond,
              maintainState: true,
              child: Offstage(
                offstage: _offstage,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16).r,
                  height: 2516,
                  child: const WebWidget(
                    url:
                        "https://pub.dev/packages/sticky_and_expandable_list/example",
                    disableHorizontalScroll: true,
                    disableVerticalScroll: true,
                  ),
                ),
              ),
            )),

            SliverFillRemaining(
              hasScrollBody: false,
              child: getButtons(),
            )

            // SliverExpandableList(
            //   builder: SliverExpandableChildDelegate<String, TncSection>(
            //     sectionList: tncSections,
            //     headerBuilder: _buildHeader,
            //     itemBuilder: (context, sectionIndex, itemIndex, index) {
            //       var section = tncSections[sectionIndex];
            //       var item = section.url;
            //       return Offstage(
            //         offstage: _offstage,
            //         child: Container(
            //           padding: const EdgeInsets.symmetric(horizontal: 16).r,
            //           height: section.heightContent,
            //           child: WebWidget(
            //             disableHorizontalScroll: true,
            //             disableVerticalScroll: true,
            //             url: item,
            //             onPageFinished: (height) {
            //               tncSections[sectionIndex].heightContent = height;
            //               setState(() {});
            //             },
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            //SliverToBoxAdapter(child: getButtons())
          ],
        ),
      ),
    );
  }

  Widget getButtons() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 24).r,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedButton(
            text: "I Agree",
            onPressed: () {
              RegisterNavigation.navigateToTakeId(context);
            },
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Decline",
                style: TextStyle(
                    fontFamily: FontFamily.poppins,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: Colors.blue),
              ))
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int sectionIndex, int index) {
    TncSection section = tncSections[sectionIndex];
    return GestureDetector(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  section.header,
                  style: TextStyle(
                      fontFamily: FontFamily.poppins,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Colors.blue),
                ),
              ),
              Icon(
                section.isSectionExpanded() ? Icons.minimize : Icons.add,
                color: Colors.blue,
              )
            ],
          ),
        ),
        onTap: () {
          //toggle section expand state
          setState(() {
            section.setSectionExpanded(!section.isSectionExpanded());
            for (var element in tncSections) {
              //_expanded = element.expanded == true;
            }
          });
        });
  }
}

class TncSection implements ExpandableListSection<String> {
  //store expand state.
  late bool expanded;

  //return item model.
  late String url;

  //example header
  late String header;

  double heightContent = ScreenUtil().screenHeight;

  @override
  bool isSectionExpanded() {
    return expanded;
  }

  @override
  void setSectionExpanded(bool expanded) {
    this.expanded = expanded;
  }

  @override
  List<String>? getItems() {
    return [url];
  }
}
