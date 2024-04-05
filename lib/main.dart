import 'package:bloc_app/bloc/productos_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final productosBloc = ProductosBloc();

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    productosBloc.productosContador;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc App',
      home: Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: productosBloc.productosContador,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('Productos (${snapshot.data ?? 0})');
            },
          ),
        ),
        body: StreamBuilder(
          stream: productosBloc.getProductos,
          builder: (_, AsyncSnapshot<List<String>> snapshot) {
            final productos = snapshot.data ?? [];

            return ListView.builder(
              itemCount: productos.length,
              itemBuilder: (_, i) {
                return ListTile(
                  title: Text(productos[i]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
