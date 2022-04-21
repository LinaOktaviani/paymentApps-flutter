import 'package:flutter/material.dart';
import 'package:payment_apps/theme.dart';

void main() {
  runApp(PaymentApps());
}

class PaymentApps extends StatefulWidget {
  @override
  State<PaymentApps> createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget options(int index, String title, String subTitle, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
              border: Border.all(
                  color: selectedIndex == index
                      ? Color.fromARGB(255, 250, 253, 76)
                      : Color(0xff40587c)),
              borderRadius: BorderRadius.circular(14)),
          child: Column(
            children: [
              Row(children: [
                selectedIndex == index
                    ? Image.asset(
                        'assets/check-btn.png',
                        width: 18,
                        height: 18,
                      )
                    : Image.asset(
                        'assets/check.png',
                        width: 18,
                        height: 18,
                      ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: planTextStyle,
                    ),
                    Text(
                      subTitle,
                      style: descTextStyle,
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  pricing,
                  style: priceTextStyle,
                )
              ])
            ],
          ),
        ),
      );
    }

    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 32, right: 32),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/icon.png',
                width: 267,
                height: 200,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to',
                  style: titleTextStyle,
                ),
                Text(
                  ' Pro',
                  style: titleProTextStyle,
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Go unlock all features and build your own business bigger',
              style: subtitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget checkOutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51.23,
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: blueColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(71))),
                onPressed: () {},
                child: Text(
                  'CheckOut Now',
                  style: buttonTextStyle,
                )),
          )
        ],
      );
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color.fromARGB(255, 35, 157, 238),
          body: Column(
            children: [
              header(),
              SizedBox(height: 50),
              options(0, 'Monthly', 'Good for starting up', '\$20'),
              options(1, 'Quarterly', 'Focusing on building', '\$55'),
              options(2, 'Yearly', 'Steady company', '\$220'),
              SizedBox(height: 50),
              selectedIndex == -1 ? SizedBox() : checkOutButton()
            ],
          ),
        ));
  }
}
