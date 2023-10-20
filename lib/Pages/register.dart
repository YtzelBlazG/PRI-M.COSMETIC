import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Image/Flor.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
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
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Registrarse',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: '  Usuario',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 196, 193, 193),
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 10, 10),
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: '  Contraseña',
                            labelStyle: TextStyle(
                              color: Color.fromARGB(255, 196, 193, 193),
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 25),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Lógica de inicio de sesión aquí
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.orange,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              minimumSize: Size(400, 60),
                            ),
                            child: Text(
                              'Registrarse',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 255, 253, 253),
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextButton.icon(
                            onPressed: () {
                              // Lógica de inicio de sesión aquí
                            },
                            icon: Icon(
                              Icons.message, // Cambia este icono según tus necesidades
                              color: const Color.fromARGB(255, 255, 254, 254),
                              size: 20,
                            ),
                            label: Text(
                              'Registrarse con whatsApp',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 252, 252, 252),
                                fontSize: 20,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 38, 145, 56),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              minimumSize: Size(400, 60),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextButton.icon(
                            onPressed: () {
                              // Lógica de inicio de sesión aquí
                            },
                            icon: Icon(
                              Icons.email, // Cambia este icono según tus necesidades
                              color: Color.fromARGB(255, 0, 0, 0),
                              size: 20,
                            ),
                            label: Text(
                              'Correo electronico',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 175, 175, 175),
                                fontSize: 20,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              minimumSize: Size(400, 60),
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