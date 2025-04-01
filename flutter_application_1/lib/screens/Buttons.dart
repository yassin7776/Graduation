import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
        ],
      ),
      child: const Column(
        children: [
          ActionButton(text: "add holiday", route: "/add_holiday"),
          ActionButton(text: "remove holiday", route: "/remove_holiday"),
          // ActionButton(text: "upload holiday", route: "/upload_holiday"),
          ActionButton(text: "update holiday", route: "/update_holiday"),
        ],
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final String route;

  const ActionButton({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
