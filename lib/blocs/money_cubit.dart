import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'money_state.dart';

class MoneyCubit extends Cubit<MoneyState> {
  MoneyCubit() : super(MoneyInitial());

  static MoneyCubit get(context) => BlocProvider.of(context);

  List products = [
    {
      "imagePath": "assets/images/vegetables.png",
      "name": "Tesco",
      "price": 8.99
    },
    {
      "imagePath": "assets/images/pet_shop.png",
      "name": "Pet Shop",
      "price": 11.30
    },
    {
      "imagePath": "assets/images/vegetables.png",
      "name": "Toms Vegetables",
      "price": 3.19
    },
    {
      "imagePath": "assets/images/vegetables.png",
      "name": "Tesco",
      "price": 13.45
    },
    {"imagePath": "assets/images/bakery.png", "name": "Bakery", "price": 8.99},
    {
      "imagePath": "assets/images/bakery.png",
      "name": "Cakes&Donuts",
      "price": 11.40
    },
    {
      "imagePath": "assets/images/pharmacy.png",
      "name": "Pharmacy",
      "price": 3.19
    },
  ];

  void addToProducts(String imagePath, String name, double price) {
    products.add({"imagePath": imagePath, "name": name, "price": price});
    emit(AddToProductsState());
  }

  double calculateTotal() {
    double total = 0;
    for (var product in products) {
      total += product['price'];
    }
    return total;
  }
}
