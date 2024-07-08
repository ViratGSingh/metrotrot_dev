import 'package:flutter/material.dart';

class ServiceTile extends StatelessWidget {
  const ServiceTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  final IconData icon;
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.02),
              offset: Offset(0, 4),
              blurRadius: 4)
        ]),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFBB23).withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          width: (MediaQuery.of(context).size.width - 80) / 3,
          height: (MediaQuery.of(context).size.width - 80) / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                shadows: [Shadow(color: Colors.black, blurRadius: 2)],
                color: Color(0xFFFFBB23),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }
}
