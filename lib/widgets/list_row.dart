// ignore_for_file: use_key_in_widget_constructors

import 'package:albumlist/model/albums_list.dart';
import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  final Album album;
  const ListRow({this.album});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${album.userId}'),
          Text(
            album.title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
