import 'package:flutter/material.dart';
import 'package:madamecosmetics/pages/login_screen.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255, 235, 59, 1.0),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Madame Natural",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "InformationScreen"); // Cambiado de "cartPage" a "InformationScreen"
            },
            child: Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
