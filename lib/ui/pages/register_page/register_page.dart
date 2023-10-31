import 'package:flutter/services.dart';
import 'package:signs_app/core/models/authentication/form_register_user.dart';
import 'package:signs_app/core/redux/action_mapper.dart';
import 'package:signs_app/core/redux/actions/authentication_action.dart';
import 'package:signs_app/core/redux/actions/navigation_action.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:signs_app/ui/components/primary_button.dart';
import 'package:signs_app/ui/components/scaffold_animation.dart';
import 'package:signs_app/ui/components/text_field.dart';

class RegisterPage extends StatefulActionMapper {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
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
              'Daftar Akun',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          DefaultTextField(
            margin: const EdgeInsets.only(top: 20),
            controller: _nameController,
            title: 'Nama',
            hint: 'Masukkan nama',
          ),
          DefaultTextField(
            margin: const EdgeInsets.only(top: 20),
            controller: _emailController,
            title: 'Email',
            hint: 'Masukkan email',
          ),
          PasswordField(
            margin: const EdgeInsets.only(top: 20, bottom: 30),
            controller: _passwordController,
          ),
          SizedBox(
            height: 50,
            child: PrimaryButton(
              onTap: () => widget.dispatch(
                SubmitRegisterAction(
                  registerUser: FormRegisterUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                    fullName: _nameController.text,
                  ),
                ),
              ),
              text: 'Daftar',
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Sudah mempunyai akun? '),
                  TextSpan(
                    text: 'Masuk',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => widget.dispatch(
                            const NavigateToNextAction('/login'),
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
