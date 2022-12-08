import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion6_ud3/providers/producto_provider.dart';

final nombreController = TextEditingController();
final categoriaController = TextEditingController();
final precioCController = TextEditingController();
final precioVController = TextEditingController();
final stockController = TextEditingController();

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 182, 222),
        title: const Text(
          'NUEVO PERFIL',
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Container(
        color: Color.fromARGB(255, 3, 182, 222),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                sufixIcon: Icon(Icons.face),
                controller: nombreController,
                hintText: 'Nombres',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                sufixIcon: Icon(Icons.mood),
                controller: categoriaController,
                hintText: 'Apellidos',
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 25,
              ),
              CustomTextFormField(
                sufixIcon: Icon(Icons.accessibility),
                controller: stockController,
                hintText: 'Edad',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 35,
              ),
              MaterialButton(
                minWidth: 200,
                height: 60,
                color: Color.fromARGB(255, 42, 195, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  productoProvider.insertProducto(
                      nombreController.text,
                      categoriaController.text,
                      precioCController.text,
                      precioVController.text,
                      stockController.text);

                  nombreController.clear();
                  categoriaController.clear();
                  precioCController.clear();
                  precioVController.clear();
                  stockController.clear();
                },
                child: const Text(
                  'CREAR',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final Widget? sufixIcon;

  const CustomTextFormField(
      {super.key, this.controller, this.keyboardType, this.hintText, this.sufixIcon});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: sufixIcon,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 148, 225, 255),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 0, 183, 255),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 148, 225, 255),
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}
