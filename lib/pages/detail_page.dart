import 'package:cat_app/domain/models/cat.dart';
import 'package:cat_app/provider/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {

    final Cat cat = context.read<CatProvider>().catSelected;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(cat.name),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: cat.image != null
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.memoryNetwork(
                      fadeInDuration: const Duration(milliseconds: 400),
                      placeholder: kTransparentImage,
                      image: cat.image!,
                      height: 300,
                      width: MediaQuery.sizeOf(context).width*0.9,
                      fit: BoxFit.fill,
                    ),
                  )
                  :Image.asset("assets/not_found_image.png"),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.05),
              child: const Text("Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Center(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.sizeOf(context).width*0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 4,
                          offset: Offset(1, 0),
                        )
                      ]
                    ),
                    child: Scrollbar(
                      thumbVisibility: false,
                      child: SingleChildScrollView(  
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Description:", style: TextStyle(fontWeight: FontWeight.w600),),
                            const SizedBox(height: 10),
                            Text(cat.description, textAlign: TextAlign.justify),
                            const SizedBox(height: 20),
                            Text("Country: ${cat.origin}"),
                            const SizedBox(height: 10),
                            Text("Intelligence: ${cat.intelligence}"),
                            const SizedBox(height: 10),
                            Text("Adaptability: ${cat.adaptability}"),
                            const SizedBox(height: 10),
                            Text("Life Span: ${cat.lifeSpan}"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
        
        
          ],
        ),
      )
    );
  }
}