import 'package:flutter/material.dart';

import 'detail.dart';

class Home extends StatelessWidget {
List<Map<String,dynamic>> data=[
  {
    'title':'Big Mac®=',
    'url':"https://s7d1.scene7.com/is/image/mcdonalds/DC_201907_0005_BigMac_832x472:product-header-desktop?wid=830&hei=458&dpr=off",
   'price':150,
    'des':"Ever wondered what's on a Big Mac®? The McDonald's Big Mac® is a 100% beef burger with a taste like no other. The mouthwatering perfection starts with two 100% pure all beef patties and Big Mac® sauce sandwiched between a sesame seed bun. It’s topped off with pickles, crisp shredded"

  },
  {
    'title':'World Famous Fries',
    'url':"https://s7d1.scene7.com/is/image/mcdonalds/DC_202002_6050_SmallFrenchFries_Standing_832x472:product-header-desktop?wid=830&hei=456&dpr=off",
    'price':100,
    'des':"McDonald's World Famous Fries® are made with premium potatoes such as the Russet Burbank and the Shepody. With 0g of trans fat per labeled serving, these epic fries are crispy and golden on the outside and fluffy on the inside."
  },
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: List.generate(data.length, (index) {
              return Center(
                child:  GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Detail(data[index]['title'],data[index]['url'],data[index]['price'],data[index]['des'])));
                  },
                  child: Card(
                    margin: EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    elevation: 30.0,
                    color: Colors.white,
                    shadowColor: Colors.black87,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          data[index]['url'],
                          width: 150,
                        ),


                      ],
                    ),
                  ),
                ),
              );
            }
            )
        )
    );
  }
}
