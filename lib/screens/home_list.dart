import 'package:first/screens/models/catalog.dart';
import 'package:flutter/material.dart';

class HomeListScreen extends StatefulWidget {

  const HomeListScreen({super.key});

  @override
  State<HomeListScreen> createState() => _HomeListScreenState();
}

class _HomeListScreenState extends State<HomeListScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final items = CatalogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: GridTile(
                        header: Text(items.name),
                        child: Image.asset(items.image),
                        footer: Text(items.price.toString()),
                      ));
                },
                itemCount: CatalogModel.items.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
