import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signs_app/core/extensions/extensions.dart';
import 'package:signs_app/core/models/sign/sign.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:flutter/material.dart';
import 'package:signs_app/core/redux/actions/navigation_action.dart';
import 'package:signs_app/ui/components/scaffold_animation.dart';

class SignsGroup {
  final String type;
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

class _SignsGroupPageState extends State<SignsGroupPage> {
  @override
  Widget build(BuildContext context) {
    final signs = widget.signsGroup.signs;

    return ScaffoldAnimation(
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 150,
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: SizedBox.expand(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      'Rambu Lalu Lintas\n${widget.signsGroup.type.displayedType}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.paytoneOne(
                        fontSize: 24,
                      ),
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
                                  color: item.type.color,
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
                                      color: item.type.foregoundColor,
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
