part of 'services.dart';

class FoodServices {
  // Future asynchronous
  static Future<ApiReturnValue<List<Food>>> getFoods(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'food';

    var response = await client.get(Uri.parse(url));

    if (response != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Food> foods = (data['data']['data'] as Iterable)
        .map((e) => Food.fromJson(e))
        .toList();

    return ApiReturnValue(value: foods);

    // await Future.delayed(Duration(milliseconds: 500));
    // return ApiReturnValue(value: mockFoods);
  }
}
