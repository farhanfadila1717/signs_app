import 'package:flags_app/core/models/quiz/answer.dart';
import 'package:flags_app/core/models/quiz/question.dart';
import 'package:flags_app/core/redux/action_mapper.dart';
import 'package:flags_app/core/redux/actions/navigation_action.dart';
import 'package:flags_app/core/router/navigation_destination.dart';
import 'package:flags_app/ui/components/default_store_connector.dart';
import 'package:flags_app/ui/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/question_card.dart';

class QuizPage extends StatefulActionMapper {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool _isPlay = false;
  final Map<Question, Answer> _answers = {};
  int _index = 0;

  List<Question> get questions => widget.store.state.questions;

  void _onAnswer(Question question, Answer answer) async {
    if (_answers.containsKey(question)) {
      _answers.update(question, (value) => answer);
    } else {
      _answers[question] = answer;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(
          child: ColoredBox(
            color: Colors.white,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/bg_kuis.png',
            alignment: Alignment.bottomCenter,
            fit: BoxFit.fitWidth,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            'assets/images/flag_bg.png',
            alignment: Alignment.bottomCenter,
            opacity: const AlwaysStoppedAnimation(0.1),
            fit: BoxFit.fitWidth,
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _isPlay
              ? DefaultStoreConnector(
                  builder: (context, state) {
                    if (questions.isEmpty) {
                      return const Scaffold(
                        body: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }

                    final question = questions[_index];
                    final isLast = questions.last == question;
                    final hasAnswer = _answers.containsKey(question);

                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      appBar: AppBar(
                        leading: IconButton(
                          onPressed: () {
                            if (_index == 0) {
                              Navigator.pop(context);
                              return;
                            }
                            setState(() {
                              _index--;
                            });
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.centerDocked,
                      floatingActionButton: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: PrimaryButton(
                            text: isLast ? 'Selesai' : 'Selanjutnya',
                            onTap: hasAnswer
                                ? () {
                                    if (isLast) {
                                      widget.store.dispatch(
                                        NavigateToAndReplaceAction(
                                          '/results-quiz',
                                          extra: _answers,
                                        ),
                                      );
                                      return;
                                    }
                                    _index++;
                                    setState(() {});
                                  }
                                : null,
                          ),
                        ),
                      ),
                      body: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        children: [
                          QuestionCard(
                            key: ValueKey(question),
                            question: question,
                            answers: _answers,
                            onAnswer: (answer) => _onAnswer(
                              question,
                              answer,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SizedBox.expand(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Kuis Bendera Negara di Dunia!',
                          style: GoogleFonts.lilitaOne(
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 10),
                          child: SizedBox(
                            height: 45,
                            width: 250,
                            child: PrimaryButton(
                              text: 'Mulai',
                              onTap: () {
                                setState(() {
                                  _isPlay = true;
                                });
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: SizedBox(
                            height: 45,
                            width: 250,
                            child: PrimaryButton(
                              text: 'Tentang',
                              color: Colors.orange,
                              onTap: () => widget.dispatch(
                                const ShowDialogAction(
                                  destination: AboutDialogDestination(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 45,
                          width: 250,
                          child: PrimaryButton(
                            text: 'Keluar',
                            color: Colors.redAccent,
                            onTap: () => Navigator.pop(context),
                          ),
                        ),
                      ]
                          .animate(
                            interval: const Duration(milliseconds: 130),
                          )
                          .fadeIn(
                            curve: Curves.easeIn,
                            duration: const Duration(milliseconds: 250),
                          ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
