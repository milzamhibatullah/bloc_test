import 'package:bloc_test/api/coffee_api.dart';
import 'package:bloc_test/models/coffee.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coffee_state.dart';

part 'coffee_event.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  ///when this bloc calling, set initial loading;
  CoffeeBloc() : super(CoffeeInitial()) {
    final CoffeeApi api = CoffeeApi();
    ///metthod get coffee event
    on<GetCoffeeEvent>((event, emit) async {
     try{
       emit(CoffeeOnLoading());
       final coffees = await api.fetchCoffees();
       emit(
         CoffeeLoaded(coffees),
       );
     }catch(e){
       emit(const CoffeeOnError());
     }
    });

  }
}
