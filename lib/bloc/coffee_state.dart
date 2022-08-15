part of 'coffee_bloc.dart';

abstract class CoffeeState extends Equatable {
  const CoffeeState();

  @override
  List<Object> get props => [];
}

class CoffeeOnLoading extends CoffeeState {}

class CoffeeLoaded extends CoffeeState {
  final Coffee coffee;

  const CoffeeLoaded(this.coffee);
}

class CoffeeOnError extends CoffeeState{
  const CoffeeOnError();
}