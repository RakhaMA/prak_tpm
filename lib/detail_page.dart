import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailProduk extends StatelessWidget {
  DetailProduk(
      {Key? key,
        required this.nama,
        required this.deskripsi,
        required this.harga,
        required this.stok,
        required this.diskon,
        required this.namaToko,
        required this.produkUrl,
        required this.produkGambarUrl,
        required this.review})
      : super(key: key);

  String nama = "";
  String deskripsi = "";
  String harga = "";
  String stok = "";
  String diskon = "";
  String namaToko = "";
  String produkUrl = "";
  String produkGambarUrl = "";
  String review = "";

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
            tooltip: 'Logout',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                    image: NetworkImage(produkGambarUrl),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                "Deskripsi: \n" + deskripsi,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 8.0),
              Text(
                "Harga: " + harga,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 8.0),
              Text(
                "Stok Barang: " + stok,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 8.0),
              Text(
                "Diskon: " + diskon,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 8.0),
              Text(
                "Nama Toko: " + namaToko,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(height: 8.0),
              Text(
                "Review: " + review + "\n",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              ElevatedButton(
                onPressed: () {
                  launch(produkUrl);
                },
                child: const Text('Menuju laman Belanjaan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
