import 'package:dio/dio.dart';
import 'package:whatsapp_clone/api/constants/api_points.dart';
import 'package:whatsapp_clone/api/model/res_model.dart';

class ApiService {
  Future<ResModel> getResponse() async {
    try {
      var response = await Dio().get(BASE_URL+apiRes);
      ResModel res = ResModel.fromJson(response.data);
      return res;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}