// ignore_for_file: file_names
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductEdit extends StatefulWidget {
  const ProductEdit({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProductEditState createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  TextEditingController nameproduct = TextEditingController();
  TextEditingController pricebase = TextEditingController();
  TextEditingController priceofert = TextEditingController();
  String message = "";

  Future<void> editproduct() async {
    var url = Uri.parse("http://192.168.0.5/mysql/Product.php");
    try {
      var response = await http.post(url, body: {
        "name_product": nameproduct.text,
        "price_base": pricebase.text,
        "price_ofert":priceofert.text
      });

      var data = json.decode(response.body);
      if (data == "Error") {
        setState(() {
          message = "This user Already exists";
        });
      } else {
        setState(() {
          message = "Registration successful";
        });
        // ignore: use_build_context_synchronously
      }
    } catch (e) {
      setState(() {
        message = "An error occurred: $e";
      });
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Producto'),
        backgroundColor: Colors.black, // Color de fondo de la barra de navegación
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: nameproduct,
                decoration: InputDecoration(
                  labelText: 'Nombre del Producto',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0, // Espacio vertical
                    horizontal: 16.0, // Espacio horizontal
                  ),
                ),
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre del producto';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0), // Espacio vertical entre campos de texto
              TextFormField(
                controller: pricebase,
                decoration: InputDecoration(
                  labelText: 'Precio Base',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el precio base';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: priceofert,
                decoration: InputDecoration(
                  labelText: 'Precio Oferta',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 16.0,
                  ),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el precio oferta';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        AwesomeDialog(
                                context: context,
                                dialogType: DialogType.info,
                                animType: AnimType.TOPSLIDE,
                                title: 'Confirmar edicion',
                                desc: '¿Estás seguro de que deseas editar?',
                                btnCancelText: 'Cancelar',
                                btnCancelOnPress: () {
                                  // "Cancelar"
                                },
                                btnOkText: 'guardar',
                                btnOkOnPress: () {
                                  editproduct();
                                },
                              ).show();
                      }
                    },
                    child: Text('Guardar'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 241, 220, 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 24.0,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      AwesomeDialog(
                                context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.TOPSLIDE,
                                title: 'Confirmar eliminacion',
                                desc: '¿Estás seguro de que deseas eliminar el producto?',
                                btnCancelText: 'Cancelar',
                                btnCancelOnPress: () {
                                  // "Cancelar"
                                },
                                btnOkText: 'eliminar',
                                btnOkOnPress: () {
                                  //sorra
                                },
                              ).show();
                    },
                    child: Text('Eliminar'),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 241, 220, 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 24.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


