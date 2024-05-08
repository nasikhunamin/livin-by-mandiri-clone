import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:ui/ui.dart';

class SearchCountryCodeScreen extends StatefulWidget {
  const SearchCountryCodeScreen({super.key});

  @override
  State<SearchCountryCodeScreen> createState() =>
      _SearchCountryCodeScreenState();
}

class _SearchCountryCodeScreenState extends State<SearchCountryCodeScreen> {
  TextEditingController controller = TextEditingController(text: "");

  Timer? debounceTimer;

  List<String> suggestions = ["Indonesia", "Malaysia", "Singapura", "Brunei"];

  List<String> all = [
    "Afganistan",
    "Afrika Selatan",
    "America",
    "Austria",
    "Australia",
    "Arab Saudi",
    "Bangladesh",
    "China",
    "England",
    "Finland",
    "France",
    "Indonesia",
    "Ghana",
    "Maroko",
    "Mesir",
    "Myanmar",
    "Thailand",
    "Timor Leste",
    "Uni Emirate Arab",
    "Vietnam",
  ];

  String _query = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> resultSuggestion = [];
    List<String> resultOther = [];
    if (_query.isNotEmpty) {
      for (var item in suggestions) {
        if (item.toLowerCase().contains(_query)) {
          resultSuggestion.add(item);
        }
      }

      for (var item in all) {
        if (item.toLowerCase().contains(_query)) {
          resultOther.add(item);
        }
      }
    } else {
      resultOther = all;
      resultSuggestion = suggestions;
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 0,
          titleSpacing: 0,
          title: TextField(
            controller: controller,
            keyboardType: TextInputType.text,
            showCursor: true,
            cursorColor: Colors.blue,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12).r,
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Colors.grey,
              ),
              suffix: GestureDetector(
                onTap: () {
                  controller.text = "";
                  setState(() {
                    _query = "";
                  });
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp),
                ),
              ),
              hintText: "Search for country name",
              hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 16.sp),
            ),
            maxLines: 1,
            style: TextStyle(
                fontFamily: 'Poppins', fontSize: 16.sp, color: Colors.black),
            textAlign: TextAlign.start,
            onChanged: (value) {
              debounceTimer?.cancel();

              debounceTimer = Timer(const Duration(milliseconds: 500), () {
                setState(() {
                  _query = controller.text;
                });
              });
            },
          )),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ItemSearch(code: resultSuggestion[index]),
                  childCount: resultSuggestion.length)),
          SliverAppBar(
            pinned: true,
            leadingWidth: 8.w,
            leading: null,
            elevation: 0,
            toolbarHeight: 48.h,
            backgroundColor: Colors.white,
            titleSpacing: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  color: Colors.grey.shade100,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.all(const Radius.circular(16).r)),
                  child: Padding(
                    padding: const EdgeInsets.all(8).r,
                    child: Text(
                      "Other countries",
                      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    thickness: 3,
                    color: Colors.grey.shade100,
                  ),
                ),
                16.horizontalSpace,
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => ItemSearch(code: resultOther[index]),
                  childCount: resultOther.length)),
        ],
      ),
    );
  }
}

class ItemSearch extends StatelessWidget {
  final String code;
  const ItemSearch({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        code,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontFamily: FontFamily.poppins),
      ),
      onTap: () {
        Navigator.pop(context, "+12");
      },
    );
  }
}
