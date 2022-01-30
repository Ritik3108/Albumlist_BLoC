import 'package:albumlist/album_screen.dart';
import 'package:albumlist/api/serrvices.dart';
import 'package:albumlist/bloc/albums/album_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Album List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (context) => AlbumsBloc(albumsRepo: AlbumServices()),
          child: const AlbumScreen()),
    );
  }
}
