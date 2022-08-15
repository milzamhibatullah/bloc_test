import 'package:bloc_test/bloc/coffee_bloc.dart';
import 'package:bloc_test/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final CoffeeBloc _bloc = CoffeeBloc();

  @override
  void initState() {
    _bloc.add(GetCoffeeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: BlocProvider(
            create: (_) => _bloc,
            child: BlocBuilder<CoffeeBloc, CoffeeState>(
              builder: (context, state) {
                if (state is CoffeeOnLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CoffeeLoaded) {
                  return RefreshIndicator(
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                          child: ListView.builder(
                        itemBuilder: (context, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 20.0, horizontal: 20.0),
                          child: Text(
                              state.coffee.coffees![index].title.toString()),
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.coffee.coffees!.length,
                      )),
                      onRefresh: () async => _bloc.add(RefreshCoffeeEvent()));
                } else if (state is CoffeeOnError) {
                  return Container(
                    color: Colors.blue,
                  );
                } else {
                  return Container(
                    color: Colors.blue,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
