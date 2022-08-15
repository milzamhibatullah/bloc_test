
import 'dart:convert';

import 'package:bloc_test/models/coffee.dart';
import 'package:bloc_test/service/networks.dart';
import 'package:flutter/material.dart';

class CoffeeApi{

  /// get hot coffee
  Future<Coffee>fetchCoffees()async{
    try{
      var response = await network.get(endpoint: 'hot');
      print('refetch');
      if(response!=false){
        var encoded=jsonEncode({
          'coffees':jsonDecode(response)
        });
        return Coffee.fromJson(jsonDecode(encoded));
      }else{
        return Coffee.errorFetch();
      }

    }catch(e){
      debugPrint(e.toString());
      return Coffee.errorFetch();
      throw('error fetch coffee');
    }
  }
}