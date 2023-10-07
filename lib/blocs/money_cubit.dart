import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../Model/transaction_model.dart';
import '../service/shared_prefrence_helper.dart';

part 'money_state.dart';

class MoneyCubit extends Cubit<MoneyState> {
  MoneyCubit() : super(MoneyInitial());

  static MoneyCubit get(context) => BlocProvider.of(context);

  List<dynamic> products = [
    TransactionModel(
        categoryImage: "assets/images/vegetables.png",
        category: "Tesco",
        price: 8.99),
    TransactionModel(
        categoryImage: "assets/images/pet_shop.png",
        category: "Pet Shop",
        price: 11.30),
    TransactionModel(
        categoryImage: "assets/images/vegetables.png",
        category: "Toms Vegetables",
        price: 3.19),
    TransactionModel(
        categoryImage: "assets/images/vegetables.png",
        category: "Tesco",
        price: 13.45),
    TransactionModel(
        categoryImage: "assets/images/bakery.png",
        category: "Cakes&Donuts",
        price: 11.40),
    TransactionModel(
        categoryImage: "assets/images/pharmacy.png",
        category: "Pharmacy",
        price: 3.19),
  ];

  double total = 0;

  void addToProducts(String product, double price, String image) {
    final newProduct = TransactionModel(
      categoryImage: image,
      category: product,
      price: price,
    );

    products.add(newProduct);
    emit(AddToProductsState());

    total = products.fold<double>(0.0, (sum, product) => sum + product.price);
    SharedPreferenceHelper.saveData(key: 'total', value: total);
  }

  void resetTotalAndRemoveFromSharedPreferences() {
    total = 0;
    emit(TotalState());
    SharedPreferenceHelper.removeData(key: 'total');
  }

  double balance = 2000;
}
