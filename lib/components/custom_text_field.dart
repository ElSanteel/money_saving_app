import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String text;
  var controller;
  CustomTextField({this.controller, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textDirection: TextDirection.ltr,
      style: const TextStyle(fontSize: 15, color: Colors.black),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.grey,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: Colors.grey)),
        hintText: text,
        hintStyle: const TextStyle(fontSize: 15),
        hintTextDirection: TextDirection.ltr,
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// import '../core/size_config.dart';
//
// class CustomTextFields extends StatelessWidget {
//   CustomTextFields(this.name, this.price, this.image, this.onAddPressed,
//       {super.key});
//   var name = TextEditingController();
//   var price = TextEditingController();
//   var image = TextEditingController();
//   VoidCallback onAddPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextFormField(
//             controller: image,
//             decoration: InputDecoration(
//               border: const OutlineInputBorder(),
//               hintText: 'Enter image path',
//               errorText: validateImage(image.text),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextFormField(
//             controller: name,
//             keyboardType: TextInputType.text,
//             decoration: InputDecoration(
//               border: const OutlineInputBorder(),
//               hintText: 'Enter name',
//               errorText: validateName(name.text),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextFormField(
//             controller: price,
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//               border: const OutlineInputBorder(),
//               hintText: 'Enter Price',
//               errorText: validatePrice(price.text),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: SizeConfig.screenWidth! * 0.9,
//           height: SizeConfig.screenHeight! * 0.04,
//           child: ElevatedButton(
//             onPressed: onAddPressed,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.green,
//             ),
//             child: const Text("Add"),
//           ),
//         )
//       ],
//     );
//   }
//
//   String? validateName(String value) {
//     if (name.text.isEmpty) {
//       return 'Please enter a name of your transaction';
//     }
//     return null;
//   }
//
//   String? validatePrice(String value) {
//     if (price.text.isEmpty) {
//       return 'Please enter a price';
//     }
//     return null;
//   }
//
//   String? validateImage(String value) {
//     if (image.text.isEmpty) {
//       return 'Please enter the correct path';
//     }
//     return null;
//   }
// }
