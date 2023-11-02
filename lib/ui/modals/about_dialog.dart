import 'package:just_audio/just_audio.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:signs_app/core/redux/actions/app_action.dart';
import 'package:signs_app/ui/components/default_store_connector.dart';
import 'package:signs_app/ui/components/primary_button.dart';
import 'package:flutter/material.dart';

class AboutDialog extends StatefulActionMapper {
  const AboutDialog({super.key});

  @override
  State<AboutDialog> createState() => _AboutDialogState();
}

class _AboutDialogState extends State<AboutDialog> {
  late final AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    final about = widget.store.state.about;
    if (about == null) {
      widget.dispatch(
        const GetAboutAction(),
      );
    } else {
      _initAudio(about.audio);
    }
  }

  void _initAudio(String url) async {
    try {
      await _player.setUrl(url);
    } catch (ex) {
      debugPrint(ex.toString());
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blue.shade100,
        ),
        child: DefaultStoreConnector(
          onDidChange: (previousState, state) async {
            if (previousState?.about?.audio != state.about?.audio) {
              if (state.about?.audio == null) return;
              await _player.setUrl(state.about!.audio);
            }
          },
          builder: (_, state) {
            final about = state.about;

            if (about == null) {
              return const SizedBox(
                height: 200,
                width: double.infinity,
                child: CircularProgressIndicator.adaptive(),
              );
            }

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Tentang',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      if (about.audio.isNotEmpty)
                        StreamBuilder<PlayerState>(
                          stream: _player.playerStateStream,
                          builder: (context, snapshot) {
                            final playerState = snapshot.data;
                            final processingState =
                                playerState?.processingState;
                            final playing = playerState?.playing;
                            if (processingState == ProcessingState.loading ||
                                processingState == ProcessingState.buffering) {
                              return const SizedBox.square(
                                dimension: 24,
                                child: CircularProgressIndicator(),
                              );
                            } else if (playing != true) {
                              return FloatingActionButton.small(
                                onPressed: _player.play,
                                child: const Icon(Icons.play_arrow),
                              );
                            } else if (processingState !=
                                ProcessingState.completed) {
                              return FloatingActionButton.small(
                                onPressed: _player.pause,
                                child: const Icon(Icons.pause),
                              );
                            } else {
                              return FloatingActionButton.small(
                                onPressed: () => _player.seek(Duration.zero),
                                child: const Icon(Icons.replay),
                              );
                            }
                          },
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _NameCard(
                    type: 'Dibuat oleh',
                    name: about.creator,
                  ),
                  const SizedBox(height: 10),
                  _NameCard(
                    type: 'Dosen materi',
                    name: about.dospem1,
                  ),
                  const SizedBox(height: 10),
                  _NameCard(
                    type: 'Dosen teknik',
                    name: about.dospem2,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: PrimaryButton(
                      text: 'Oke',
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _NameCard extends StatelessWidget {
  const _NameCard({required this.name, required this.type});

  final String name;
  final String type;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(type),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Text(
                name,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
