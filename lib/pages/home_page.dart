import 'dart:developer';

import 'package:cat_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catbreeds"),
      ),
      body: Column(
        children: [
          CustomSearchBar(
            controller: controller,
            onChanged: (text){
            },
          ),
        const SizedBox(height: 30),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index){
              return CardGeneralInfo(
                onTap: (){
                  log("tap");
                },
              );
            }),
        )
        ],
      ),
    );
  }
}