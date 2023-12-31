import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:madamecosmetics/pages/HomePage.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController phone = TextEditingController();
  String selectedGender = 'Mujer';
  String selectedCity = 'Cochabamba';
  String message = "";

  Future<void> register() async {
    var url = Uri.parse("http://192.168.1.64/mysql/Register.php");
    try {
      var response = await http.post(url, body: {
        "username": user.text,
        "password": pass.text,
        "phone": phone.text,
        "gender": selectedGender,
        "location": selectedCity,
      });

      var data = json.decode(response.body);
      if (data == "Error") {
        setState(() {
          message = "Este usuario o número de teléfono ya existe.";
        });
      } else {
        setState(() {
          message = "Registro exitoso";
        });
      }
    } catch (e) {
      setState(() {
        message = "Se produjo un error: $e";
      });
    }
  }

  bool validatePhoneNumber(String phoneNumber) {
    RegExp regExp = RegExp(r'^(\+\d{1,3}\s?)?\d{7,20}$');
    return regExp.hasMatch(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Colors.yellow[200]!, Colors.yellow[500]!],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Madame Cosmetic",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "Se Parte de Nosotros",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  _buildTextFieldWithIcon(
                    hintText: "Nombre de Usuario",
                    icon: Icons.person_outline,
                    controller: user,
                  ),
                  SizedBox(height: 15),
                  _buildTextFieldWithIcon(
                    hintText: "Contraseña",
                    icon: Icons.lock_outline,
                    controller: pass,
                    isPassword: true,
                  ),
                  SizedBox(height: 15),
                  _buildDropdownSexo(),
                  SizedBox(height: 15),
                  _buildCityDropdown(),
                  SizedBox(height: 15),
                  _buildTextFieldWithIcon(
                    hintText: "Número de WhatsApp",
                    icon: Icons.phone,
                    controller: phone,
                  ),
                  SizedBox(height: 30),
                  _buildRegisterButton(),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.5,
                          endIndent: 10,
                        ),
                      ),
                      Text(
                        " Nuestras Redes ",
                        style: TextStyle(fontSize: 19),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 1.5,
                          endIndent: 10,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          const instagramUrl =
                              'https://www.instagram.com/madame_natural_/';

                          if (await canLaunch(instagramUrl)) {
                            await launch(instagramUrl);
                          } else {
                            throw 'No se pudo abrir el enlace: $instagramUrl';
                          }
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: FaIcon(
                            color: Colors.white,
                            FontAwesomeIcons.instagram,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      GestureDetector(
                        onTap: () async {
                          const facebookUrl =
                              'https://www.facebook.com/MadameNatural';

                          if (await canLaunch(facebookUrl)) {
                            await launch(facebookUrl);
                          } else {
                            throw 'No se pudo abrir el enlace: $facebookUrl';
                          }
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: FaIcon(
                            color: Colors.white,
                            FontAwesomeIcons.facebookF,
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      GestureDetector(
                        onTap: () async {
                          const whatsappUrl = 'https://wa.me/+59172778767';

                          if (await canLaunch(whatsappUrl)) {
                            await launch(whatsappUrl);
                          } else {
                            throw 'No se pudo abrir el enlace: $whatsappUrl';
                          }
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black,
                          child: FaIcon(
                            color: Colors.white,
                            FontAwesomeIcons.whatsapp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  if (message.isNotEmpty)
                    Text(
                      message,
                      style: TextStyle(color: Colors.red),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldWithIcon({
    required String hintText,
    required IconData icon,
    TextEditingController? controller,
    bool isPassword = false,
  }) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 80, vertical: 17),
            filled: true,
            fillColor: Colors.white70,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 35,
          child: Icon(
            color: Colors.white,
            icon,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget _buildCityDropdown() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        DropdownButtonFormField<String>(
          value: selectedCity,
          onChanged: (value) {
            setState(() {
              selectedCity = value!;
            });
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 80, vertical: 17),
            filled: true,
            fillColor: Colors.white70,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          items: [
            DropdownMenuItem(value: 'Cochabamba', child: Text('Cochabamba')),
            DropdownMenuItem(value: 'LaPaz', child: Text('La Paz')),
            DropdownMenuItem(value: 'Tarija', child: Text('Tarija')),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 35,
          child: Icon(
            color: Colors.white,
            Icons.location_on,
            size: 30,
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: ElevatedButton(
        onPressed: () {
          if (user.text.isEmpty && pass.text.isEmpty) {
            setState(() {
              message = "Nombre de usuario y contraseña son obligatorios.";
            });
          } else if (user.text.isEmpty) {
            setState(() {
              message = "Nombre de usuario es obligatorio.";
            });
          } else if (pass.text.isEmpty) {
            setState(() {
              message = "Contraseña es obligatoria.";
            });
          } else if (pass.text.length < 6) {
            setState(() {
              message = "La contraseña debe tener al menos 6 caracteres.";
            });
          } else if (user.text.toLowerCase() == 'administrador') {
            setState(() {
              message =
                  'No está permitido el nombre de usuario "administrador".';
            });
          } else if (!validatePhoneNumber(phone.text)) {
            setState(() {
              message = 'Número de teléfono no válido.';
            });
          } else {
            register();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
            user.clear();
            pass.clear();
            phone.clear();
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Container(
          height: 50,
          child: Center(
            child: Text(
              "Registrarse",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownSexo() {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        DropdownButtonFormField<String>(
          value: selectedGender,
          onChanged: (value) {
            setState(() {
              selectedGender = value!;
            });
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 80, vertical: 17),
            filled: true,
            fillColor: Colors.white70,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          items: [
            DropdownMenuItem(value: 'Mujer', child: Text('Mujer')),
            DropdownMenuItem(value: 'Hombre', child: Text('Hombre')),
            DropdownMenuItem(value: 'Ninguno', child: Text('Ninguno')),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.black,
          radius: 35,
          child: Icon(
            color: Colors.white,
            Icons.groups_3_outlined,
            size: 30,
          ),
        ),
      ],
    );
  }
}
