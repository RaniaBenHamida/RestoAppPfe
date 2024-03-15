import 'package:flutter_app_resto/blocs/basket/basket_event.dart';
import 'package:flutter_app_resto/blocs/basket/basket_state.dart';
import 'package:flutter_app_resto/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading());

  @override
  Stream<BasketState> mapEventToState(
    BasketEvent event,
  ) async* {
    if (event is StartBasket) {
      yield* _mapStartBasketTostate();
    } else if (event is AddItem) {
      yield* _mapAddItemTostate(event, state);
    } 
    else if (event is RemoveAllItem) {
      yield* _mapRemoveAllItemTostate(event, state);
    } else if (event is ToggleSwitch) {
      yield* _mapToggleSwitchTostate(event, state);
    }
    else if (event is AddVoucher) {
      yield* _mapAddVoucherTostate(event, state);
    }
  }

  Stream<BasketState> _mapStartBasketTostate() async* {
    yield BasketLoading();
    try{
      await Future<void>.delayed(const Duration(seconds: 1));
      yield BasketLoaded(basket: Basket());
    } catch (_) {}
  }

  Stream<BasketState> _mapAddItemTostate(
    AddItem event,
    BasketState state,
  ) async* {
    if(state is BasketLoaded){
      try{
        yield BasketLoaded(basket: state.basket
        .copyWith(items: List.from(state.basket.items)
        ..add(event.item)));
      }catch(_) {}
    }
  }

  Stream<BasketState> _mapRemoveItemTostate(
    RemoveItem event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)..remove(event.item)));
      } catch (_) {}
    }
  }

  
  Stream<BasketState> _mapRemoveAllItemTostate(
    RemoveAllItem event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)..removeWhere((item)=> item == event.item),),);
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapToggleSwitchTostate(
    ToggleSwitch event,
    BasketState state,
  ) async* {
    if(state is BasketLoaded){
      try{
        yield BasketLoaded(basket: state.basket.copyWith(cutlery: !state.basket.cutlery,),
      );
      } catch (_) {}
    }
  }

  Stream<BasketState> _mapAddVoucherTostate(
    AddVoucher event,
    BasketState state,
  ) async* {
    if (state is BasketLoaded) {
      try {
        yield BasketLoaded(
          basket: state.basket.copyWith(voucher: event.voucher)
       
        );
      } catch (_) {}
    }
  }
}
