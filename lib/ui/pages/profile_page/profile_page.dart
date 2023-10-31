import 'package:flutter/services.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:signs_app/core/redux/actions/authentication_action.dart';
import 'package:signs_app/core/redux/actions/navigation_action.dart';
import 'package:signs_app/core/router/navigation_destination.dart';
import 'package:signs_app/ui/components/circle_name.dart';
import 'package:signs_app/ui/components/primary_button.dart';
import 'package:signs_app/ui/components/scaffold_animation.dart';
import 'package:signs_app/ui/components/user_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulActionMapper {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldAnimation(
      appBar: AppBar(
        title: const Text('Profil'),
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: UserWidget(builder: (context, user) {
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            children: [
              CircleName(
                name: user.fullName,
                size: 80,
                fontSize: 40,
                color: Colors.white,
                foregroundColor: Colors.black,
              ),
              _ProfileItem(
                title: 'ID',
                data: user.id,
                margin: const EdgeInsets.only(top: 30),
              ),
              _ProfileItem(
                title: 'Nama',
                data: user.fullName,
                margin: const EdgeInsets.only(top: 16),
              ),
              _ProfileItem(
                title: 'Email',
                data: user.email,
                margin: const EdgeInsets.only(top: 16, bottom: 50),
              ),
              SizedBox(
                height: 50,
                child: PrimaryButton(
                  text: 'Keluar',
                  color: Colors.red,
                  style: const TextStyle(color: Colors.white),
                  onTap: () => widget.dispatch(
                    ShowDialogAction(
                      destination: InfoDialogDestination(
                        title: 'Keluar',
                        message: 'apakah Anda yakin ingin keluar?',
                        onTap: () => widget.dispatch(
                          const LogoutAction(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _ProfileItem extends StatelessWidget {
  const _ProfileItem({
    required this.title,
    required this.data,
    this.margin,
  });

  final String title;
  final String data;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Row(
            children: [
              Text(title),
              const SizedBox(width: 20),
              Expanded(
                child: SelectableText(
                  data,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
