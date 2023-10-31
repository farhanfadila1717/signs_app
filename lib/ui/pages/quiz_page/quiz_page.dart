import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signs_app/core/models/quiz/answer.dart';
import 'package:signs_app/core/models/quiz/question.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:flutter/material.dart';
import 'package:signs_app/ui/components/scaffold_animation.dart';

class QuizPage extends StatefulActionMapper {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final Map<Question, Answer> _answers = {};
  bool _isPlay = false;
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
    final size = MediaQuery.sizeOf(context);
    return ScaffoldAnimation(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: _isPlay
          ? null
          : Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _isPlay
            ? Center(
                child: Text('Playing'),
              )
            : SizedBox.expand(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * .2,
                    ),
                    Text(
                      'Kuis Rambu\nLalu Lintas',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.paytoneOne(
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
