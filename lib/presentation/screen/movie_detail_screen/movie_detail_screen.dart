import 'package:flutter/material.dart';
import 'package:movies_app/data/json/movie_detail_json.dart';
import 'package:movies_app/data/json/movie_json.dart';
import 'package:movies_app/data/repository/movie_repo.dart';
import 'package:movies_app/presentation/screen/movie_detail_screen/movie_detail_actions.dart';
import 'package:movies_app/presentation/screen/movie_detail_screen/movie_detail_bloc.dart';
import 'package:movies_app/presentation/screen/movie_detail_screen/movie_detail_state.dart';
import 'package:movies_app/presentation/styles.dart';
import 'package:movies_app/shared/widget/round_border_text.dart';

class MovieDetailScreen extends StatefulWidget {
  static const String route = '/mov_detail';

  const MovieDetailScreen({Key? key, required this.movieJson})
      : super(key: key);

  final MovieJson movieJson;

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = MovieDetailBloc();
    _bloc.actions.add(LoadMovieDetail(widget.movieJson.id!));
  }

  @override
  Widget build(BuildContext context) {
    var placeholderImg = Image.asset("assets/images/ph.png");

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            var screenW = MediaQuery.of(context).size.width;
            return <Widget>[
              SliverAppBar(
                  expandedHeight: screenW * (12 / 9),
                  backgroundColor: Colors.black,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    title: Text(widget.movieJson.title ?? "-no-title",
                        style: baseTextStyle.copyWith(fontSize: 18)),
                    background: widget.movieJson.posterPath!.isEmpty
                        ? placeholderImg
                        : Image.network(MovieRepository.getFullImageURL(
                            widget.movieJson.posterPath!)),
                  ))
            ];
          },
          body: StreamBuilder(
            stream: _bloc.state,
            builder: (context, snapshot) {
              switch (snapshot.data.runtimeType) {
                case DetailLoadingState:
                  return Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  );

                case MovieDetailLoaded:
                  return _buildDetailUI(
                      (snapshot.data as MovieDetailLoaded).moviesDetail);
              }
              return const Text("Error in handling all states");
            },
          )),
    );
  }

  Widget _buildDetailUI(MovieDetailJson data) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "Overview: ",
              style: boldBaseStyle.copyWith(
                color: Colors.grey[800]!,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                    text: data.overview ?? "NO DATA",
                    style: baseTextStyle.copyWith(fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 3,
            children: [
              const Text("Genres: "),
              ...data.genres!.map((e) => RoundBorderText(e)).toList(),
            ],
          ),
          const SizedBox(height: 4),
          Text(
              "Reviews:   ${data.voteAverage?.toStringAsFixed(1)}  (${data.voteCount})"),
        ],
      ),
    );
  }
}
