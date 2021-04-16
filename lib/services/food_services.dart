part of 'services.dart';

class FoodServices {
  // Future asynchronous
  static Future<ApiReturnValue<List<Food>>> getFood() async {
    await Future.delayed(Duration(milliseconds: 500));

    return ApiReturnValue(value: mockFoods);
  }
}
