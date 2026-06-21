import 'package:flutter/material.dart';
import 'package:start_once_again/screens/nav_menu.dart';

PreferredSizeWidget buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: const Color(0xFF1A1F3A),
    elevation: 0,
    title: Row(
      children: [
        buildLogoContainer(),
        SizedBox(width: 12),
        Text(
          'Developer & Digtal Marketer',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    actions: MediaQuery.of(context).size.width > 1100
        ? [
            NavItem(label: 'Home'),
            NavItem(label: 'About'),
            NavItem(label: 'Services'),
            NavItem(label: 'Trainings'),
            NavItem(label: 'Contact Us'),
            buildWhatsappButton(),
          ]
        : [IconButton(icon: const Icon(Icons.menu), onPressed: () {})],
  );
}

Widget buildLogoContainer() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 13, 26, 37),
          Color.fromARGB(255, 12, 30, 46),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.blue.withValues(alpha: 0.4),
          blurRadius: 12,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Text(
      'REk',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

Widget buildWhatsappButton() {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1.5),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.white.withValues(alpha: 0.1), blurRadius: 8),
        ],
      ),
      child: Text(
        'WHATSAPP: +92 347 8118327',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 12,
          letterSpacing: 0.5,
        ),
      ),
    ),
  );
}
