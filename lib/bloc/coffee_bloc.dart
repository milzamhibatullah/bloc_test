import 'package:bloc_test/api/coffee_api.dart';
import 'package:bloc_test/models/coffee.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coffee_state.dart';

part 'coffee_event.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  CoffeeBloc() : super(CoffeeOnLoading()) {
    final CoffeeApi api = CoffeeApi();
    on<GetCoffeeEvent>((event, emit) async {
     try{
       final coffees = await api.fetchCoffees();
       emit(
         CoffeeLoaded(coffees),
       );
     }catch(e){
       emit(const CoffeeOnError());
     }
    });

    on<RefreshCoffeeEvent>((event,emit)async{
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
