import 'package:flutter/cupertino.dart';
import 'package:doan/model/product.dart';
import 'package:flutter/material.dart';

class Mogotest extends StatefulWidget {
  const Mogotest({super.key});

  @override
  State<Mogotest> createState() => _MogotestState();
}

class _MogotestState extends State<Mogotest> {
  final MongoService _mongoService = MongoService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  late Future<List<Map<String, dynamic>>> _products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _products = Future.value([]);
    _mongoService.connect().then((_) {
      setState(() {
        _products = _mongoService.getProducts();
      });
    });
    
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _mongoService.close();
  }
  @override
  Widget build(BuildContext context) {
    

    
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter MongoDB'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _products,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No products found');
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data![index];
                        return ListTile(
                          title: Text(product['name']),
                          subtitle: Text('ID: ${product['id']}, Price: \$${product['price']}'),
                        );
                      },
                    ),
                  );
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                  ),
                  TextField(
                    controller: _idController,
                    decoration: InputDecoration(labelText: 'ID'),
                  ),
                  TextField(
                    controller: _priceController,
                    decoration: InputDecoration(labelText: 'Price'),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final newProduct = {
                        'name': _nameController.text,
                        'id': _idController.text,
                        'price': double.parse(_priceController.text),
                      };
                      await _mongoService.addProduct(newProduct);
                      setState(() {
                        _products = _mongoService.getProducts();
                      });
                    },
                    child: Text('Add Product'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}