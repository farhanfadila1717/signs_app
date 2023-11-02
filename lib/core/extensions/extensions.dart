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
  Color get color {
    switch (this) {
      case 'WARNING':
        return const Color(0xFFFFC635);
      case 'FORBIDDEN':
        return Colors.red;
      case 'INSTRUCTION':
        return const Color(0xFF000095);
      case 'GUIDE':
        return const Color(0xFF009A00);
    }
    return Colors.blue;
  }

  Color get foregoundColor {
    switch (this) {
      case 'FORBIDDEN':
      case 'INSTRUCTION':
      case 'GUIDE':
        return Colors.white;
    }
    return Colors.black;
  }

  String get displayedType {
    switch (this) {
      case 'WARNING':
        return 'Peringatan';
      case 'FORBIDDEN':
        return 'Larangan';
      case 'INSTRUCTION':
        return 'Perintah';
      case 'GUIDE':
        return 'Petunjuk';
    }

    return toLowerCase();
  }
}

extension BuildContextExtensions on BuildContext {
  Size get sizeOf => MediaQuery.sizeOf(this);

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);
}
