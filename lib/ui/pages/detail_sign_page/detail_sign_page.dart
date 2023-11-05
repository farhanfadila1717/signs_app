import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:signs_app/core/models/sign/sign.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:signs_app/ui/components/audio_controll.dart';
import 'package:signs_app/ui/components/tts_mixin.dart';
import 'package:signs_app/ui/components/type_chip.dart';

class DetailSignPage extends StatefulActionMapper {
  const DetailSignPage({
    super.key,
    required this.sign,
  });

  final Sign sign;

  @override
  State<DetailSignPage> createState() => _DetailSignPageState();
}

class _DetailSignPageState extends State<DetailSignPage> with TtsMixin {
  @override
  void initState() {
    super.initState();
    initTts('${widget.sign.name}\n${widget.sign.description}');
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 230.0,
            flexibleSpace: FlexibleSpaceBar(
              background: SizedBox.expand(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned.fill(
                      child: ColoredBox(
                        color: Colors.amberAccent.withOpacity(.3),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/city.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Positioned(
                      bottom: 28,
                      child: Image.network(
                        widget.sign.image,
                        height: 150,
                      ),
                    ),
                    Positioned(
                      bottom: -1,
                      child: ColoredBox(
                        color: const Color(0xFF555151),
                        child: SizedBox(
                          height: 30,
                          width: size.width,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        'assets/images/bike.png',
                        width: 80,
                      )
                          .animate(
                            delay: const Duration(seconds: 5),
                            onComplete: (contoller) => contoller.repeat(),
                          )
                          .slideX(
                            begin: -1,
                            duration: const Duration(seconds: 10),
                            end: 7,
                          ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        'assets/images/car_red.png',
                        width: 130,
                      )
                          .animate(
                            onComplete: (contoller) => contoller.repeat(),
                          )
                          .slideX(
                            begin: -1,
                            duration: const Duration(seconds: 10),
                            end: 5,
                          ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.sign.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  TypeChip(type: widget.sign.type),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                widget.sign.description.trim(),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: AudioControll(
        ttsState: ttsState,
        speakingWord: speakingWord,
        onPause: flutterTts.stop,
        onPlay: playAudio,
      ),
    );
  }
}
