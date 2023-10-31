import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signs_app/core/extensions/extensions.dart';
import 'package:signs_app/core/models/quiz/question.dart';
import 'package:signs_app/core/models/sign/sign.dart';
import 'package:signs_app/core/redux/actions/app_action.dart';
import 'package:signs_app/core/redux/states/app_state.dart';
import 'package:signs_app/core/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:redux/redux.dart';

class AppMiddleware extends MiddlewareClass<AppState> {
  AppMiddleware();

  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    switch (action.runtimeType) {
      case InitTtsAction:
        _onInitTtsAction(store, action);
        break;
      case GetQuestionsAction:
        _onGetQuestionsAction(store, action);
        break;
      case GetSignsAction:
        _onGetSignsAction(store, action);
        break;
    }

    next(action);
  }

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  Future<void> _onInitTtsAction(
    Store<AppState> store,
    InitTtsAction action,
  ) async {
    try {
      final flutterTts = getIt.get<FlutterTts>();

      await flutterTts.awaitSpeakCompletion(true);
      await flutterTts.setLanguage('id-ID');
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  Future<void> _onGetQuestionsAction(
    Store<AppState> store,
    GetQuestionsAction action,
  ) async {
    try {
      final quiz = firestore.collection('quiz');

      final quizs = await quiz.get();

      List<Question> questions = [];
      for (var i in quizs.docs) {
        questions.add(Question.fromJson(i.data()));
      }

      questions.sort((a, b) => a.no.compareTo(b.no));

      store.dispatch(
        SetQuestionsAction(questions),
      );
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  Future<void> _onGetSignsAction(
    Store<AppState> store,
    GetSignsAction action,
  ) async {
    try {
      final collection = firestore.collection('signs');

      final response = await collection.get();

      List<Sign> signs = [];
      List<String> types = [];
      for (var i in response.docs) {
        final sign = Sign.fromJson(i.data());
        signs.add(sign);

        if (!types.contains(sign.type)) {
          types.add(sign.type);
        }
      }

      signs.sort((a, b) => a.name.compareTo(b.name));

      Map<String, List<Sign>> signsByType = {};

      for (var i in types) {
        final findSignsByType = signs.where((e) => e.type.contains(i)).toList();

        signsByType[i] = findSignsByType;
      }

      store.dispatches([
        SetSignsAction(signs),
        SetSignsByTypeAction(signsByType),
      ]);
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}
