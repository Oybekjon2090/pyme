import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';



class CustomTextFrom extends StatelessWidget {
  final String hintext;
  final Widget? suffixicon;
  final Icon? perfixicon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final String? label;
  final ValueChanged<String>? onChange;
  final String? obscuringCharacter;
  final bool isObscure;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator? validator;
  final FocusNode? node;
  final TextStyle? style;
  final List<TextInputFormatter>? format;

  const CustomTextFrom(
      {Key? key,
      required this.hintext,
      this.keyboardType = TextInputType.text,
      this.suffixicon,
      this.label,
      this.onChange,
      this.perfixicon,
      this.controller,
      this.obscuringCharacter,
      required this.isObscure,
      this.fillColor,
      this.filled,
      this.validator,
      this.node,
      this.style,
      this.format})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        inputFormatters: format,
        onChanged: onChange,
        style: style,
        validator: validator,
        focusNode: node,
        keyboardType: keyboardType,
        
        controller: controller,
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: filled,
          
              
          prefix: perfixicon,
          // suffix: suffixicon,
          label: Text('$label'),
          
          hintText: hintext,
          // contentPadding:
          //     const EdgeInsets.only(left: 24, right: 80, top: 12, bottom: 12),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),

          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffAFB0B6),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xffAFB0B6),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
