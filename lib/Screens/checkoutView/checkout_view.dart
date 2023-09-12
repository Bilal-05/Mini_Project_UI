import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Screens/addCardView/addCard_view.dart';
import 'package:mini_project/toast/customToast.dart';

import '../../DataBases/InCart.dart';
import '../../DataBases/address.dart';
import '../../widgets/customAppbar.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  TextEditingController addressName = TextEditingController();
  TextEditingController address = TextEditingController();
  FocusNode addressName1 = FocusNode();
  FocusNode address2 = FocusNode();

  late String address_name = '';
  late String address_detail = '';
  Map addAddress = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: TextColors.textColor1,
              child: Container(
                //AppBar
                margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                child: CustomAppBar(
                  screenName: 'Shopping Cart (${Cart.inCart.length})',
                ),
              ),
            ),
            Container(
              //AppBar
              margin: const EdgeInsets.fromLTRB(30, 20, 10, 20),
              child: const Text(
                'Delivery Address',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            Address.addressList.isNotEmpty
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: ListView.builder(
                      itemCount: Address.addressList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1, color: TextColors.textColor2),
                            color: TextColors.textColor1,
                          ),
                          width: 330,
                          height: 80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      Address.addressList[index]['addressName'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: TextColors.textColor3,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      Address.addressList[index]
                                          ['addressDetails'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: TextColors.textColor3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(
                                        () {
                                          if (Address.addressList[index]
                                                  ['addressSelected'] ==
                                              true) {
                                            Address.addressList[index]
                                                ['addressSelected'] = false;
                                          } else {
                                            Address.addressList[index]
                                                ['addressSelected'] = true;
                                          }
                                        },
                                      );
                                    },
                                    icon: Icon(
                                      Icons.check_circle,
                                      color: Address.addressList[index]
                                                  ['addressSelected'] ==
                                              true
                                          ? PrimaryColors.primaryYellow
                                          : Colors.grey,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        Address.addressList.removeAt(index);
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      child: const Text(
                                        'Remove',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: PrimaryColors.primaryBlue,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  )
                : Container(
                    height: 500,
                    child: const Center(
                      child: Text(
                        'Add Address',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: InkWell(
                onTap: () async {
                  setState(() {});
                  await showModalBottomSheet(
                    backgroundColor: PrimaryColors.primaryBlue,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: 240,
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    child: TextField(
                                      focusNode: addressName1,
                                      style: const TextStyle(
                                          color: TextColors.textColor3),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 23, horizontal: 10),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            addressName.clear();
                                          },
                                          icon: const Icon(
                                            Icons.cancel_outlined,
                                            color: TextColors.textColor4,
                                          ),
                                        ),
                                        hintText: 'Address Name',
                                        filled: true,
                                        fillColor: TextColors.textColor1,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: TextColors.textColor2,
                                              width: 0.5),
                                        ),
                                      ),
                                      controller: addressName,
                                      onSubmitted: (String value) {
                                        address_name = addressName.text;
                                        FocusScope.of(context)
                                            .requestFocus(address2);
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: TextField(
                                      focusNode: address2,
                                      style: const TextStyle(
                                          color: TextColors.textColor3),
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 23, horizontal: 10),
                                        suffixIcon: IconButton(
                                          onPressed: () {
                                            address.clear();
                                          },
                                          icon: const Icon(
                                            Icons.cancel_outlined,
                                            color: TextColors.textColor4,
                                          ),
                                        ),
                                        hintText: 'Address',
                                        filled: true,
                                        fillColor: TextColors.textColor1,
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: TextColors.textColor2,
                                              width: 0.5),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: TextColors.textColor2,
                                              width: 1),
                                        ),
                                      ),
                                      controller: address,
                                      onSubmitted: (String value) {
                                        address_detail = address.text;
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(100, 50),
                                          backgroundColor:
                                              TextColors.textColor1,
                                          side: const BorderSide(
                                              width: 2,
                                              color: TextColors.textColor2),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10))),
                                      onPressed: () {
                                        setState(() {
                                          if (addressName.text == '' &&
                                              address.text == '') {
                                            CustomToast.showToast(
                                                'Please fill both TextField');
                                          } else if (addressName.text == '') {
                                            CustomToast.showToast(
                                                'Please enter address name');
                                          } else if (address.text == '') {
                                            CustomToast.showToast(
                                                'Please enter address details');
                                          } else {
                                            address_name = addressName.text;
                                            address_detail = address.text;
                                            addressName.clear();
                                            address.clear();

                                            addAddress['addressName'] =
                                                address_name;
                                            addAddress['addressDetails'] =
                                                address_detail;
                                            addAddress['addressSelected'] =
                                                false;
                                            Address.addressList.add(addAddress);
                                            addAddress = {};
                                            Navigator.pop(context);
                                          }
                                        });
                                      },
                                      child: const Text(
                                        'Submit',
                                        style: TextStyle(
                                            color: TextColors.textColor4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                  setState(() {});
                },
                child: Center(
                  child: Container(
                    height: 50,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.circlePlus,
                          color: PrimaryColors.primaryYellow,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Add New Address',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: TextColors.textColor3),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Address.addressList.isNotEmpty
                ? Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 122),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: PrimaryColors.primaryBlue,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            fixedSize: const Size(327, 56)),
                        onPressed: () {
                          int Count = 0;
                          for (int i = 0; i < Address.addressList.length; i++) {
                            if (Address.addressList[i]['addressSelected'] ==
                                true) {
                              Count++;
                            }
                          }

                          if (Count == 0) {
                            CustomToast.showToast('Select an Address');
                          } else if (Count == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return AddCard();
                                },
                              ),
                            );
                          } else {
                            CustomToast.showToast('Select only 1 Address');
                          }
                        },
                        child: const Text(
                          "Add Card",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
