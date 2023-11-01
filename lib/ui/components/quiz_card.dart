import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:signs_app/core/models/quiz/answer.dart';
import 'package:signs_app/core/models/quiz/question.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:signs_app/ui/components/primary_button.dart';

class QuestionCard extends StatefulActionMapper {
  const QuestionCard({
    super.key,
    required this.question,
    required this.answers,
    required this.onAnswer,
    required this.onNext,
  });

  final Question question;
  final Map<Question, Answer> answers;
  final ValueChanged<Answer> onAnswer;
  final VoidCallback onNext;

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    _playAudio();
  }

  void _playAudio() {
    String voiceText =
        '${widget.question.question}. Pilihan jawabannya adalah ';

    for (int i = 0; i < widget.question.answers.length; i++) {
      final text = widget.question.answers[i].text;
      if (text.isNotEmpty) voiceText += '$text\n';
    }
    widget.getIt.get<FlutterTts>().speak(voiceText);
  }

  FlutterTts get flutterTts => widget.getIt.get<FlutterTts>();

  void _onSelectAnswer(Answer answer, [String text = '']) {
    widget.onAnswer(answer);
    flutterTts.speak('Anda memilih ${answer.text} $text');
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.question;
    final hasAnswer = widget.answers.containsKey(question);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            if (question.image.isNotEmpty)
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(question.image),
                  ),
                ),
              ),
            const SizedBox(height: 16),
            if (question.question.isNotEmpty)
              Center(
                child: Text(
                  question.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const SizedBox(height: 16),
            ...List.generate(
              question.answers.length,
              (index) {
                final item = question.answers[index];
                final hasImage = item.image.isNotEmpty;
                final hasText = item.text.isNotEmpty;
                bool selected = false;

                if (hasAnswer) {
                  selected = widget.answers[question] == item;
                }

                return Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: GestureDetector(
                    onTap: () => _onSelectAnswer(
                      item,
                      hasImage && !hasText ? 'Gambar ke ${index + 1}' : '',
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: !hasImage,
                          replacement: Row(
                            children: [
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: selected ? Colors.amber : null,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (hasImage) ...[
                                    Image.network(
                                      item.image,
                                      height: 60,
                                    ),
                                    const SizedBox(height: 6),
                                  ],
                                  if (hasText)
                                    Text(
                                      item.text,
                                      style: TextStyle(
                                        fontWeight: selected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: selected ? Colors.amber : null,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                item.text,
                                style: TextStyle(
                                  fontWeight: selected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                    .animate(
                      key: ValueKey(item),
                      delay: Duration(milliseconds: 200 * index),
                    )
                    .fadeIn();
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 30, 16, 16),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: PrimaryButton(
                  text: 'Selanjutnya',
                  onTap: hasAnswer ? widget.onNext : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
