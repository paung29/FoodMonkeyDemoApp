import 'package:flutter/material.dart';
import 'package:foodmonkey/helpers/TrianglePainter.dart';
import 'package:foodmonkey/utils/Api.dart';
import 'package:foodmonkey/utils/constants.dart';

class Flash extends StatefulWidget {
  const Flash({super.key});

  @override
  State<Flash> createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  loadInitialData()async{
    var catBol = await Api.getAllCart();
    var subBol = await Api.getAllSubs();
    var tagBol = await Api.getAllTags();
    if(catBol && subBol && tagBol){
      Navigator.pushReplacementNamed(context, '/home');
    }else{
      print("Data erro");
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadInitialData();
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: TrianglePainter(msize: size),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 140, left: 30),
            child: Text(
              "Food Monkey",
              style: TextStyle(
                  fontSize: 35, fontWeight: FontWeight.bold, color: normal),
            ),
          ),
          Center(child: Image.asset('lib/assets/images/2996-FhAPcQf.webp',scale: 5.5,)),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircularProgressIndicator(
                  backgroundColor: accent,
                  valueColor: AlwaysStoppedAnimation(normal),
                ),
                SizedBox(height: 150,)
              ],
            ),
          )

        ],
      ),
    );
  }

  
}
