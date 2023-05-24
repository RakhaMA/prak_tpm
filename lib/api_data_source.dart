import 'base_network.dart';
import 'model.dart';

final BaseNetwork _baseNetwork = BaseNetwork();

class ApiDataSource {
  Future<List<Product>> getProducts() async {
    final jsonResponse = await _baseNetwork.get('');

    final List<dynamic> data = jsonResponse;

    return data.map((json) => Product.fromJson(json)).toList();
  }
}