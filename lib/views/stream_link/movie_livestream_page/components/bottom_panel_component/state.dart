import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/base_api_model/movie_stream_link.dart';
import 'package:movie/views/stream_link/movie_livestream_page/state.dart';
import 'package:movie/widgets/overlay_entry_manage.dart';

import 'components/comment_component/state.dart';

class BottomPanelState implements Cloneable<BottomPanelState> {
  MovieStreamLinks streamLinks;
  MovieStreamLink selectedLink;
  CommentState commentState;
  GlobalKey<OverlayEntryManageState> overlayStateKey;
  bool useVideoSourceApi;
  bool streamInBrowser;
  bool userLiked;
  int likeCount;
  int movieId;
  int season;
  int commentCount;
  int selectEpisode;
  @override
  BottomPanelState clone() {
    return BottomPanelState()
      ..movieId = movieId
      ..season = season
      ..userLiked = userLiked
      ..useVideoSourceApi = useVideoSourceApi
      ..streamInBrowser = streamInBrowser
      ..likeCount = likeCount
      ..streamLinks = streamLinks
      ..selectedLink = selectedLink
      ..commentCount = commentCount
      ..selectEpisode = selectEpisode
      ..commentState = commentState
      ..overlayStateKey = overlayStateKey;
  }
}

class BottomPanelConnector
    extends ConnOp<MovieLiveStreamState, BottomPanelState> {
  @override
  BottomPanelState get(MovieLiveStreamState state) {
    BottomPanelState mstate = state.bottomPanelState.clone();
    mstate.streamLinks = state.streamLinks;
    mstate.selectedLink = state.selectedLink;
    mstate.commentCount =
        state.bottomPanelState.commentState.comments?.totalCount ?? 0;
    return mstate;
  }

  @override
  void set(MovieLiveStreamState state, BottomPanelState subState) {
    state.bottomPanelState = subState;
    state.selectedLink = subState.selectedLink;
  }
}
