import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Información de Contactos'),
          backgroundColor: Color.fromRGBO(255, 235, 59, 1.0),
        ),
        body: InformationScreen(),
      ),
    );
  }
}

class InformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<List<String>> contactsData = [
      [
        'Cochabamba',
        '+59172778767',
        'Madame Natural',
        'https://maps.app.goo.gl/y2ujqKkczf4CyGiS9'
      ],
      [
        'Tarija 1',
        '+59170224505',
        'Tienda Detalles',
        'https://maps.app.goo.gl/wCx7Vhnef7z4tz7JA'
      ],
      [
        'Tarija 2',
        '+59177173053',
        'Maris Fashion',
        'https://maps.app.goo.gl/1oFKT9oPwDKumqzd7'
      ],
      [
        'La Paz',
        '+59175887220',
        'Akhana', 
        'https://maps.app.goo.gl/Gag8gmdtigLdyZBV7'
      ],
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Información de Contactos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 235, 59, 1.0),
      ),
      body: ListView.builder(
        itemCount: contactsData.length,
        itemBuilder: (context, index) {
          return ContactCard(contactData: contactsData[index]);
        },
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}

class ContactCard extends StatelessWidget {
  final List<String> contactData;

  ContactCard({required this.contactData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              contactData[0],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          ListTile(
            title: GestureDetector(
              onTap: () async {
                // Abre WhatsApp cuando se hace clic en el número
                String url = 'https://wa.me/${contactData[1]}';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'No se pudo abrir el enlace $url';
                }
              },
              child: Text(
                'Número de Teléfono: ${contactData[1]}',
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Contacto: ${contactData[2]}'),
          ),
          ListTile(
            title: GestureDetector(
              onTap: () async {
                // Abre el enlace de Google Maps cuando se hace clic en la dirección
                String url = contactData[3];
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'No se pudo abrir el enlace $url';
                }
              },
              child: Row(
                children: [
                  Text(
                    'Dirección: ',
                  ),
                  Text(
                    'Abrir Google Maps',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
