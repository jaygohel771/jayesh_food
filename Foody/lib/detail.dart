import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
String title="";
String url="";
int price;
String des="";
FirebaseDatabase database = FirebaseDatabase.instance;
  Detail(this.title,this.url,this.price,this.des);
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)),
           elevation: 30.0,
      color: Colors.white,
      shadowColor: Colors.black87,
          child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(height: 10),
                    Image.network(
                      url,
                      height: 200,
                    ),
                    Text(
                      des,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
           SizedBox(
             height: 20,
           ),
           Text(
              "Price: $price",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.amberAccent,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),),
                    SizedBox(
                      height: 10,
                    ),
            SizedBox(
              width: 150,
            child:  TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              obscureText: false,
              maxLines: 1,
              decoration: InputDecoration(
                label: Text("Quantity"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),),
                    ElevatedButton(
                        onPressed: () {
                          String? key = database
                              .ref('Order$num')
                              .push()
                              .key;
                          database
                              .ref('Order')
                              .child(key!)
                              .set({
                            'Item_Name': title,
                            'Quantity':
                            _controller.text,
                            'Price':
                            price.toString(),
                            'Payable': (int.parse(
                                _controller.text) *
                                price)
                                .toString(),
                            'key': key,
                          });
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(
                            content: Text(
                              'Order Confirmed',
                              style: TextStyle(
                                  fontWeight:
                                  FontWeight.w900),
                            ),
                            backgroundColor: Colors.green,
                            elevation: 10,
                            behavior:
                            SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          ));
                        },
                        child: Text("Confirm Order"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        )),

                  ],
                ),
          ),
    )
      ) ,
    );
  }
}
