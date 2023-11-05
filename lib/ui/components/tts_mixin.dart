import 'dart:convert';

import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum TtsState {
  playing,
  stopped,
}

mixin TtsMixin<T extends StatefulActionMapper> on State<T> {
  late final ValueNotifier<String> speakingWord;

  TtsState ttsState = TtsState.stopped;
  int speakIndex = 0;

  int paraghraphIndex = 0;
  String rawText = '';

  void initTts(String text) {
    speakingWord = ValueNotifier('');
    rawText = text;
    listenTts();
  }

  void listenTts() {
    flutterTts.setStartHandler(() {
      ttsState = TtsState.playing;
      setState(() {});
    });

    flutterTts.setCancelHandler(() {
      ttsState = TtsState.stopped;
      setState(() {});
    });

    flutterTts.setProgressHandler(
      (_, start, end, word) {
        speakIndex = end;
        speakingWord.value = word;
      },
    );
  }

  int paragrapghLength(int index) => texts[index].length;

  int get length {
    int count = 0;
    for (var i in texts) {
      count += i.length;
    }

    return count;
  }

  List<String> get texts {
    LineSplitter ls = const LineSplitter();

    final texts = ls.convert(rawText);

    texts.removeWhere((e) => e.trim().isEmpty);

    return texts;
  }

  void playAudio() async {
    if (paraghraphIndex == texts.length) {
      setState(() {
        ttsState = TtsState.stopped;
        paraghraphIndex = 0;
        speakIndex = 0;
        speakingWord.value = '';
      });
      return;
    }

    final text = texts[paraghraphIndex];
    final speakText = text.substring(speakIndex, text.length);

    final result = await flutterTts.speak(speakText);

    _nextParagraph(result);
  }

  void _nextParagraph(int result) {
    if (result == 1) {
      paraghraphIndex++;
      speakIndex = 0;
      playAudio();
    }
  }

  FlutterTts get flutterTts => widget.getIt.get<FlutterTts>();
}
