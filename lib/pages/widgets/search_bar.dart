import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged
    });

  final TextEditingController controller;
  final Function(String str)? onChanged;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black54,
            offset: Offset(2, 3),
          )
        ]
      ),
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: const InputDecoration(
          enabled: true,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          suffixIcon: Icon(Icons.search, color: Colors.black),
          hintText: "Search"
        ),
      ),
    );
  }
}