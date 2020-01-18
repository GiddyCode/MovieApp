import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:movie/actions/adapt.dart';
import 'package:movie/style/test_inherited_widget.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(TestState state, Dispatch dispatch, ViewService viewService) {
  return Center(
      child: Column(
    children: <Widget>[
      SizedBox(height: Adapt.px(200)),
      Text(
        '${TestInheritedWidget.of(viewService.context).counter.value}',
        key:
            ValueKey(TestInheritedWidget.of(viewService.context).counter.value),
      ),
      SizedBox(height: Adapt.px(100)),
      FlatButton(
        color: Colors.amber,
        onPressed: () {
          TestInheritedWidget.of(viewService.context).counter.value++;
          dispatch(TestActionCreator.onAction(2));
        },
        child: Text('add'),
      )
    ],
  ));
}
