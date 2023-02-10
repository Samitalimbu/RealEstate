import 'package:first/data_source/local_data_source/user_data_source.dart';
import 'package:first/data_source/remote_data_source/location_remote_data_source.dart';
import 'package:first/model/locations.dart';

import '../data_source/user_remote_data_source.dart';
import '../model/user.dart';

abstract class LocationRepository {
  Future<List<Location>> getLocationBasedOnSearch(String text);
}

class LocationRepositoryImpl extends LocationRepository {
  @override
  Future<List<Location>> getLocationBasedOnSearch(String text) {
    return LocationRemoteDataSource().getLocationBasedOnSearch(text);
  }
}
