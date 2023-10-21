import 'package:redux/redux.dart';

import 'auth_reducer.dart';

final allReducers = combineReducers([
  authReducer,
]);
