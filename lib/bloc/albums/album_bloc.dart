// event, state=>new state=>updateUI

import 'dart:io';

import 'package:albumlist/api/exceptions.dart';
import 'package:albumlist/api/serrvices.dart';
import 'package:albumlist/bloc/albums/events.dart';
import 'package:albumlist/bloc/albums/states.dart';
import 'package:albumlist/model/albums_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumsBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumsRepo albumsRepo;

  AlbumsBloc({this.albumsRepo}) : super(AlbumsInitState());

  @override
  Stream<AlbumState> mapEventToState(AlbumEvent event) async* {
    switch (event) {
      case AlbumEvent.fetchAlbums:
        yield AlbumsLoading();

        try {
          List<Album> albumList;

          albumList = await albumsRepo.getAlbumList();
          yield AlbumsLoaded(albums: albumList);
        } on SocketException {
          yield AlbumListError(
              error: NoInternetException(message: 'No Internet'));
        } on HttpException {
          yield AlbumListError(
              error: NoServiceFoundException(message: 'No Service Found'));
        } on FormatException {
          yield AlbumListError(
              error:
                  InvalidFormatException(message: 'Invalid Response Format'));
        } catch (e) {
          yield AlbumListError(
              error: UnknownException(message: 'Unknown Error'));
        }

        break;
    }
  }
}
