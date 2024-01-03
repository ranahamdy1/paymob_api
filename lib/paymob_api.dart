import 'package:dio/dio.dart';

Future<String> pay() async {
  final Response response =
  await Dio().get(
      "https://56a0-197-43-50-237.ngrok-free.app/api/paymob-mobile-wallet/get-auth-token");
  return response.data;
}
