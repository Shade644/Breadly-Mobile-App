import 'package:breadly/controllers/recommended_product_controller.dart';
import 'package:breadly/routes/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wyszukiwarka'),
      ),
      body: SearchBody(),
    );
  }
}

class SearchBody extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Wyszukaj produkty...',
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              String query = _searchController.text;
              Get.find<RecommendedProductController>().filterProducts(query);
            },
            child: Text('Szukaj'),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: GetBuilder<RecommendedProductController>(
              builder: (recommendedProduct) {
                if (!recommendedProduct.isLoaded) {
                  return CircularProgressIndicator(color: Colors.blueAccent);
                }

                if (recommendedProduct.filteredProductList.isEmpty) {
                  return Center(
                    child: Text('Brak wyników dla wyszukiwanego zapytania.'),
                  );
                }

                return ListView.builder(
                  itemCount: recommendedProduct.filteredProductList.length,
                  itemBuilder: (context, index) {
                    var product = recommendedProduct.filteredProductList[index];

                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(product.img ??''), // Tutaj dodaj zdjęcie z produktu (może być null, dlatego używamy ?? '')
                      ),
                      title: Text(product.name),
                      subtitle: Text(product.s_description),
                      onTap: () {
                        Get.toNamed(RouteHelper.getDetailFood(index, "home"));
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
