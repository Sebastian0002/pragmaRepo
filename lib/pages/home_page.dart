import 'package:cat_app/interfaces/repositories/cat_info_repository.dart';
import 'package:cat_app/pages/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      CatInfoRepository().getCatInfo();
    });
    super.initState(); 
  }


  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            toolbarHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: SafeArea(
                child: Column(
                  children: [
                    const Text("Catbreeds"),
                    const SizedBox(height: 10),
                    CustomSearchBar(controller: controller, onChanged: (str){})
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return CardGeneralInfo(
                  onTap: (){
                    Navigator.pushNamed(context, "/details");
                  },
                );
              },
              childCount: 10
            )
          )
        ],
      ),
    );
    
    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Catbreeds"),
    //   ),
    //   body: Column(
    //     children: [
    //       CustomSearchBar(
    //         controller: controller,
    //         onChanged: (text){
    //         },
    //       ),
    //     const SizedBox(height: 30),
    //     Expanded(
    //       child: ListView.builder(
    //         physics: const BouncingScrollPhysics(),
    //         itemCount: 10,
    //         itemBuilder: (context, index){
    //           return CardGeneralInfo(
    //             onTap: (){
    //               Navigator.pushNamed(context, "/details");
    //             },
    //           );
    //         }),
    //     )
    //     ],
    //   ),
    // );
  }
}