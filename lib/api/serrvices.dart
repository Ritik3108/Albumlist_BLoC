// ignore_for_file: constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/albums_list.dart';

abstract class AlbumsRepo {
  Future<List<Album>> getAlbumList();
}

class AlbumServices implements AlbumsRepo {
  static const _baseURL = 'jsonplaceholder.typicode.com';
  static const String get_albums = '/albums';

  @override
  Future<List<Album>> getAlbumList() async {
    Uri uri = Uri.https(_baseURL, get_albums);

    Response response = await http.get(uri);
    List<Album> albums = albumFromJson(response.body);
    return albums;
  }
}
