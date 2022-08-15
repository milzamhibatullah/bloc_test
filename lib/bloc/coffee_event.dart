
part of 'coffee_bloc.dart';
abstract class CoffeeEvent extends Equatable{
  const CoffeeEvent();

}

class GetCoffeeEvent extends CoffeeEvent{
  @override
  List<Object?> get props => [];
}

class RefreshCoffeeEvent extends CoffeeEvent{
  @override
  List<Object?> get props => [];

}