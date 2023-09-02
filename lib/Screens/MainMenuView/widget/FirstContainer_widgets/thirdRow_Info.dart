import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/Constants/Colors.dart';

class ThirdRo extends StatelessWidget {
  const ThirdRo({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class ThirdRow extends StatefulWidget {
  const ThirdRow({super.key});

  @override
  State<ThirdRow> createState() => _ThirdRowState();
}

class _ThirdRowState extends State<ThirdRow> {
  final List<String> items = [
    '30 Minutes',
    '1 Hour',
    '2 Hours',
    '3 Hours',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Opacity(
                opacity: 0.50,
                child: Text(
                  "DELIVERY TO",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: TextColors.textColor1),
                ),
              ),
              Text(
                "Green Way 3000, Sylhet",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: TextColors.textColor1),
              )
            ],
          ),
        ),
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Opacity(
                opacity: 0.50,
                child: Text(
                  "WITHIN",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: TextColors.textColor1),
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  style: const TextStyle(
                    color: TextColors.textColor1,
                  ),
                  isDense: true,
                  isExpanded: true,
                  hint: const Text(
                    'Select Time',
                    style: TextStyle(
                        fontSize: 14,
                        color: TextColors.textColor1,
                        fontWeight: FontWeight.w500),
                  ),
                  items: items
                      .map((String item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ))
                      .toList(),
                  value: selectedValue,
                  onChanged: (String? value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    width: 140,
                  ),
                  dropdownStyleData: const DropdownStyleData(
                      decoration: BoxDecoration(color: PrimaryColors.primary1)),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
