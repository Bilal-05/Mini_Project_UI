import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mini_project/Constants/colors.dart';
import 'package:mini_project/DataBases/address.dart';
import 'package:mini_project/Screens/ordersView/orders_View.dart';
import 'package:mini_project/Screens/trackView.dart/trackView.dart';
import 'package:mini_project/toast/customToast.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    var randomNumber = Random().nextInt(10000);

    List Options = [
      'View Orders',
      'Track Orders',
    ];

    List<Icon> Iconss = [Icon(Icons.shopping_bag), Icon(Icons.location_on)];

    List pages = [OrderView(), TrackView(orderNumber: randomNumber)];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('More Menu'),
        backgroundColor: PrimaryColors.primaryBlue,
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: Options.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  onTap: () {
                    if (index == 1) {
                      Address.addressList.isNotEmpty
                          ? Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                              return pages[index];
                            }))
                          : CustomToast.showToast('First Place an order');
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return pages[index];
                      }));
                    }
                  },
                  title: Text(Options[index]),
                  trailing: Iconss[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
