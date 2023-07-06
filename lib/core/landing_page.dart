// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets.dart';
import '../buttons/be_a_member.dart';
import '../buttons/login.dart';

class LandingPage extends StatefulWidget {
  static const title = 'Dala-Kuha';
  static const androidIcon = Icon(Icons.music_note);
  static const iosIcon = Icon(CupertinoIcons.music_note);

  const LandingPage({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // static const _itemsLength = 50;

  // final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();

  late List<MaterialColor> colors;
  late List<String> songNames;

  @override
  void initState() {
    // _setData();
    super.initState();
  }

  // void _setData() {
  //   colors = getRandomColors(_itemsLength);
  //   songNames = getRandomNames(_itemsLength);
  // }

  // Future<void> _refreshData() {
  //   return Future.delayed(
  //     // This is just an arbitrary delay that simulates some network activity.
  //     const Duration(seconds: 2),
  //     () => setState(() => _setData()),
  //   );
  // }

  // Widget _listBuilder(BuildContext context, int index) {
  //   if (index >= _itemsLength) return Container();

  //   // Show a slightly different color palette. Show poppy-ier colors on iOS
  //   // due to lighter contrasting bars and tone it down on Android.
  //   final color = defaultTargetPlatform == TargetPlatform.iOS
  //       ? colors[index]
  //       : colors[index].shade400;

  //   return SafeArea(
  //     top: false,
  //     bottom: false,
  //     child: Hero(
  //       tag: index,
  //       child: HeroAnimatingSongCard(
  //         song: songNames[index],
  //         color: color,
  //         heroAnimation: const AlwaysStoppedAnimation(0),
  //         onPressed: () => Navigator.of(context).push<void>(
  //           MaterialPageRoute(
  //             builder: (context) => SongDetailTab(
  //               id: index,
  //               song: songNames[index],
  //               color: color,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void _togglePlatform() {
    // ignore: avoid_print
    print("Toggling platform");
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      debugDefaultTargetPlatformOverride = TargetPlatform.android;
    } else {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    }

    // This rebuilds the application. This should obviously never be
    // done in a real app but it's done here since this app
    // unrealistically toggles the current platform for demonstration
    // purposes.
    WidgetsBinding.instance.reassembleApplication();
  }

  // ===========================================================================
  // Non-shared code below because:
  // - Android and iOS have different scaffolds
  // - There are different items in the app bar / nav bar
  // - Android has a hamburger drawer, iOS has bottom tabs
  // - The iOS nav bar is scrollable, Android is not
  // - Pull-to-refresh works differently, and Android has a button to trigger it too
  //
  // And these are all design time choices that doesn't have a single 'right'
  // answer.
  // ===========================================================================
  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(120.0),
                  child: Column(children: [
                    const Text(
                      "Welcome to",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      'assets/dala_logo_white.png',
                      height: 120,
                      width: 120,
                    ),
                    const Text(
                      "Ride and earn",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 5, 70, 122),
                          fontStyle: FontStyle.italic),
                    ),
                  ]),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(children: [
                    BeAMemberButton(),
                    LoginButton(),
                  ]),
                ),
              ],
            ),
          ],
        ), /* add child content here */
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlatform,
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(120.0),
                  child: Column(children: [
                    const Text(
                      "Welcome to",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      'assets/dala_logo_white.png',
                      height: 120,
                      width: 120,
                    ),
                    const Text(
                      "Ride and earn",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 5, 70, 122),
                          fontStyle: FontStyle.italic),
                    ),
                  ]),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: Column(children: [
                    BeAMemberButton(),
                  ]),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Column(children: [
                    LoginButton(),
                  ]),
                ),
              ],
            ),
          ],
        ), /* add child content here */
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlatform,
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }

  @override
  Widget build(context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
