import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String initialValue;
  final int maxLines;
  final ValueChanged<String> onChanged;

  const CustomTextFormField(
      {this.label, this.maxLines = 1, this.onChanged, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      style: const TextStyle(fontSize: 18.0),
      onChanged: onChanged,
      maxLines: maxLines,
      validator: (value) {
        if (value.trim().isEmpty) {
          return "Campo obrigatório";
        }
        return null;
      },
      decoration: InputDecoration(
        isDense: true,
        labelText: label,
        labelStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 18,
            letterSpacing: 0.5,
            fontWeight: FontWeight.w600),
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[500]),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
