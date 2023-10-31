import 'package:google_fonts/google_fonts.dart';
import 'package:signs_app/core/extensions/extensions.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:signs_app/core/redux/actions/app_action.dart';
import 'package:flutter/material.dart';
import 'package:signs_app/core/redux/actions/navigation_action.dart';
import 'package:signs_app/ui/components/default_store_connector.dart';
import 'package:signs_app/ui/components/scaffold_animation.dart';
import 'package:signs_app/ui/pages/signs_group_page/signs_group_page.dart';

class SignsPage extends StatefulActionMapper {
  const SignsPage({super.key});

  @override
  State<SignsPage> createState() => _SignsPageState();
}

class _SignsPageState extends State<SignsPage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldAnimation(
      body: RefreshIndicator(
        onRefresh: () async {
          widget.dispatch(
            const GetSignsAction(),
          );
          return;
        },
        child: Scrollbar(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                expandedHeight: 150,
                foregroundColor: Colors.black,
                backgroundColor: Colors.transparent,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: SizedBox.expand(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Macam-macam\nRambu Lalu Lintas',
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
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                sliver: DefaultStoreConnector(
                  builder: (_, state) {
                    final signsByType = state.signsByType;
                    final keys = signsByType.keys;

                    return SliverList.separated(
                      itemCount: keys.length,
                      itemBuilder: (_, index) {
                        final item = keys.elementAt(index);
                        final signs = signsByType[item]!;

                        return GestureDetector(
                          onTap: () => widget.dispatch(
                            NavigateToNextAction(
                              '/signs-group',
                              extra: SignsGroup(
                                item,
                                signs,
                              ),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: item.color,
                              border: Border.all(
                                width: 4,
                                color: item.foregoundColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Center(
                              child: Text(
                                'Rambu ${item.displayedType}',
                                style: GoogleFonts.paytoneOne(
                                  color: item.foregoundColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) =>
                          const SizedBox(height: 16),
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
      ),
    );
  }
}
