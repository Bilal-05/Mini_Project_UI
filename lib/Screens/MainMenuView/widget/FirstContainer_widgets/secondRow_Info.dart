import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:mini_project/Constants/Colors.dart';

class SecondRow extends StatefulWidget {
  const SecondRow({super.key});

  @override
  State<SecondRow> createState() => _SecondRowState();
}

class _SecondRowState extends State<SecondRow> {
  TextEditingController HomeController = TextEditingController();
  late String text;
  @override
  void initState() {
    HomeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    HomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          prefixIcon: const Icon(Icons.search_sharp),
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide:
                const BorderSide(color: PrimaryColors.primary2, width: 3),
          ),
        ),
        controller: HomeController,
        onSubmitted: (String value) {
          setState(() {
            text = HomeController.text;
            HomeController.clear();
          });
        },
      ),
    );
  }
}
