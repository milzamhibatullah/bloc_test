
part of 'coffee_bloc.dart';
///all event for coffe_bloc
abstract class CoffeeEvent extends Equatable{
  const CoffeeEvent();

}

class GetCoffeeEvent extends CoffeeEvent{
  @override
  List<Object?> get props => [];
}
