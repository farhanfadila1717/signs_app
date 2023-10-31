import 'package:signs_app/core/redux/states/app_state.dart';
import 'package:signs_app/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: getIt.get<Store<AppState>>(),
      child: MaterialApp.router(
        routerConfig: getIt.get<GoRouter>(),
        locale: const Locale('id-ID'),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.orange,
          ),
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            centerTitle: true,
            color: Colors.white,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
