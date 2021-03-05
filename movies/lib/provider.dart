import 'package:http/http.dart' as http;
import 'dart:convert';

class MoviesProvider {
  static final String imagePathPrefix = 'https://image.tmdb.org/t/p/w500/';

  static Future<Map> getJson() async {
   //API Key. Don't forget to replace it with your own key.
   final apiKey = "f06e210ed0907e5b80b74cd75b847830";
   
   //URL to fetch movies by their popularity
   final apiEndPoint =
       "http://api.themoviedb.org/3/discover/movie?api_key=${apiKey}&sort_by=popularity.desc";

   //Response returned from API/Server
   final apiResponse = await http.get(apiEndPoint);

   //Parsing to JSON using dart:convert
   return json.decode(apiResponse.body); 
 }
}