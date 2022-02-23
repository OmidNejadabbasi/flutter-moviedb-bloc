import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/data/json/movie_collection_json.dart';
import 'package:movies_app/data/json/movie_json.dart';
import 'package:movies_app/data/repository/movie_repo.dart';
import 'package:movies_app/presentation/screen/home_screen/home_screen_actions.dart';
import 'package:movies_app/presentation/screen/home_screen/home_screen_bloc.dart';
import 'package:movies_app/presentation/screen/home_screen/home_screen_state.dart';
import 'package:movies_app/presentation/screen/movie_detail_screen/movie_detail_screen.dart';
import 'package:movies_app/presentation/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenBloc _bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bloc = HomeScreenBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie land'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: StreamBuilder(
        stream: _bloc.listState,
        builder: (context, snapshot) {
          switch (snapshot.data.runtimeType) {
            case LoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case MoviesLoaded:
              return _buildListView((snapshot.data as MoviesLoaded).moviesList);

            case HasErrorState:
              return Center(
                child: Column(
                  children: [
                    const Text('Error in fetching data from server'),
                    const SizedBox(
                      height: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          _bloc.actions.add(ReloadMovies());
                        },
                        icon: const Icon(Icons.restart_alt))
                  ],
                ),
              );
          }
          return const Text("State not handled");
        },
      ),
    );
  }

  Widget _buildListView(MovieCollectionJson moviesList) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return GridView.builder(
      itemCount: moviesList.results!.length,
      itemBuilder: (context, index) {
        return _buildListItem(moviesList.results![index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          childAspectRatio: 0.52),
    );
  }

  Widget _buildListItem(MovieJson movieJson) {
    var placeholderImg = Image.asset("assets/images/ph.png");
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
      elevation: 3,
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .pushNamed(MovieDetailScreen.route, arguments: movieJson),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: movieJson.posterPath!.isEmpty
                  ? placeholderImg
                  : Image.network(
                      MovieRepository.getFullImageURL(movieJson.posterPath!),
              fit: BoxFit.fitHeight,),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieJson.title ?? "-No title-",
                    style: boldBaseStyle,
                  ),
                  const SizedBox(height: 5),
                  Text("Score: ${movieJson.popularity?.toStringAsFixed(1)}"),
                  const SizedBox(height: 3),
                  Text(
                    "Language: ${movieJson.originalLanguage?.toUpperCase()}",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
