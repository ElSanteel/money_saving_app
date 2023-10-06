import 'package:flutter/material.dart';

import '../core/size_config.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(this.name, this.price, this.fun, {Key? key})
      : super(key: key);
  TextEditingController imageName = TextEditingController(); // Add this field

  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();

  VoidCallback fun;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: name,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter name',
              errorText: validateName(name.text), // Add error handling
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: price,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Enter Price',
              errorText: validatePrice(price.text),
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.9,
          height: SizeConfig.screenHeight! * 0.04,
          child: ElevatedButton(
            onPressed: fun,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            child: const Text("Add"),
          ),
        )
      ],
    );
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Please enter a name of your transaction';
    }
    return null;
  }

  String? validatePrice(String value) {
    if (value.isEmpty) {
      return 'Please enter a price';
    }
    return null;
  }
}
