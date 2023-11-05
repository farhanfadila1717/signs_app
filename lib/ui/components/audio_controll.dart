import 'package:flutter/material.dart';
import 'package:signs_app/ui/components/tts_mixin.dart';

class AudioControll extends StatelessWidget {
  const AudioControll({
    super.key,
    required this.ttsState,
    required this.speakingWord,
    required this.onPause,
    required this.onPlay,
    this.color = Colors.orange,
  });

  final TtsState ttsState;
  final ValueNotifier<String> speakingWord;
  final VoidCallback onPause;
  final VoidCallback onPlay;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Builder(
          builder: (_) {
            if (ttsState == TtsState.playing) {
              return FloatingActionButton(
                heroTag: 'pause',
                onPressed: onPause,
                backgroundColor: color,
                foregroundColor: Colors.white,
                child: const Icon(
                  Icons.pause,
                ),
              );
            }
            return FloatingActionButton(
              heroTag: 'play',
              onPressed: onPlay,
              backgroundColor: color,
              foregroundColor: Colors.white,
              child: const Icon(
                Icons.music_note,
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        ValueListenableBuilder(
          valueListenable: speakingWord,
          builder: (_, word, __) {
            if (word.isEmpty || ttsState == TtsState.stopped) {
              return const SizedBox.shrink();
            }

            return DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(3),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.volume_up,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      word,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
