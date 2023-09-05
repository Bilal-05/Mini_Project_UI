import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';

class ThirdRow extends StatefulWidget {
  const ThirdRow({super.key});

  @override
  State<ThirdRow> createState() => _ThirdRowState();
}

class _ThirdRowState extends State<ThirdRow> {
  final List<String> items = [
    '1 Hour',
    '2 Hours',
    '3 Hours',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
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
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Green Way 3000, Sylhet",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: TextColors.textColor1),
                ),
              )
            ],
          ),
        ),
        const Spacer(),
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
                  hint: const Text(
                    '',
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
                    height: 38,
                    width: 85,
                  ),
                  dropdownStyleData: const DropdownStyleData(
                    decoration: BoxDecoration(color: PrimaryColors.primaryBlue),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 38,
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
