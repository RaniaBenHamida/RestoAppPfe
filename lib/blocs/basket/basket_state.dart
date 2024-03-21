import 'package:equatable/equatable.dart';
import 'package:flutter_app_resto/models/basket_model.dart';

abstract class BasketState extends Equatable {
  const BasketState();

  @override
  List<Object> get props => [];
}

class BasketLoading extends BasketState {
  @override
  List<Object> get props => [];
}

class BasketLoaded extends BasketState {
  final Basket basket;

  BasketLoaded({required this.basket});


  @override
  List<Object> get props => [basket];
}
