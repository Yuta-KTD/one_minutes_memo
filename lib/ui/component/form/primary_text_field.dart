import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField(
      {super.key,
      required this.name,
      this.labelText,
      this.isMultiLineInput = false,
      this.hintText,
      this.errorText,
      this.validator,
      this.onChanged,
      this.keyboardType});

  final String name;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final FormFieldValidator? validator;
  final TextInputType? keyboardType;
  final bool isMultiLineInput;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        errorText: errorText,
      ),
      keyboardType: isMultiLineInput ? TextInputType.multiline : keyboardType,
      maxLines: isMultiLineInput ? 5 : 1,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
