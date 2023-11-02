import 'package:flutter/material.dart';
import 'package:signs_app/core/extensions/extensions.dart';
import 'package:signs_app/ui/components/tts_mixin.dart';

import 'bottom_area_bar.dart';

class AudioControll extends StatelessWidget {
  const AudioControll({
    super.key,
    required this.ttsState,
    required this.progressNotifier,
    required this.onPause,
    required this.onPlay,
  });

  final TtsState ttsState;
  final ValueNotifier<double> progressNotifier;
  final VoidCallback onPause;
  final VoidCallback onPlay;

  @override
  Widget build(BuildContext context) {
    return BottomAreaBar(
      children: [
        SizedBox(
          width: context.sizeOf.width,
          child: Row(
            children: [
              Builder(
                builder: (_) {
                  if (ttsState == TtsState.playing) {
                    return FloatingActionButton(
                      heroTag: 'pause',
                      onPressed: onPause,
                      child: const Icon(Icons.pause),
                    );
                  }
                  return FloatingActionButton(
                    heroTag: 'play',
                    onPressed: onPlay,
                    child: const Icon(Icons.play_arrow),
                  );
                },
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: progressNotifier,
                  builder: (_, value, __) {
                    return LinearProgressIndicator(
                      value: value,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
