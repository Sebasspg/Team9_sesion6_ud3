import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sesion6_ud3/pages/menu_page.dart';
import 'package:sesion6_ud3/providers/producto_provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductoProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'menupage',
        routes: {
          'menupage': (_) => const Menupage(),
        },
      ),
    );
  }
}
