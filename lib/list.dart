import 'package:flutter/material.dart';

import 'types/product.dart';
import 'utils/utils.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({super.key});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  List<Product> _productsList = List.empty();
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  void initState() {
    super.initState();
    getProducts().then(
        (value) => setState(() {
              _productsList = value;
            }), onError: (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Sending Message"),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista prodotti',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Prodotti'),
        ),
        body: _productsList.isEmpty
            ? const Center(child: Text('Nessun prodotto trovato'))
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: _productsList.length,
                itemBuilder: (context, i) {
                  //if (i.isOdd) return const Divider();

                  //final index = i ~/ 2;
                  return Column(children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 335,
                        height: 180,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 5,
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              SizedBox(
                                width: 335,
                                height: 110,
                                child: Image.network(
                                  _productsList[i].image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Column(children: [
                                Text(_productsList[i].name),
                                const Text('Subtitle')
                              ])
                            ],
                          ),
                        ),
                      ),
                    ),
                  ]);
                },
              ),
      ),
    );
  }
}
