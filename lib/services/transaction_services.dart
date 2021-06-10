part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURL + 'transaction';

    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${User.token}'
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<Transaction> transactions = (data['data']['data'] as Iterable)
        .map((e) => Transaction.fromJson(e))
        .toList();

    return ApiReturnValue(value: transactions);
    // await Future.delayed(Duration(seconds: 3));
    // return ApiReturnValue(value: mockTransactions);
  }

  static Future<ApiReturnValue<Transaction>> submitTransaction(
      Transaction transaction) async {
    await Future.delayed(Duration(seconds: 2));

    //return ApiReturnValue(message: 'Transaksi Gagal');
    return ApiReturnValue(
        value:
            transaction.copyWith(id: 123, status: TransactionStatus.pending));
  }
}
