import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signs_app/core/extensions/extensions.dart';
import 'package:signs_app/core/models/quiz/answer.dart';
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

      // for (var i in upload) {
      //   quiz.doc('${i.level}_${i.no}_${generateRandomString(10)}').set(
      //         i.toJson(),
      //       );
      // }

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

const upload = <Question>[
  Question(
    no: 4,
    level: 1,
    question: 'Rambu larangan?',
    image:
        'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_dilarang_merokok.png?alt=media&token=aa2d168e-d56b-41d6-a223-fcf4641fe0a4&_gl=1*1hhsyyf*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MDk3NzIuNTAuMC4w',
    answers: [
      Answer(
        text: 'Merokok',
        correct: true,
      ),
      Answer(
        text: 'Membeli rokok',
      ),
      Answer(
        text: 'Menjual rokok',
      ),
      Answer(
        text: 'Berenang',
      ),
    ],
  ),
  Question(
    no: 5,
    level: 1,
    question: 'Rambu larangan?',
    image:
        'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_dilarang_putar_balik.png?alt=media&token=08cc5409-a2ef-4a99-894e-100e269540a5&_gl=1*1keoitc*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MDk4NjYuNTEuMC4w',
    answers: [
      Answer(
        text: 'Dilarang putar balik',
        correct: true,
      ),
      Answer(
        text: 'Dilarang belok kanan',
      ),
      Answer(
        text: 'Dilarang belok kiri',
      ),
      Answer(
        text: 'Dilarang parkir',
      ),
    ],
  ),
  Question(
    no: 6,
    level: 1,
    question: '',
    image:
        'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_parkir.png?alt=media&token=fa72f0c2-5d16-4458-8588-fe80fec5071d&_gl=1*1wndah5*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTAwNjAuNTMuMC4w',
    answers: [
      Answer(
        text: 'Dilarang parkir',
      ),
      Answer(
        text: 'Tempat parkir',
        correct: true,
      ),
      Answer(
        text: 'Dilarang berhenti',
      ),
      Answer(
        text: 'Dilarang masuk',
      ),
    ],
  ),
  Question(
    no: 7,
    level: 1,
    question: 'Rambu dilarang parkir?',
    image: '',
    answers: [
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_dilarang_putar_balik.png?alt=media&token=08cc5409-a2ef-4a99-894e-100e269540a5&_gl=1*1fwhgzg*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTE2MjguNjAuMC4w',
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_dilarang_parkir.png?alt=media&token=9749985e-9b25-4290-8c5b-c97baba36e43&_gl=1*iw6uf9*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTE2NTUuMzMuMC4w',
        correct: true,
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_dilarang_berhenti.png?alt=media&token=850917cb-dd0a-48be-b720-cb55c87df58b&_gl=1*11ej1qf*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTE2NzcuMTEuMC4w',
      ),
    ],
  ),
  Question(
    no: 8,
    level: 1,
    question: 'Rambu dilarang belok kanan?',
    image: '',
    answers: [
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_dilarang_belok_kanan.png?alt=media&token=4d0361eb-289d-443a-8634-bc1d58bbf17c&_gl=1*1o1v9kz*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTE4NjIuNjAuMC4w',
        correct: true,
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_dilarang_parkir.png?alt=media&token=9749985e-9b25-4290-8c5b-c97baba36e43&_gl=1*iw6uf9*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTE2NTUuMzMuMC4w',
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_dilarang_berhenti.png?alt=media&token=850917cb-dd0a-48be-b720-cb55c87df58b&_gl=1*11ej1qf*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTE2NzcuMTEuMC4w',
      ),
    ],
  ),
  Question(
    no: 9,
    level: 1,
    question: 'Manakah yang merupakan rambu peringatan jalan licin?',
    image: '',
    answers: [
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_perempatan.png?alt=media&token=763f2875-746a-4ab4-a5ce-75c2d25cba57&_gl=1*gkrdhm*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTA1NDMuNDUuMC4w',
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_lampu_lalu_lintas.png?alt=media&token=a362946d-90db-447b-8161-dbec8c384738&_gl=1*19ih3t7*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTA1NjYuMjIuMC4w',
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_longsor.png?alt=media&token=f690ca8d-6f7c-4922-bbdc-d1800397082d&_gl=1*1a1gmf2*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTA1ODUuMy4wLjA.',
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_jalan_licin_2.png?alt=media&token=1ec1b9c2-93c5-442c-9aea-271fcd3a19c3&_gl=1*12g8vvz*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTA4NjYuNTMuMC4w',
      ),
    ],
  ),
  Question(
    no: 9,
    level: 1,
    question: 'Manakah yang merupakan rambu peringatan jalan licin?',
    image: '',
    answers: [
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_perempatan.png?alt=media&token=763f2875-746a-4ab4-a5ce-75c2d25cba57&_gl=1*gkrdhm*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTA1NDMuNDUuMC4w',
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_lampu_lalu_lintas.png?alt=media&token=a362946d-90db-447b-8161-dbec8c384738&_gl=1*19ih3t7*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTA1NjYuMjIuMC4w',
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_longsor.png?alt=media&token=f690ca8d-6f7c-4922-bbdc-d1800397082d&_gl=1*1a1gmf2*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTA1ODUuMy4wLjA.',
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_jalan_licin_2.png?alt=media&token=1ec1b9c2-93c5-442c-9aea-271fcd3a19c3&_gl=1*12g8vvz*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTA4NjYuNTMuMC4w',
      ),
    ],
  ),
  Question(
    no: 10,
    level: 1,
    question: 'Rambu peringatan apa ini?',
    image:
        'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_banyak_tikungan.png?alt=media&token=83609f0e-94c4-498a-b13a-62f7fa7fd3f6&_gl=1*q77prb*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODgwNzg4Ny45NC4xLjE2OTg4MTEzMDYuNTMuMC4w',
    answers: [
      Answer(
        text: 'Banyak lubang',
      ),
      Answer(
        text: 'Jalan lurus',
      ),
      Answer(
        text: 'Banyak tikungan 3 km ke depan',
      ),
      Answer(
        text: 'Jalan berkelok',
      ),
    ],
  ),
];
