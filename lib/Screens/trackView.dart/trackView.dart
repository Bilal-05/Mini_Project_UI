import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/Constants/imagePath.dart';
import 'package:mini_project/DataBases/address.dart';
import 'package:mini_project/toast/customToast.dart';

import '../../widgets/customAppbar.dart';

class TrackView extends StatefulWidget {
  final int orderNumber;
  const TrackView({super.key, required this.orderNumber});

  @override
  State<TrackView> createState() => _TrackViewState();
}

class _TrackViewState extends State<TrackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              //AppBar
              margin: const EdgeInsets.fromLTRB(15, 10, 10, 0),
              child: const CustomAppBar(
                screenName: 'Track Order',
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(ProductImages.map),
                ),
                Container(
                  height: 80,
                  width: 335,
                  decoration: BoxDecoration(
                    color: TextColors.textColor1,
                    border: Border.all(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        height: 75,
                        width: 75,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                          boxShadow: [
                            BoxShadow(
                              color: TextColors.textColor1,
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 20.0,
                              spreadRadius: .5,
                            ), //BoxShadow
                            BoxShadow(
                              color: TextColors.textColor2,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 20.0,
                              spreadRadius: 0.6,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundColor: TextColors.textColor2,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(ProductImages.Rider),
                            ),
                          ),
                        ),
                      ),
                      const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Delivery Man',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: TextColors.textColor2),
                          ),
                          Text(
                            'Rakibul Hassan',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: TextColors.textColor3),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: FloatingActionButton(
                          backgroundColor: PrimaryColors.primaryBlue,
                          onPressed: () {
                            CustomToast.showToast('Rider lost contact :)');
                          },
                          child: const Icon(Icons.message_rounded),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20),
              child: const ListTile(
                leading: FaIcon(FontAwesomeIcons.clock),
                title: Text(
                  'Delivery In',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: TextColors.textColor4),
                ),
                subtitle: Text(
                  '25 Min',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: TextColors.textColor3),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10, bottom: 15),
              child: ListTile(
                leading: const FaIcon(FontAwesomeIcons.locationArrow),
                title: const Text(
                  'Delivery Address',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: TextColors.textColor4),
                ),
                subtitle: Text(
                  Address.addressList[0]['addressDetails'],
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: TextColors.textColor3),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Container(
                  height: 6,
                  width: 75,
                  decoration: BoxDecoration(
                    color: TextColors.textColor2,
                    borderRadius: BorderRadius.circular(70),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10, bottom: 15),
              child: ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Order Details',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: TextColors.textColor3,
                        ),
                      ),
                      TextSpan(
                        text: '    (ID: #${widget.orderNumber})',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: TextColors.textColor2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
