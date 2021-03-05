import 'package:flutter/material.dart';
import 'provider.dart';
import 'moviemodel.dart';

void main() => runApp(MoviesApp());

class MoviesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MoviesListing(),
    );
  }
}

class MoviesListing extends StatefulWidget {
  @override
  _MoviesListingState createState() => _MoviesListingState();
}

class _MoviesListingState extends State<MoviesListing> {
  //Variable to hold movies information
  List<MovieModel> movies = List<MovieModel>();

  //Method to fetch movies from network
  fetchMovies() async {
    //Getting json
    var data = await MoviesProvider.getJson();

    setState(() {
      List<dynamic> results = data['results'];
      results.forEach((element) {
        movies.add(MovieModel.fromJson(element));
      });
    });
  }

  @override
  void initState() {
    super.initState();

    //Fetch movies
    fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    print("Tenemos ${movies.length} pelis");

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Recommended Films",
          ),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: Center(
            child: ListView.builder(
          padding: EdgeInsets.symmetric(
              vertical: (MediaQuery.of(context).size.height / 5)),
          scrollDirection: Axis.horizontal,
          //Calculating number of items using `movies` variable
          itemCount: movies == null ? 0 : movies.length,
          //Passing widget handle as `context`, and `index` to process one item at a time
          itemBuilder: (context, index) {
            return Container(
                padding: const EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width * 0.5,
                child: MovieTile(movies, index));
          },
        )));
  }
}

class MovieTile extends StatelessWidget {
  final List<MovieModel> movies;
  final index;

  const MovieTile(this.movies, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Resizing image poster based on the screen size whenever image's path is not null.
        movies[index].poster_path != null
            ? GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text(movies[index].title),
                            content: Text(movies[index].overview));
                      });
                },
                child: Container(
                  //Making image's width to half of the given screen size
                  width: MediaQuery.of(context).size.width / 1.7,

                  //Making image's height to one fourth of the given screen size
                  height: MediaQuery.of(context).size.height / 2.5,

                  //Making image box visually appealing by dropping shadow
                  decoration: BoxDecoration(
                    //Making image box slightly curved
                    borderRadius: BorderRadius.circular(10.0),
                    //Setting box's color to grey
                    color: Colors.grey,

                    //Decorating image
                    image: DecorationImage(
                        image: NetworkImage(MoviesProvider.imagePathPrefix +
                            movies[index].poster_path),
                        //Image getting all the available space
                        fit: BoxFit.cover),

                    //Dropping shadow
                    boxShadow: [
                      BoxShadow(
                          //grey colored shadow
                          color: Colors.grey,
                          //Applying softening effect
                          blurRadius: 3.0,
                          //move 1.0 to right (horizontal), and 3.0 to down (vertical)
                          offset: Offset(1.0, 3.0)),
                    ],
                  ),
                ))
            : GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: Text(movies[index].title),
                            content: Text(movies[index].overview));
                      });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movies[index].title,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ), //Empty container when image is not available
                ),
              ),
      ],
    );
  }
}
