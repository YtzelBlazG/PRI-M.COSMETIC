import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Home/Home.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  String message = "";

  Future<void> register() async {
    var url = Uri.parse("http://192.168.0.5/mysql/Register.php");
    try {
      var response = await http.post(url, body: {
        "username": user.text,
        "password": pass.text,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Otra Página'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Image/Flor.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: 500,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Registrarse',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: user,
                          decoration: const InputDecoration(
                            labelText: '  Usuario',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 196, 193, 193),
                            ),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 10, 10, 10),
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          controller: pass,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: '  Contraseña',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 196, 193, 193),
                            ),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 25),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.WARNING,
                                animType: AnimType.TOPSLIDE,
                                title: 'Confirmar Registro',
                                desc: '¿Estás seguro de que deseas registrarte?',
                                btnCancelText: 'Cancelar',
                                btnCancelOnPress: () {
                                  // "Cancelar"
                                },
                                btnOkText: 'Registrar',
                                btnOkOnPress: () {
                                  register();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomePage(userName: user.text),
                                    ),
                                  );
                                },
                              ).show();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              minimumSize: const Size(400, 60),
                            ),
                            child: const Text(
                              'Registrar',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 253, 253),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextButton.icon(
                            onPressed: () {
                              // Lógica de registro con WhatsApp aquí
                            },
                            icon: const Icon(
                              Icons.message,
                              color: Color.fromARGB(255, 255, 254, 254),
                              size: 20,
                            ),
                            label: const Text(
                              'Registrarse con WhatsApp',
                              style: TextStyle(
                                color: Color.fromARGB(255, 252, 252, 252),
                                fontSize: 20,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 38, 145, 56),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              minimumSize: const Size(400, 60),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextButton.icon(
                            onPressed: () {
                              // Lógica de inicio de sesión aquí
                            },
                            icon: const Icon(
                              Icons.email,
                              color: Color.fromARGB(255, 0, 0, 0),
                              size: 20,
                            ),
                            label: const Text(
                              'Correo electrónico',
                              style: TextStyle(
                                color: Color.fromARGB(255, 175, 175, 175),
                                fontSize: 20,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              minimumSize: const Size(400, 60),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
