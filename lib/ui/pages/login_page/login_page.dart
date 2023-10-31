import 'package:flutter/services.dart';
import 'package:signs_app/core/models/authentication/form_login.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:signs_app/core/redux/actions/authentication_action.dart';
import 'package:signs_app/core/redux/actions/navigation_action.dart';
import 'package:signs_app/ui/components/primary_button.dart';
import 'package:signs_app/ui/components/scaffold_animation.dart';
import 'package:signs_app/ui/components/text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulActionMapper {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldAnimation(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Center(
            child: Text(
              'Masuk Akun',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          DefaultTextField(
            controller: _emailController,
            title: 'Email',
            hint: 'Masukkan email',
            margin: const EdgeInsets.only(top: 20),
          ),
          PasswordField(
            controller: _passwordController,
            margin: const EdgeInsets.only(top: 20),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () => widget.dispatch(
                const NavigateToNextAction(
                  '/forgot-password',
                ),
              ),
              child: const Text('Lupa password'),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 50,
            child: PrimaryButton(
              onTap: () => widget.dispatch(
                SubmitLoginAction(
                  login: FormLogin(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ),
                ),
              ),
              text: 'Masuk',
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Belum mempunyai akun? '),
                  TextSpan(
                    text: 'Daftar sekarang',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => widget.dispatch(
                            const NavigateToNextAction('/register'),
                          ),
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
