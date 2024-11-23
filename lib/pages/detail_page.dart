import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("nombre raza"),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/cat_image.jpg", fit: BoxFit.fill, height: 300),
                ),
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
                  child: const Scrollbar(
                    thumbVisibility: false,
                    child: SingleChildScrollView(  
                      child: Column(
                        children: [
                          Text("Note: If you are not using the existing pubspec.yaml ensure that your config file is located in the same directory as it.If you encounter any issues please report them here.In the above configuration, the package is setup to replace the existing launcher icons in both the Android and iOS project with the icon located in the image path specified above and given the name launcher_icon in the Android project and Example-Icon in the iOS project."),
                          // Text("Note: If you are not using the existing pubspec.yaml ensure that your config file is located in the same directory as it.If you encounter any issues please report them here.In the above configuration, the package is setup to replace the existing launcher icons in both the Android and iOS project with the icon located in the image path specified above and given the name launcher_icon in the Android project and Example-Icon in the iOS project."),
                          // Text("Note: If you are not using the existing pubspec.yaml ensure that your config file is located in the same directory as it.If you encounter any issues please report them here.In the above configuration, the package is setup to replace the existing launcher icons in both the Android and iOS project with the icon located in the image path specified above and given the name launcher_icon in the Android project and Example-Icon in the iOS project."),
                          // Text("Note: If you are not using the existing pubspec.yaml ensure that your config file is located in the same directory as it.If you encounter any issues please report them here.In the above configuration, the package is setup to replace the existing launcher icons in both the Android and iOS project with the icon located in the image path specified above and given the name launcher_icon in the Android project and Example-Icon in the iOS project."),
                        ],
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