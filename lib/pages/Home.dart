import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:foodmonkey/models/Category.dart';
import 'package:foodmonkey/utils/Constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTitleBar("Tags"),
            Container(
              height: 150,
              child: Swiper(
                autoplay: true,
                viewportFraction: 0.5,
                scale: .5,
                itemCount: tags.length,
                itemBuilder: (context, index) => ClipOval(
                    child:
                        Image.asset("lib/assets/images/${tags[index].image}")),
              ),
            ),
            SizedBox(height: 20,),
            _buildTitleBar("Categories"),
            Expanded(
              child: GridView.builder(
                itemCount: cats.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => _buldCategoryCard(cats[index]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buldCategoryCard(Category cat) {
    return Card(
      child: Image.asset("lib/assets/images/${cat.image}"),
    );
  }

  Widget _buildTitleBar(text) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: accent,
            borderRadius: BorderRadius.only(topRight: Radius.circular(80))),
        child: Text(
          text,
          style: TextStyle(fontSize: 50, fontFamily: 'English', color: normal),
        ));
  }
}
