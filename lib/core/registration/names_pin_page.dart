// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../components/registration/names_pin_form.dart';
import '../../widgets.dart';

class NamesPinPage extends StatefulWidget {
  static const title = 'Registration';
  // static const androidIcon = Icon(Icons.music_note);
  // static const iosIcon = Icon(CupertinoIcons.music_note);

  const NamesPinPage({super.key, this.androidDrawer});

  final Widget? androidDrawer;

  @override
  State<NamesPinPage> createState() => _NamesPinPageState();
}

class _NamesPinPageState extends State<NamesPinPage> {
  // static const _itemsLength = 50;

  // final _androidRefreshKey = GlobalKey<RefreshIndicatorState>();

  late List<MaterialColor> colors;
  late List<String> songNames;

  @override
  void initState() {
    // _setData();
    super.initState();
  }

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

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 100.0),
                    child: Column(children: [
                      Text(
                        "Oops! Let us know who you are.",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontStyle: FontStyle.italic),
                      ),
                    ]),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(children: [
                        NamesPinForm(),
                      ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
      body: _buildBody(context),
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
