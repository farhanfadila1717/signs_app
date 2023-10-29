import 'package:signs_app/core/models/quiz/answer.dart';
import 'package:signs_app/core/models/quiz/question.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:flutter/material.dart';

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
        Scaffold(
          appBar: AppBar(
            title: const Text('Quiz'),
          ),
        ),
      ],
    );
  }
}
