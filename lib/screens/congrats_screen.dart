import 'package:flutter/material.dart';
import 'package:shared_prefrence_session/core/size_config.dart';

class CongratsScreen extends StatelessWidget {
  final double difference; // Receive the difference as a parameter

  const CongratsScreen({Key? key, required this.difference}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/congrats.png",
              width: 200,
            ),
            const Text(
              'Congratulations!',
              style: TextStyle(fontSize: 30),
            ),
            const Text(
              'This month you\'ve saved ',
              style: TextStyle(fontSize: 25),
            ),
            Container(
              width: SizeConfig.screenWidth! * 0.4,
              height: SizeConfig.screenHeight! * 0.07,
              decoration: BoxDecoration(
                  color: const Color(0xfff9f9f9),
                  border: Border.all(width: 0.05),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.verified,
                    color: Colors.blueAccent,
                    size: 45,
                  ),
                  Text(
                    "\$${difference.toStringAsFixed(2)}",
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Go to dashboard",
                  style: TextStyle(fontSize: 25, color: Color(0xffc3c4c6)),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_forward,
                      size: 20, color: Color(0xffc3c4c6)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
