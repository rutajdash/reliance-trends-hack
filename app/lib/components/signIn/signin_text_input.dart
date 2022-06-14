import 'package:flutter/material.dart';

class SignInTextInput extends StatefulWidget {
  final IconData fieldIcon;
  final TextInputType textInputType;
  final TextEditingController textEditingController;

  const SignInTextInput({
    super.key,
    required this.fieldIcon,
    required this.textInputType,
    required this.textEditingController,
  });

  @override
  State<SignInTextInput> createState() => _SignInTextInputState();
}

class _SignInTextInputState extends State<SignInTextInput> {
  @override
  void dispose() {
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: Colors.white70,
      ),
      child: Row(children: [
        Container(
            height: 32,
            width: 32,
            margin: const EdgeInsets.only(right: 8),
            child: Icon(widget.fieldIcon)),
        Flexible(
            fit: FlexFit.loose,
            child: TextField(
              decoration: null,
              controller: widget.textEditingController,
              keyboardType: widget.textInputType,
              obscureText:
                  (widget.textInputType == TextInputType.visiblePassword),
              obscuringCharacter: '•',
            )),
      ]),
    );
  }
}
