import 'package:flutter/material.dart';
import 'package:signs_app/core/redux/states/app_state.dart';
import 'package:redux/redux.dart';

extension StoreExtensions on Store<AppState> {
  void dispatches(List<dynamic> actions) {
    for (var item in actions) {
      dispatch(item);
    }
  }
}

extension StringExtensions on String {
  String get lineBreak => replaceAll('\\n', '\n');

  Color get toColor {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Colors.blue;
  }
}

extension BuildContextExtensions on BuildContext {
  Size get sizeOf => MediaQuery.sizeOf(this);

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
}
