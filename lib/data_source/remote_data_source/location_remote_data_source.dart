// import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:first/data_source/remote_data_source/response/login_response.dart';
import 'package:first/helper/http_service.dart';
import 'package:first/model/locations.dart';

import '../../app/constants.dart';
// import '../../model/user.dart';

class LocationRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<List<Location>> getLocationBasedOnSearch(String text) async {
    try {
      Response response =
          await _httpServices.get('${Constant.getLocationByText}/$text');
      if (response.statusCode == 200) {
        List<Location> locations = (response.data as List)
            .map((location) => Location.fromJson(location))
            .toList();
        return locations;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
