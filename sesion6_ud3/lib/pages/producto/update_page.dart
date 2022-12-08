import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion6_ud3/models/producto_model.dart';
import 'package:sesion6_ud3/providers/producto_provider.dart';

class UpdatePage extends StatefulWidget {
  final Producto product;

  const UpdatePage({super.key, required this.product});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  @override
  Widget build(BuildContext context) {
    final data = widget.product;
    final nombreController = TextEditingController(text: data.nombre);
    final categoriaController = TextEditingController(text: data.categoria);
    final precioCController = TextEditingController(text: data.precioc);
    final precioVController = TextEditingController(text: data.preciov);
    final stockController = TextEditingController(text: data.stock);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 3, 182, 222),
        title: const Text('EDITAR PERFIL', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: [
            const SizedBox(height: 20,),
            CustomTextFormField(
              sufixIcon: Icon(Icons.face),
              controller: nombreController,
              hintText: 'Nombres',
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 20,),
            CustomTextFormField(
              sufixIcon: Icon(Icons.mood),
              controller: categoriaController,
              hintText: 'Apellidos',
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 20,),
            CustomTextFormField(
              sufixIcon: Icon(Icons.accessibility),
              controller: stockController,
              hintText: 'Edad',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 35,),
            MaterialButton(
              minWidth: 200,
              height: 60,
              color: Color.fromARGB(255, 42, 195, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                final productoProvider =
                    Provider.of<ProductoProvider>(context, listen: false);

                productoProvider.update(
                    data.id,
                    nombreController.text,
                    categoriaController.text,
                    precioCController.text,
                    precioVController.text,
                    stockController.text);
              },
              child: const Text(
                'GUARDAR',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
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
          borderSide: const BorderSide(color: Color.fromARGB(255, 148, 225, 255),),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 0, 183, 255),),
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        fillColor: const Color.fromARGB(255, 148, 225, 255),
        contentPadding: const EdgeInsets.all(15),
      ),
    );
  }
}
