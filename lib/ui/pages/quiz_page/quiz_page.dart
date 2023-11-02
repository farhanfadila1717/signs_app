import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signs_app/core/extensions/extensions.dart';
import 'package:signs_app/core/models/quiz/answer.dart';
import 'package:signs_app/core/models/quiz/question.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:flutter/material.dart' hide AboutDialog;
import 'package:signs_app/core/redux/actions/navigation_action.dart';
import 'package:signs_app/core/router/navigation_destination.dart';
import 'package:signs_app/ui/components/default_store_connector.dart';
import 'package:signs_app/ui/components/primary_button.dart';
import 'package:signs_app/ui/components/quiz_card.dart';
import 'package:signs_app/ui/components/scaffold_animation.dart';

class QuizPage extends StatefulActionMapper {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final Map<Question, Answer> _answers = {};
  bool _isPlay = false, _showLevelChanged = false;
  int _index = 0, _level = 1;

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
    final size = MediaQuery.sizeOf(context);

    return ScaffoldAnimation(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: !_isPlay || _showLevelChanged
            ? null
            : IconButton(
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
      floatingActionButton: _isPlay
          ? null
          : GestureDetector(
              onTap: () => widget.dispatch(
                const ShowModalBottomSheetAction(
                  destination: AboutDialogDestination(),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'i',
                        style: GoogleFonts.paytoneOne(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 44,
                    width: 44,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _isPlay
            ? _showLevelChanged
                ? ListView(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 50),
                    children: [
                      SizedBox(
                        height: size.height * .15,
                      ),
                      Text(
                        'Pertanyaan Level ke $_level',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.paytoneOne(
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: PrimaryButton(
                          text: 'Oke',
                          color: Colors.green,
                          foregroundColor: Colors.white,
                          onTap: () {
                            setState(() {
                              _showLevelChanged = false;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                : ListView(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 50),
                    children: [
                      DefaultStoreConnector(
                        builder: (_, state) {
                          if (questions.isEmpty) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: context.sizeOf.height * .2,
                              ),
                              child: const Center(
                                child: CircularProgressIndicator.adaptive(),
                              ),
                            );
                          }
                          final question = questions[_index];
                          final isLast = questions.last == question;

                          return QuestionCard(
                            key: ValueKey(question),
                            question: question,
                            answers: _answers,
                            onAnswer: (answer) => _onAnswer(question, answer),
                            onNext: () {
                              if (isLast) {
                                widget.store.dispatch(
                                  NavigateToAndReplaceAction(
                                    '/results-quiz',
                                    extra: _answers,
                                  ),
                                );
                                return;
                              }
                              _showLevelChanged =
                                  questions[_index + 1].level.toInt() > _level;

                              if (_showLevelChanged) _level++;

                              _index++;
                              setState(() {});
                            },
                          );
                        },
                      ),
                    ],
                  )
            : SizedBox.expand(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * .15,
                    ),
                    Text(
                      'Kuis Rambu\nLalu Lintas',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.paytoneOne(
                        fontSize: 40,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: PrimaryButton(
                        text: 'Mulai',
                        color: Colors.green,
                        foregroundColor: Colors.white,
                        onTap: () {
                          setState(() {
                            _isPlay = true;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 50,
                      width: 200,
                      child: PrimaryButton(
                        text: 'Keluar',
                        color: Colors.redAccent,
                        foregroundColor: Colors.white,
                        onTap: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
