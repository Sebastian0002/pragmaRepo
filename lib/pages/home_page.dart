import 'package:cat_app/domain/models/cat.dart';
import 'package:cat_app/pages/widgets/card_info_loading.dart';
import 'package:cat_app/pages/widgets/widgets.dart';
import 'package:cat_app/provider/cat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await context.read<CatProvider>().getInfoCats();
    });
    super.initState(); 
  }


  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final catProvider = context.read<CatProvider>();

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: false,
            floating: true,
            toolbarHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: SafeArea(
                child: Column(
                  children: [
                    const Text("Catbreeds"),
                    const SizedBox(height: 10),
                    CustomSearchBar(
                      controller: controller,
                      onChanged: (str){
                        catProvider.setFilterCat(str);
                      }
                    )
                  ],
                ),
              ),
            ),
          ),
          const _ListCat()
        ],
      ),
    );
  }
}

class _ListCat extends StatefulWidget {
  const _ListCat();

  @override
  State<_ListCat> createState() => _ListCatState();
}

class _ListCatState extends State<_ListCat> {
  @override
  Widget build(BuildContext context) {
    final catProvider = context.watch<CatProvider>();
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final cat = !catProvider.loading ? catProvider.catList[index]: Cat.empty();
          return catProvider.loading
          ? const CardInfoLoading()
          : CardGeneralInfo(
            breed: cat.name,
            country: cat.origin,
            image: cat.image,
            intelligence: cat.intelligence,
              onTap: (){
                catProvider.setCatSelected(cat);
                Navigator.pushNamed(context, "/details");
              },
            );
        },
        childCount: catProvider.loading 
          ? 5
          : catProvider.catList.length
      )
    );
  }
}