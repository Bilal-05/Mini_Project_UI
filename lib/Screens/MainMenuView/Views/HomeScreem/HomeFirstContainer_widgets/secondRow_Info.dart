import 'package:flutter/material.dart';

import 'package:mini_project/Constants/colors.dart';

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
      child: TextField(
        style: const TextStyle(color: TextColors.textColor1),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 23, horizontal: 10),
          filled: true,
          hintText: "Search Products or store",
          hintStyle: const TextStyle(color: TextColors.textColor1),
          prefixIconColor: TextColors.textColor1,
          prefixIcon: const Icon(Icons.search_sharp),
          fillColor: PrimaryColors.primaryDarkBlue,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide:
                const BorderSide(color: PrimaryColors.primaryBlue, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide:
                const BorderSide(color: PrimaryColors.primaryBlue, width: 3),
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
