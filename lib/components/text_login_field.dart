import 'package:flutter/material.dart';
class TextLoginField extends StatelessWidget{
  var icon ;
  String text ;
  var validator ;
  var controller;

  TextLoginField(this.icon, this.text, this.controller,this.validator,{super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        validator: validator,
        textDirection: TextDirection.ltr,
        style: const TextStyle(fontSize: 15),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: Colors.grey,)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.green.shade200)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),
              borderSide:const BorderSide(color: Colors.red,)),
          suffixIcon: Icon(icon , color: Colors.grey,),
          hintText: text ,
          hintTextDirection: TextDirection.ltr,

        ),

      ),
    );
  }
}