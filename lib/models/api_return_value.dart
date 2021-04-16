part of 'models.dart';

// class untuk menampilkan return value dan message 
// dari API
class ApiReturnValue<T> {
  final T value;
  final String message;

  ApiReturnValue({this.message, this.value});
}
