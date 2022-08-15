part of 'coffee_bloc.dart';

///coffee state class is for all state on coffe_bloc
abstract class CoffeeState extends Equatable {
  const CoffeeState();

  @override
  List<Object> get props => [];
}

class CoffeeOnLoading extends CoffeeState {}
class CoffeeInitial extends CoffeeState {}
class CoffeeLoaded extends CoffeeState {
  final Coffee coffee;

  const CoffeeLoaded(this.coffee);
}

class CoffeeOnError extends CoffeeState{
  const CoffeeOnError();
}