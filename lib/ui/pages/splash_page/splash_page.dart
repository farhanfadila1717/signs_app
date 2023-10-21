import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flags_app/core/redux/action_mapper.dart';
import 'package:flags_app/core/redux/actions/authentication_action.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulActionMapper {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    widget.dispatch(
      const GetCurrentLoginAction(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/icon.png',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 30),
            const SizedBox.square(
              dimension: 30,
              child: CircularProgressIndicator.adaptive(),
            ),
          ],
        ),
      ),
    );
  }
}