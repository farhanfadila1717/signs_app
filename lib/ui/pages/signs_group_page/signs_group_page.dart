import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signs_app/core/extensions/extensions.dart';
import 'package:signs_app/core/models/sign/sign.dart';
import 'package:signs_app/core/models/sign/type_sign.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:flutter/material.dart';
import 'package:signs_app/core/redux/actions/navigation_action.dart';
import 'package:signs_app/ui/components/audio_controll.dart';
import 'package:signs_app/ui/components/scaffold_animation.dart';
import 'package:signs_app/ui/components/tts_mixin.dart';

class SignsGroup {
  final TypeSign type;
  final List<Sign> signs;

  SignsGroup(this.type, this.signs);
}

class SignsGroupPage extends StatefulActionMapper {
  const SignsGroupPage({
    super.key,
    required this.signsGroup,
  });

  final SignsGroup signsGroup;

  @override
  State<SignsGroupPage> createState() => _SignsGroupPageState();
}

class _SignsGroupPageState extends State<SignsGroupPage> with TtsMixin {
  @override
  void initState() {
    super.initState();
    final type = widget.signsGroup.type;
    initTts('Rambu ${type.displayedName}\n${type.description}');
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final signs = widget.signsGroup.signs;
    final type = widget.signsGroup.type;

    return ScaffoldAnimation(
      skyColor: type.color.toColor.withOpacity(.6),
      bottomNavigationBar: AudioControll(
        ttsState: ttsState,
        progressNotifier: progressNotifier,
        onPause: flutterTts.stop,
        onPlay: playAudio,
        color: type.color.toColor,
      ),
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 100,
              foregroundColor: type.foregroundColor.toColor,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: SizedBox.expand(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Rambu ${type.displayedName}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.paytoneOne(
                        fontSize: 24,
                        color: type.foregroundColor.toColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              sliver: SliverToBoxAdapter(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.8),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      type.description.lineBreak.trim(),
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 50),
              sliver: SliverMasonryGrid.count(
                childCount: signs.length,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemBuilder: (_, index) {
                  final item = signs[index];
                  return GestureDetector(
                    onTap: () => widget.dispatch(
                      NavigateToNextAction(
                        '/detail-sign',
                        extra: item,
                      ),
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Image.network(
                                item.image,
                                height: 100,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: type.color.toColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                      color: type.foregroundColor.toColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
          ],
        ),
      ),
    );
  }
}
