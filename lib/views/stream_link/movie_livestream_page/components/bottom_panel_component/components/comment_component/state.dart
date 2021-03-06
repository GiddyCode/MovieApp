import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/base_api_model/movie_comment.dart';
import 'package:movie/views/stream_link/movie_livestream_page/components/bottom_panel_component/state.dart';

class CommentState implements Cloneable<CommentState> {
  MovieComments comments;
  ScrollController scrollController;
  bool isBusy;
  int movieId;
  int episode;
  int season;

  @override
  CommentState clone() {
    return CommentState()
      ..comments = comments
      ..season = season
      ..episode = episode
      ..movieId = movieId
      ..isBusy = isBusy
      ..scrollController = scrollController;
  }
}

class CommentConnector extends ConnOp<BottomPanelState, CommentState> {
  @override
  CommentState get(BottomPanelState state) {
    CommentState mstate = state.commentState;
    mstate.movieId = state.movieId;
    mstate.season = state.season;
    mstate.episode = state.selectEpisode;
    return mstate;
  }

  @override
  void set(BottomPanelState state, CommentState subState) {
    state.commentState = subState;
  }
}
