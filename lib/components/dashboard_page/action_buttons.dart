// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButtons extends StatelessWidget {
  static const _logoutMessage = Text(
      "You can't actually log out! This is just a demo of how alerts work.");

  const ActionButtons({super.key});

  // ===========================================================================
  // Non-shared code below because this tab shows different interfaces. On
  // Android, it's showing an alert dialog with 2 buttons and on iOS,
  // it's showing an action sheet with 3 choices.
  //
  // This is a design choice and you may want to do something different in your
  // app.
  // ===========================================================================

  Widget _buildAndroid(BuildContext context) {
    return ElevatedButton(
      child: const Text('LOGIN',
          style: TextStyle(color: Color.fromARGB(255, 2, 12, 116))),
      onPressed: () {
        // You should do something with the result of the dialog prompt in a
        // real app but this is just a demo.
        showDialog<void>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Log out?'),
              content: _logoutMessage,
              actions: [
                TextButton(
                  child: const Text('Got it'),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildIos(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
        padding: const EdgeInsets.all(20),
        width: 120,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 0,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1.0,
              color: Colors.black,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          image: AssetImage("assets/cashin.png"),
                          fit: BoxFit.cover),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: const Color.fromRGBO(2, 2, 119, 1),
                      )),
                ),
                onTap: () {
                  // ignore: avoid_print
                  print("you clicked me");
                }),
            const Center(
              child: Text(
                "Cash In",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(20),
        width: 120,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 0,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 1.0,
              color: Colors.black,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                          image: AssetImage("assets/cashout.png"),
                          fit: BoxFit.cover),
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: const Color.fromRGBO(2, 2, 119, 1),
                      )),
                ),
                onTap: () {
                  // ignore: avoid_print
                  print("you clicked me");
                }),
            const Center(
              child: Text(
                "Cash Out",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
