import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Mytextcomponet extends StatelessWidget {
  final String? hint ;
  final TextEditingController? controller;
 final List<TextInputFormatter>? inputFormatters;
 final String? Function(String?)? validator ;
 final Widget? prefixIcon ;
 final Widget? suffixIcon;
 final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;

  const Mytextcomponet({Key? key,
   this.hint,
    this.controller,
    this.inputFormatters,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength ,
    this.keyboardType,
    this.obscureText =false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
     controller: controller,
      inputFormatters: inputFormatters,
      validator: validator,
      maxLength:maxLength,
        obscureText: obscureText,

        decoration: InputDecoration(
        counterText: "",
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        focusedBorder:OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey,width: 2),
          borderRadius: BorderRadius.circular(15)
        ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade300,width: 2),
              borderRadius: BorderRadius.circular(15),
          ),

          focusedErrorBorder:  OutlineInputBorder(
            borderSide: BorderSide( color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),

          enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black,width: 2),
        )
      ),

    ) ;
  }
}
