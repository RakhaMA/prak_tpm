import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'detail_page.dart';
import 'groceries.dart';

class GroceriesList extends StatelessWidget {
  const GroceriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Groceries Store"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: Colors.grey,
        elevation: 50.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {},
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView.builder(
        itemCount: groceryList.length,
        itemBuilder: (BuildContext context, int index) {
          return GroceriesCard(groceriesList: groceryList[index]);
        },
      ),
    );
  }
}

class GroceriesCard extends StatelessWidget {
  final Groceries groceriesList;
  GroceriesCard({Key? key, required this.groceriesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.teal,
                        width: 2,
                      ),
                    ),
                    child: PageView.builder(
                      itemCount: groceriesList.productImageUrls.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          groceriesList.productImageUrls[index],
                          fit: BoxFit.contain,
                        );
                      },
                    ),
                  ),
                  Text(
                    groceriesList.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    groceriesList.storeName,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        String a = groceriesList.name;
        String b = groceriesList.description;
        String c = groceriesList.price;
        String d = groceriesList.stock;
        String e = groceriesList.discount;
        String f = groceriesList.storeName;
        String g = groceriesList.productUrl;
        String h = groceriesList.productImageUrls[0];
        String i = groceriesList.reviewAverage;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => DetailProduk(
                  nama: a,
                  deskripsi: b,
                  harga: c,
                  stok: d,
                  diskon: e,
                  namaToko: f,
                  produkUrl: g,
                  produkGambarUrl: h,
                  review: i)),
        );
      },
    );
  }
}