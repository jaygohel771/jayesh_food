import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:foody/home.dart';
main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      home: myApp(),
    ),
  );
}

class myApp extends StatefulWidget {
  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  TextEditingController b1 = TextEditingController();
  TextEditingController b3 = TextEditingController();
  TextEditingController b4 = TextEditingController();
  String name = "";
  String mo = "";
  String Address = "";
  FirebaseDatabase database = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://png.pngtree.com/background/20210710/original/pngtree-background-of-hand-painted-mengfeng-fast-food-cartoon-picture-image_981299.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50.0,
                      color: Colors.green),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: b1,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: "UserName",
                    labelText: "UserName",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: b3,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: "Mobile_no",
                      labelText: "Mobile_no",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      prefixIcon: Icon(Icons.call),
                      prefix: Text("+91")),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: b4,
                  keyboardType: TextInputType.streetAddress,
                  obscureText: false,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Adress",
                    labelText: "Adress",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    prefixIcon: Icon(Icons.home),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: () async {
                    name = b1.text;
                    mo = b3.text;
                    Address = b4.text;
                    if (!name.isEmpty && !Address.isEmpty && mo.length == 10) {
                      String? key = database.ref('User').push().key;
                      database.ref('User').child(key!).set(
                          {'Name': name, 'Mobile_no': mo, 'Address': Address});
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Login Sucessfully',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        backgroundColor: Colors.green,
                        elevation: 10,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(5),
                      ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Fill up detail properly',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                        backgroundColor: Colors.red,
                        elevation: 10,
                        behavior: SnackBarBehavior.floating,
                        margin: EdgeInsets.all(5),
                      ));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 50.0,
                    width: 250.0,
                    child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ), /* add child content here */
        ),
      ),
    );
  }


}
