// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:albumlist/model/albums_list.dart';
import 'package:equatable/equatable.dart';

abstract class AlbumState extends Equatable {
  @override
  List<Object> get props => [];
}

class AlbumsInitState extends AlbumState {}

class AlbumsLoading extends AlbumState {}

class AlbumsLoaded extends AlbumState {
  final List<Album> albums;
  AlbumsLoaded({this.albums});
}

class AlbumListError extends AlbumState {
  final error;
  AlbumListError({this.error});
}
