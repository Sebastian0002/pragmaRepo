import 'package:flutter/material.dart';

class CardGeneralInfo extends StatelessWidget {
  const CardGeneralInfo({super.key, required this.onTap});

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Nombre raza", style: TextStyle(fontWeight: FontWeight.w500)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.black38,
                      offset: Offset(0, 2)
                    )
                  ]
                ),
                child: GestureDetector(
                  onTap: onTap,
                  child: const Text("Mas...", style: TextStyle(fontWeight: FontWeight.w500))),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Image.asset("assets/cat.png", width: 250, fit: BoxFit.fill),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("País de origen", style: TextStyle(fontWeight: FontWeight.w500)),
              Text("inteligencia", style: TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}