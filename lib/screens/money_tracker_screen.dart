import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_prefrence_session/screens/login_screen.dart';
import 'package:shared_prefrence_session/service/shared_prefrence_helper.dart';

import '../blocs/money_cubit.dart';
import '../components/custom_text_field.dart';
import '../core/size_config.dart';
import 'congrats_screen.dart';

class MoneyTrackerScreen extends StatelessWidget {
  const MoneyTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var name = TextEditingController();
    var price = TextEditingController();
    var imageName = TextEditingController();
    return BlocConsumer<MoneyCubit, MoneyState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MoneyCubit.get(context);
        // Calculate the total amount spent
        double total = cubit.calculateTotal();
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CongratsScreen()),
              );
            },
            child: const Icon(Icons.arrow_forward),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Hi Jim",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color(0xff686a76),
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(flex: 1),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.settings),
                          color: const Color(0xff686a76),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more,
                            color: Color(0xff686a76),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          "You've already spent",
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff656576),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'YoungSerif'),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              SharedPrefrenceHelper.removeData(key: "Email");
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                  (route) => false);
                            },
                            icon: const Icon(Icons.logout))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Container(
                          width: SizeConfig.screenWidth! * 0.42,
                          height: SizeConfig.screenHeight! * 0.1,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(35)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset("assets/images/money.png",
                                  width: SizeConfig.screenWidth! * 0.11),
                              Text(
                                "\$${total.toStringAsFixed(1)}",
                                style: const TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth! * 0.9,
                      child: const Text(
                        "and there's still 18 days left until payday",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    CustomTextField(name, price, () {
                      cubit.addToProducts(
                          "$imageName", name.text, double.parse(price.text));
                      print("ADD");
                    }),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        Text(
                          "Recent Transactions",
                          style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff656576),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'YoungSerif'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      height: SizeConfig.screenHeight! * 0.4,
                      child: ListView.builder(
                        itemCount: cubit.products.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    cubit.products[index]['imagePath'],
                                    width: SizeConfig.screenWidth! * 0.1,
                                    height: SizeConfig.screenHeight! * 0.05,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    " ${cubit.products[index]['name']}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 48,
                                  ),
                                  Text(
                                    "-\$ ${cubit.products[index]['price']}",
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
