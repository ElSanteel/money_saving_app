import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_prefrence_session/screens/login_screen.dart';
import 'package:shared_prefrence_session/service/shared_prefrence_helper.dart';

import '../blocs/money_cubit.dart';
import '../components/custom_text_field.dart';
import '../core/size_config.dart';
import 'congrats_screen.dart';

class MoneyTrackerScreen extends StatefulWidget {
  const MoneyTrackerScreen({super.key});

  @override
  State<MoneyTrackerScreen> createState() => _MoneyTrackerScreenState();
}

class _MoneyTrackerScreenState extends State<MoneyTrackerScreen> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var imageController = TextEditingController();

  late MoneyCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = MoneyCubit.get(context);

    cubit.total = SharedPreferenceHelper.getData(key: 'total') ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoneyCubit, MoneyState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MoneyCubit.get(context);

        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Hi Mo",
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
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {
                            SharedPreferenceHelper.removeData(key: "Email");
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (route) => false,
                            );
                            cubit
                                .resetTotalAndRemoveFromSharedPreferences(); // Reset the total and remove it from SharedPreferences when logging out
                          },
                          icon: const Icon(Icons.logout),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Your balance",
                      style: TextStyle(
                          fontSize: 22,
                          color: Color(0xff656576),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'YoungSerif'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: SizeConfig.screenWidth! * 0.9,
                      height: SizeConfig.screenHeight! * 0.1,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(35)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "\$ ${cubit.balance}",
                            style: const TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Row(
                      children: [
                        Text(
                          "You've already spent",
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff656576),
                              fontWeight: FontWeight.bold,
                              fontFamily: 'YoungSerif'),
                        ),
                        Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          height: SizeConfig.screenHeight! * 0.1,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(35)),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 100,
                              ),
                              Image.asset("assets/images/money.png",
                                  width: SizeConfig.screenWidth! * 0.11),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                "\$${cubit.total.toStringAsFixed(2)}",
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
                    const Row(
                      children: [
                        Text(
                          "and there's still 18 days left until payday",
                          style: TextStyle(
                              fontSize: 19,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        text: "enter your category",
                        controller: nameController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        text: "enter your price", controller: priceController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        text: "enter your Image Path",
                        controller: imageController),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: SizeConfig.screenWidth! * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xff7cbf86)),
                          child: MaterialButton(
                            onPressed: () {
                              cubit.addToProducts(
                                  nameController.text,
                                  double.parse(priceController.text),
                                  imageController.text);
                              cubit.total += num.parse(priceController.text);
                              SharedPreferenceHelper.saveData(
                                  key: 'total', value: cubit.total);
                            },
                            child: const Text("Add",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                        ),
                        Container(
                          width: SizeConfig.screenWidth! * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: const Color(0xff7cbf86)),
                          child: MaterialButton(
                            onPressed: () {
                              double difference = cubit.balance -
                                  cubit.total; // Calculate the difference

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CongratsScreen(
                                          difference: difference)));
                            },
                            child: const Text(
                              "Next",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
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
                                    cubit.products[index].categoryImage,
                                    width: SizeConfig.screenWidth! * 0.1,
                                    height: SizeConfig.screenHeight! * 0.05,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    " ${cubit.products[index].category}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 48,
                                  ),
                                  Text(
                                    "-\$ ${cubit.products[index].price}",
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
