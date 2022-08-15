import 'package:http/http.dart' as http;
import 'dart:async';

class Networks {
  ///example of base url to fetch coffee api
  final String _baseUrl = 'https://api.sampleapis.com/coffee/';
  ///set timeout duration
  final int _duration = 45;

  ///create method get data
  Future get({required endpoint}) async {
    try {
      final response = await http
          .get(
            Uri.parse(_baseUrl + endpoint),
          )
          .timeout(
            Duration(seconds: _duration),
          );
     // print(response.body);
      if(response.statusCode==200){
        return response.body;
      }else{
        return false;
      }
    } on TimeoutException catch (e) {
      return false;
    }
  }
}

var network = Networks();
