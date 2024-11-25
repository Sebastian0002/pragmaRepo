import 'package:card_loading/card_loading.dart';
import 'package:cat_app/provider/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class CardGeneralInfo extends StatelessWidget {
  const CardGeneralInfo({
    super.key, 
    required this.onTap,
    required this.breed,
    required this.country,
    required this.image,
    required this.intelligence,
    });

  final Function()? onTap;
  final String breed;
  final String country;
  final int intelligence;
  final String? image;
  

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
              Text("Breed: $breed", style: const TextStyle(fontWeight: FontWeight.w500)),
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
                  child: const Text("More...", style: TextStyle(fontWeight: FontWeight.w500))),
              ),
            ],
          ),
          const SizedBox(height: 10),
          
          _Image(image: image),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180,
                child: Text(
                  "Country: $country", 
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  )),
              Text("Intelligence: $intelligence", style: const TextStyle(fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    required this.image,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    final CatProvider catProvider = context.watch<CatProvider>();
    return SizedBox(
      child:
      catProvider.loadingImages
      ?image != null
      ? _imageCharged()
      :ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: const CardLoading(height: 250, width: 250))
      : image != null
      ? _imageCharged()
      : Image.asset("assets/not_found_image.png"),
    );
  }

  ClipRRect _imageCharged() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: FadeInImage.memoryNetwork(
        fadeInDuration: const Duration(milliseconds: 400),
        placeholder: kTransparentImage,
        image: image!,
        height: 250,
        width: 250,
        fit: BoxFit.fill,
      ),
    );
  }
}