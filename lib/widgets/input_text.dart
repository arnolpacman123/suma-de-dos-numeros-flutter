import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.numeroController,
    required this.labelText,
  }) : super(key: key);

  final TextEditingController? numeroController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: numeroController,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: labelText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }
}
