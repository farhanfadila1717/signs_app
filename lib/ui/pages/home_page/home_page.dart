import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:signs_app/core/redux/actions/navigation_action.dart';
import 'package:signs_app/ui/components/scaffold_animation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulActionMapper {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ScaffoldAnimation(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            flexibleSpace: FlexibleSpaceBar(
              background: SizedBox.expand(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 50,
                      width: size.width,
                      child: Text(
                        'Rambu Lalu Lintas',
                        style: GoogleFonts.paytoneOne(
                          fontSize: 24,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            sliver: SliverGrid.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: const [
                _Menu(
                  path: '/signs',
                  title: 'Rambu Lalu Lintas',
                ),
                _Menu(
                  path: '/quiz',
                  title: 'Kuis',
                ),
                _Menu(
                  path: '/history',
                  title: 'Sejarah',
                ),
                _Menu(
                  path: '/profile',
                  title: 'Profil',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Menu extends StatelessActionMapper {
  const _Menu({
    required this.path,
    required this.title,
  });

  final String path;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => dispatch(
        NavigateToNextAction(
          path,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.orangeAccent.shade100,
          border: Border.all(
            color: Colors.deepOrange,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.paytoneOne(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
