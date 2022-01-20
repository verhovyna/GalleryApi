import 'package:http/http.dart' as http;

class Api {
  String _baseUrl = 'https://api.unsplash.com/photos/';
  String _clientId =
      '896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043';
      
  Future getData() async {
    return await http.get('$_baseUrl?client_id=$_clientId');
  }
}
