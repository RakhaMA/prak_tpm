import 'package:flutter/material.dart';
import 'api_data_source.dart';
import 'detailproduct.dart';
import 'model.dart';

class ListProduct extends StatelessWidget {
  final ApiDataSource _dataSource = ApiDataSource();

  ListProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<List<Product>>(
            future: _dataSource.getProducts(),
            builder: (context, dataProducts) {
              if (dataProducts.hasData) {
                return ListView.builder(
                  itemCount: dataProducts.data!.length,
                  itemBuilder: (context, index) {
                    final product = dataProducts.data![index];

                    return InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailProduct(product: product),
                          ),
                        );

                      },
                      splashColor: Colors.grey.withOpacity(0.2),
                      highlightColor: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      child: ListTile(
                        leading: Image.network(
                          product.image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                        title: Text(product.title),
                        subtitle: Text('\$${product.price}'),
                        trailing: Column(
                          children: [
                            Icon(
                                Icons.add_shopping_cart
                            ),
                            Text(product.rating['count'].toString())
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (dataProducts.hasError) {
                return Text('${dataProducts.error}');
              }

              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
