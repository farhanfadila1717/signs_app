import 'package:flutter_animate/flutter_animate.dart';
import 'package:signs_app/core/models/quiz/answer.dart';
import 'package:signs_app/core/models/quiz/question.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:signs_app/core/redux/actions/navigation_action.dart';
import 'package:signs_app/ui/components/primary_button.dart';
import 'package:signs_app/ui/components/scaffold_animation.dart';
import 'package:signs_app/ui/components/user_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsQuizPage extends StatefulActionMapper {
  const ResultsQuizPage({
    super.key,
    required this.answers,
  });

  final Map<Question, Answer> answers;

  @override
  State<ResultsQuizPage> createState() => _ResultsQuizPageState();
}

class _ResultsQuizPageState extends State<ResultsQuizPage> {
  int _correctAnswer = 0;
  double _percent = 0.0;

  @override
  void initState() {
    super.initState();

    widget.answers.forEach((key, value) {
      if (value.correct) {
        _correctAnswer++;
      }
    });
    _percent = (_correctAnswer / widget.answers.length).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    late final String text;
    late final Color color;
    final percent100 = 100 * _percent;

    if (percent100 > 80) {
      text = 'Mengagumkan';
      color = Colors.blue.withOpacity(.5);
    } else if (percent100 > 50) {
      text = 'Bagus';
      color = Colors.amber.withOpacity(.5);
    } else {
      text = 'Kurang';
      color = Colors.red.withOpacity(.5);
    }

    return ScaffoldAnimation(
      skyColor: color,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Positioned.fill(
            child: ColoredBox(
              color: Colors.black12,
            ),
          ),
          SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.paytoneOne(
                      fontSize: 40,
                    ),
                  )
                      .animate(
                        key: UniqueKey(),
                      )
                      .scale(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: const Duration(seconds: 1),
                      ),
                  const SizedBox(height: 20),
                  UserWidget(
                    builder: (_, user) => Text(
                      '${user.fullName} kamu benar $_correctAnswer dari ${widget.answers.length} pertanyaan',
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 50,
                    width: 230,
                    child: PrimaryButton(
                      text: 'Kembali ke Kuis',
                      color: Colors.green,
                      onTap: () => widget.dispatch(
                        const NavigateToAndReplaceAction('/quiz'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 50,
                    width: 230,
                    child: PrimaryButton(
                      text: 'Kembali ke Beranda',
                      color: Colors.orange,
                      onTap: () => widget.dispatch(
                        const NavigateToRootAction(),
                      ),
                    ),
                  ),
                ]
                    .animate(
                      interval: const Duration(milliseconds: 300),
                    )
                    .fadeIn(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
