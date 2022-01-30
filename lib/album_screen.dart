// ignore_for_file: avoid_print

import 'package:albumlist/bloc/albums/album_bloc.dart';
import 'package:albumlist/bloc/albums/events.dart';
import 'package:albumlist/bloc/albums/states.dart';
import 'package:albumlist/model/albums_list.dart';
import 'package:albumlist/widgets/error.dart';
import 'package:albumlist/widgets/list_row.dart';
import 'package:albumlist/widgets/loading.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({Key key}) : super(key: key);

  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }

  _loadAlbums() async {
    BlocProvider.of<AlbumsBloc>(context).add(AlbumEvent.fetchAlbums);

    //context.bloc<AlbumsBloc>().add(AlbumEvent.fetchAlbums);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Album List"),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<AlbumsBloc, AlbumState>(
          builder: (BuildContext context, state) {
            try {
              if (state is AlbumListError) {
                final error = state.error;
                String message = '${error.message}\nTap to Retry';
                return Errortxt(
                  message: message,
                  onTap: _loadAlbums,
                );
              }
              if (state is AlbumsLoaded) {
                List<Album> albums = state.albums;
                return _list(albums);
              }
            } catch (e) {
              print(e.toString());
            }

            return const Loading();
          },
        )
      ],
    );
  }

  Widget _list(List<Album> albums) {
    return Expanded(
      child: ListView.builder(
          itemCount: albums.length,
          itemBuilder: (_, index) {
            Album album = albums[index];
            return ListRow(album: album);
          }),
    );
  }
}
