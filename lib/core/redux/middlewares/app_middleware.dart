import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signs_app/core/extensions/extensions.dart';
import 'package:signs_app/core/models/about/about.dart';
import 'package:signs_app/core/models/quiz/question.dart';
import 'package:signs_app/core/models/sign/sign.dart';
import 'package:signs_app/core/models/sign/type_sign.dart';
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
      case GetAboutAction:
        _onGetAboutAction(store, action);
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
      final signsCollection = firestore.collection('signs');
      final typesCollection = firestore.collection('types');

      // for (var i in upload) {
      //   signsCollection
      //       .doc(
      //           '${i.type}_${i.name.replaceAll(" ", "_")}_${generateRandomString(3)}')
      //       .set(
      //         i.toJson(),
      //       );
      // }

      final responseSigns = await signsCollection.get();
      final responseType = await typesCollection.get();

      List<Sign> signs = [];
      List<TypeSign> types = [];

      for (var i in responseType.docs) {
        types.add(TypeSign.fromJson(i.data()));
      }

      for (var i in responseSigns.docs) {
        final sign = Sign.fromJson(i.data());
        signs.add(sign);
      }

      signs.sort((a, b) => a.name.compareTo(b.name));

      Map<TypeSign, List<Sign>> signsByType = {};

      for (var i in types) {
        final findSignsByType = signs
            .where(
              (e) => e.type.contains(i.id),
            )
            .toList();

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

  Future<void> _onGetAboutAction(
    Store<AppState> store,
    GetAboutAction action,
  ) async {
    try {
      final collection = firestore.collection('about');

      final response = await collection.get();

      store.dispatch(
        SetAboutAction(
          About.fromJson(
            response.docs.first.data(),
          ),
        ),
      );
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }
}

String generateRandomString(int length) {
  final random = Random();
  const chars =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  String temp = '';

  for (int i = 0; i < length; i++) {
    temp += chars[random.nextInt(chars.length)];
  }

  return temp;
}

final upload = [
  Sign(
    name: 'Parkir',
    image:
        'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_parkir_2.png?alt=media&token=c4cbe941-59a7-41b3-ac61-6db066c5f9a9&_gl=1*wss453*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5OTAxNjcyOS4xMDQuMS4xNjk5MDE3MTk3LjQzLjAuMA..',
    description: '''
Rambu dengan warna dasar biru serta piktogram berupa huruf P berwarna putih ini termasuk rambu petunjuk. Digunakan untuk memberikan informasi mengenai lokasi fasilitas parkir.
'''
        .trim(),
    type: 'INSTRUCTION',
  ),
  Sign(
    name: 'Bundaran',
    image:
        'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_bundaran_2.png?alt=media&token=5b126304-e469-4e29-9ede-87ac507f764b&_gl=1*g2uxh7*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5OTAxNjcyOS4xMDQuMS4xNjk5MDE3Mjc3LjUwLjAuMA..',
    description: '''
Rambu lalu lintas ini menyatakan perintah kepada pengguna jalan untuk mengikuti arah yang ditunjukkan saat memasuki bundaran.
'''
        .trim(),
    type: 'INSTRUCTION',
  ),
  Sign(
    name: 'Rumah Sakit',
    image:
        'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_rumah_sakit_2.png?alt=media&token=7e6d582d-5eda-49a4-bf7a-a6d2b71880fb&_gl=1*zzefyb*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5OTAxNjcyOS4xMDQuMS4xNjk5MDE3NDg5LjM3LjAuMA..',
    description: '''
Rambu dengan warna dasar biru serta piktogram berupa tempat tidur dan palang merah di pojok kanan atasnya ini termasuk rambu petunjuk. Digunakan untuk memberikan informasi mengenai salah satu lokasi pelayanan umum, yaitu rumah sakit.
'''
        .trim(),
    type: 'INSTRUCTION',
  ),
];
