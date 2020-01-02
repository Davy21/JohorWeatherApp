import 'package:http/http.dart';

class HttpClient {
  final String url;
  final String authToken;

  HttpClient({this.url,this.authToken}):assert(url != null,authToken != null);

  Future getData() async {
    print("call GET api");
    Response response = await get(url,headers: {"Authorization": authToken});

    if(response.statusCode == 200){
      return response.body;
    }
    else{
      print(response.statusCode);
    }
  }
}