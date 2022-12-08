import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion6_ud3/pages/producto/update_page.dart';
import 'package:sesion6_ud3/providers/producto_provider.dart';

class ProductosPage extends StatelessWidget {
  const ProductosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoData = Provider.of<ProductoProvider>(context);
    productoData.queryAll();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 182, 222),
        title: const Text('PERFILES', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {
              productoData.deleteAll();
            },
            icon: const Icon(Icons.delete, color: Colors.white,),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productoData.product.length,
        itemBuilder: (BuildContext context, int index) {
          final data = productoData.product[index];

          return ListTile(
            title: Text('${data.nombre} ${data.categoria}'),
            subtitle: Text('EDAD: ${data.stock}'),
            trailing: IconButton(
              onPressed: () {
                productoData.delete(data.id);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdatePage(
                    product: data,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
