import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tdee/core/screen_utils.dart';
import 'package:tdee/routes/routes.dart';
import 'package:tdee/routes/routes_extension.dart';
import 'package:tdee/utils/assets.dart';

class SplshScreen extends StatefulWidget {
  const SplshScreen({super.key});

  @override
  State<SplshScreen> createState() => _SplshScreenState();
}

class _SplshScreenState extends State<SplshScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 1),
      () => context.toNamed(ScreenRoutes.toHomeScreen),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: context.mQHeight * 0.7,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(300.0),
              ),
              color: Color(0xff001332),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.mQHeight * 0.15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.mQWidth * 0.6,
                  width: context.mQWidth * 0.6,
                  child: Image.asset(
                    tdeeLogo,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: context.mQHeight * 0.87,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Powered by,",
                      style: TextStyle(
                        fontSize: context.defaultPadding * 0.6,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      children: [
                        Text(
                          "App Realm",
                          style: TextStyle(
                            fontSize: context.defaultPadding * 0.8,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: context.defaultPadding * 1.8,
                          width: context.defaultPadding * 1.8,
                          child: Image.asset(logo),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
