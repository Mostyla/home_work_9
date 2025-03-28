import 'package:flutter/material.dart';
import 'package:test_work_2/create_new_account.dart';
import 'package:test_work_2/divider.dart';
import 'package:test_work_2/header.dart';
import 'package:test_work_2/sign_button.dart';

import 'input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  void _submitForm({
    required String message,
    required Color backgroundColor,
    required bool isNeedToShow,
  }) {
    if (_formKey.currentState!.validate() || isNeedToShow) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: EdgeInsets.all(34),
          content: Text(message),
          backgroundColor: backgroundColor,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 32),
              HeaderLoginWidget(),
              const SizedBox(height: 20),
              InputFieldWidgetForm(
                labelText: "Email",
                fieldStartIcon: Icon(Icons.email),
                onForgotPasswordPressed: () {},
              ),
              const SizedBox(height: 16),
              InputFieldWidgetForm(
                labelText: "Пароль",
                fieldStartIcon: Icon(Icons.lock),
                isPassword: true,
                onForgotPasswordPressed: () {
                  _submitForm(
                    message: "Функция восстановления пароля",
                    backgroundColor: Colors.black12,
                    isNeedToShow: true,
                  );
                },
              ),
              const SizedBox(height: 24),
              SignButton(
                onPressed: () {
                  _submitForm(
                    message: "Вход выполнен успешно!",
                    backgroundColor: Colors.green,
                    isNeedToShow: false,
                  );
                },
              ),
              const SizedBox(height: 16),
              LoginDivider(),
              const SizedBox(height: 16),
              CreateNewAccountField(
                onPressed: () {
                  _submitForm(
                    message: "Переход к регистрации",
                    backgroundColor: Colors.green,
                    isNeedToShow: true,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
