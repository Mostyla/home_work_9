import 'package:flutter/material.dart';

class InputFieldWidgetForm extends StatefulWidget {
  final String labelText;
  final Icon fieldStartIcon;
  final bool isPassword;
  final VoidCallback onForgotPasswordPressed;


  const InputFieldWidgetForm({
    super.key,
    required this.labelText,
    required this.fieldStartIcon,
    this.isPassword = false,
    required this.onForgotPasswordPressed,
  });

  @override
  State<InputFieldWidgetForm> createState() => _InputFieldWidgetFormState();
}

class _InputFieldWidgetFormState extends State<InputFieldWidgetForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          obscureText: widget.isPassword ? _obscureText : false,
          decoration: InputDecoration(
            labelText: widget.labelText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            prefixIcon: widget.fieldStartIcon,
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                    : null,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Поле не должно быть пустым";
            }
            if (!widget.isPassword && !value.contains("@")) {
              return "Email введен некорректно";
            }
            if (widget.isPassword && value.length < 6) {
              return "Пароль должен содержать минимум 6 символов";
            }
            return null;
          },
        ),
        if (widget.isPassword)
          InkWell(
            onTap: widget.onForgotPasswordPressed,
            child: const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Забыли пароль?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
