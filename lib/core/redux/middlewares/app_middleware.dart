import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:signs_app/core/extensions/extensions.dart';
import 'package:signs_app/core/models/about/about.dart';
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

const upload = <Question>[
  Question(
    no: 21,
    level: 3,
    question: 'Rambu lalu lintas bermanfaat untuk?',
    image: '',
    answers: [
      Answer(
        text: 'Hiasan jalan',
      ),
      Answer(
        text: 'Menarik perhatian',
      ),
      Answer(
        text: 'Ketertiban lalu lintas',
        correct: true,
      ),
      Answer(
        text: 'Penerangan jalan',
      ),
    ],
  ),
  Question(
    no: 22,
    level: 3,
    question: 'Fungsi dari lampu lalu lintas adalah?',
    image: '',
    answers: [
      Answer(
        text: 'Tempat penyebrangan jalan',
      ),
      Answer(
        text: 'Tanda untuk melarang pergerakan lalu lintas tertentu',
      ),
      Answer(
        text: 'Memberi petunjuk tentang arah yang harus ditempuh',
      ),
      Answer(
        text: 'Sebagai pengatur arus kendaraan pada persimpangan jalan',
        correct: true,
      ),
    ],
  ),
  Question(
    no: 23,
    level: 3,
    question: 'Rambu berwarna merah menunjukan rambu?',
    image:
        'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_larangan.png?alt=media&token=c965c0f5-1c76-42ba-979b-f31f66e9bb25&_gl=1*13j1wk4*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODg5MzQwNy45OC4xLjE2OTg4OTY2MDQuNDguMC4w',
    answers: [
      Answer(
        text: 'Larangan',
        correct: true,
      ),
      Answer(
        text: 'Petunjuk',
      ),
      Answer(
        text: 'Peringatan',
      ),
      Answer(
        text: 'Perintah',
      ),
    ],
  ),
  Question(
    no: 24,
    level: 3,
    question: 'Rambu berwarna kuning menunjukan rambu?',
    image:
        'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_peringatan.png?alt=media&token=54def03e-b8c5-4bbf-8169-b750187d2495&_gl=1*1u4hyws*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODg5MzQwNy45OC4xLjE2OTg4OTY3ODUuNDkuMC4w',
    answers: [
      Answer(
        text: 'Larangan',
      ),
      Answer(
        text: 'Petunjuk',
      ),
      Answer(
        text: 'Peringatan',
        correct: true,
      ),
      Answer(
        text: 'Perintah',
      ),
    ],
  ),
  Question(
    no: 25,
    level: 3,
    question: 'Jika mau ke tebet, kita harus mengambil arah?',
    image:
        'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_petunjuk_jalan_2.png?alt=media&token=c2ca94d8-9b69-43b1-b43a-267f71e563ed&_gl=1*ulz7e7*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODg5MzQwNy45OC4xLjE2OTg4OTU4NzUuNjAuMC4w',
    answers: [
      Answer(
        text: 'Kanan',
      ),
      Answer(
        text: 'Kiri',
        correct: true,
      ),
      Answer(
        text: 'Lurus',
      ),
      Answer(
        text: 'Putar balik',
      ),
    ],
  ),
  Question(
    no: 26,
    level: 3,
    question: 'Manakah rambu yang menunjukkan rambu petunjuk jurusan',
    image: '',
    answers: [
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_parkir.png?alt=media&token=fa72f0c2-5d16-4458-8588-fe80fec5071d&_gl=1*yxjezg*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODg5MzQwNy45OC4xLjE2OTg4OTQzNzUuNjAuMC4w',
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_tempat_menyebrang.png?alt=media&token=9608e50f-b9fa-404f-ae71-0a6ba8738f45&_gl=1*p0ut4k*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODg5MzQwNy45OC4xLjE2OTg4OTQ0OTUuNTQuMC4w',
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_petunjuk_jalan_2.png?alt=media&token=c2ca94d8-9b69-43b1-b43a-267f71e563ed&_gl=1*ulz7e7*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODg5MzQwNy45OC4xLjE2OTg4OTU4NzUuNjAuMC4w',
        correct: true,
      ),
    ],
  ),
  Question(
    no: 27,
    level: 3,
    question:
        'Rambu lalu lintas yang ditunjukan kepada pengguna jalan agar berhati-hati biasanya berwarna?',
    image: '',
    answers: [
      Answer(
        text: 'Merah',
      ),
      Answer(
        text: 'Hijau',
      ),
      Answer(
        text: 'Kuning',
        correct: true,
      ),
      Answer(
        text: 'Biru',
      ),
    ],
  ),
  Question(
    no: 28,
    level: 3,
    question: 'Arti rambu diatas adalah?',
    image:
        'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_30km.png?alt=media&token=15e2e1ad-7da7-4fe7-baf6-6a7c432f8e5f&_gl=1*oak8dw*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODg5MzQwNy45OC4xLjE2OTg4OTcwNTMuNTUuMC4w',
    answers: [
      Answer(
        text: 'Kecepatan maksimum yang diwajibkan',
      ),
      Answer(
        text: 'Kecepatan minimum yang diwajibkan',
        correct: true,
      ),
      Answer(
        text: 'Panjang jalan yang akan dilewati',
      ),
    ],
  ),
  Question(
    no: 29,
    level: 3,
    question:
        'Rambu larangan menunjukkan perbuatan yang dilarang dilakukan oleh pengguna jalan. Warna dasar dari rambu jenis ini adalah putih dan lambang atau tulisan berwarna hitam atau merah. Contohnya adalah?',
    image: '',
    answers: [
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_dilarang_parkir.png?alt=media&token=9749985e-9b25-4290-8c5b-c97baba36e43&_gl=1*hkwhgy*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODg5MzQwNy45OC4xLjE2OTg4OTczMTMuNTYuMC4w',
        correct: true,
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_tempat_menyebrang.png?alt=media&token=9608e50f-b9fa-404f-ae71-0a6ba8738f45&_gl=1*p0ut4k*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODg5MzQwNy45OC4xLjE2OTg4OTQ0OTUuNTQuMC4w',
      ),
      Answer(
        image:
            'https://firebasestorage.googleapis.com/v0/b/signs-app-c725a.appspot.com/o/r_jalan_licin_2.png?alt=media&token=1ec1b9c2-93c5-442c-9aea-271fcd3a19c3&_gl=1*flxr07*_ga*MTYzODY5NDQwLjE2NjUwMzY2MTE.*_ga_CW55HF8NVT*MTY5ODg5MzQwNy45OC4xLjE2OTg4OTczNTcuMTIuMC4w',
      ),
    ],
  ),
  Question(
    no: 30,
    level: 3,
    question:
        'Berapakah maksimal jumlah orang yang berada dalam satu sepeda motor?',
    image: '',
    answers: [
      Answer(
        text: '1',
      ),
      Answer(
        text: '2',
        correct: true,
      ),
      Answer(
        text: '3',
      ),
      Answer(
        text: '4',
      ),
    ],
  ),
];
