import 'package:flutter/material.dart';
import 'package:flutter_api_single_product/controllers/api_controllers.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('HomePage'),
      ),
      body: FutureBuilder(
        future: ApiControllers.getSingleProduct(1),
        builder: (_, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Card(
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListTile(
                      title: Text(
                        snapshot.data['title'],
                      ),
                      subtitle: Image.network(
                        snapshot.data['image'].toString(),
                        height: 150,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
