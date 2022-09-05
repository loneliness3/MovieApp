import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:movies/screens.dart/second_scr.dart';

class HomeScr extends StatefulWidget {
  const HomeScr({Key? key}) : super(key: key);

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  var chosenMovies;
  var movieList = ["Top Rated", "Now Playing", "Popular", "Upcoming"];
  var apiMovieList = ["top_rated", "now_playing", "popular", "upcoming"];
  var selectedCategory = "top_rated";
  var selectedCategoryList = [];

  getMovies() async {
    var url =
        'https://api.themoviedb.org/3/movie/$selectedCategory?api_key=baf68249c9e2d043a418e39e7a8e5d67&language=en-US';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw ("An error occured");
    }
  }

  getCategory() async {
    var category = await getMovies();
    setState(() {
      selectedCategoryList = category['results'];
    });
    // print(selectedCategoryList);
    //  setState(() {
    //     txt =
    //       selectedCategoryList[0]['original_title'];
    //  });
  }

  @override
  Widget build(BuildContext context) {
    getCategory();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.grey.shade900,
        title: Text(
          'Cinema On your phone',
          style: GoogleFonts.adventPro(),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.grey.shade900,
              Colors.grey.shade800,
              Colors.grey.shade400,
              Colors.grey.shade500,
              Colors.grey.shade600,
              Colors.grey.shade900
            ])),
        child: Column(
          children: [
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movieList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        child: GridTile(
                          child: Text(
                            movieList[index],
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedCategory = apiMovieList[index];
                      });
                    },
                  );
                },
              ),
            ),
            Container(
              height: 500,
              child: ListView.builder(
                itemCount: selectedCategoryList.length,
                itemBuilder: ((context, j) {
                  return Container(
                    height: 300,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/second_screen');                          
                        },
                        child: ListTile(
                          title: Row(
                            children: [
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                      'https://image.tmdb.org/t/p/w500${selectedCategoryList[j]['poster_path']}'),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      selectedCategoryList[j]['original_title'],
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                        "Released on: ${selectedCategoryList[j]['release_date']}"),
                                    Text(
                                        "Popularity: ${selectedCategoryList[j]['popularity']}"),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
