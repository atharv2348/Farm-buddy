import 'package:dio/dio.dart';
import 'package:krishi_vikas/utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VeterinarianServices {
  Dio dio = Dio();

  Future<bool> addRecord(
      String username,
      String aadhar_number,
      String phone,
      String date_of_birth,
      String gender,
      String clinic_name,
      String clinic_address,
      String street_address,
      String city,
      String state,
      String country,
      String zip,
      String years_of_experience,
      String pricing_model,
      String price,
      String open_from,
      String open_to,
      String opening_time,
      String closing_time,
      String service_area,
      String photo_url) async {
    print("--- addRecord function is called ---");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString("token")!;
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImF0aGFydmMyMDIyQGdtYWlsLmNvbSIsIm5hbWUiOiJBdGhhcnYiLCJfaWQiOiI2NjQ5YjQyNWY2NDhlMzgwOWVkOTYxNDMiLCJhZGRyZXNzIjoiOTQyMjMyNDkwMyIsImlhdCI6MTcxNjg1NTgyNywiZXhwIjoxNzE5NDQ3ODI3fQ.ENL-4Kl38ATfyE5BCx9Y2QRoE_JLxyNh4eebWqG0DAg";

    try {
      Response response = await dio.post("${base_url}animal/",
          data: {
            "username": username,
            "aadhar_number": aadhar_number,
            "phone": phone,
            "date_of_birth": date_of_birth,
            "gender": gender,
            "clinic_name": clinic_name,
            "clinic_address": clinic_address,
            "street_address": street_address,
            "city": city,
            "state": state,
            "country": country,
            "zip": zip,
            "years_of_experience": years_of_experience,
            "pricing_model": pricing_model,
            "price": price,
            "open_from": open_from,
            "open_to": open_to,
            "opening_time": opening_time,
            "closing_time": closing_time,
            "service_area": service_area,
            "photo_url": photo_url
          },
          options: Options(headers: {"Authorization": token}));

      print(
          "Response statuscode : ${response.statusCode}  Response Data : ${response.data}");
      return true;
    } on DioException catch (e) {
      if (e.response != null) {
        print("################## $e");
      }
      return false;
      // throw Exception(e);
    }
  }

  Future<dynamic> getVeterinarianRecord(String id) async {
    print("--- getVeterinarianRecord function is called ---");
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // String token = prefs.getString("token")!;
      String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im5hbmRhbm1hZ2R1bTE0QGdtYWlsLmNvbSIsIm5hbWUiOiJOYW5kYW4gTWFnZHVtIiwiX2lkIjoiNjY0NGViOTRjZDhkYzJmMDYwMjMzMDkyIiwiYWRkcmVzcyI6IkEvUDogQmFsaW5nZSwgVGFsOiBLYXJ2ZWVyLCBEaXN0OiBLb2xoYXB1ciwgNDE2MDEwIiwiaWF0IjoxNzE1NzkyODc0LCJleHAiOjE3MTgzODQ4NzR9.zebVbEiS4jM7cF0HryT-qQtUb878G_vA5VUkagdpJO0";

      Response response = await dio.get("${base_url}veterinarian/$id",
          options: Options(headers: {"Authorization": token}));
      print(
          "Response statuscode : ${response.statusCode}  Response Data : ${response.data}");
      return response.data;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<dynamic> getAllVeterinarianRecords() async {
    print("--- getAllVeterinarianRecords function is called ---");

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString("token")!;
    String token =
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im5hbmRhbm1hZ2R1bTE0QGdtYWlsLmNvbSIsIm5hbWUiOiJOYW5kYW4gTWFnZHVtIiwiX2lkIjoiNjY0NGViOTRjZDhkYzJmMDYwMjMzMDkyIiwiYWRkcmVzcyI6IkEvUDogQmFsaW5nZSwgVGFsOiBLYXJ2ZWVyLCBEaXN0OiBLb2xoYXB1ciwgNDE2MDEwIiwiaWF0IjoxNzE1NzkyODc0LCJleHAiOjE3MTgzODQ4NzR9.zebVbEiS4jM7cF0HryT-qQtUb878G_vA5VUkagdpJO0";
    try {
      Response response = await dio.get("${base_url}veterinarian/all",
          options: Options(headers: {"Authorization": token}));

      print(
          "Response statuscode : ${response.statusCode}  Response Data : ${response.data}");
      return response.data;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}
