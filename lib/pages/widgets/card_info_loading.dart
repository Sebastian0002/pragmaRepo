import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class CardInfoLoading extends StatelessWidget {
  const CardInfoLoading({
    super.key, 
    });
  

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
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: const CardLoading(
                  height: 0,
                  child: Text("Breed:             ", style: TextStyle(color: Colors.transparent))),
              ),
              Container(
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
                child: ClipRRect(
                  borderRadius:BorderRadius.circular(5) ,
                  child: const CardLoading(height: 20, width: 50)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: const CardLoading(height: 250, width: 250)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              ClipRRect(
                borderRadius: BorderRadius.circular(5) ,
                child: const CardLoading(
                  height: 0,
                  child: Text("País de origen:           ", style: TextStyle(color: Colors.transparent))),
              ),
              
              ClipRRect(
                borderRadius: BorderRadius.circular(5) ,
                child: const CardLoading(
                  height: 0,
                  child: Text("Inteligencia:    ", style: TextStyle(color: Colors.transparent))),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}