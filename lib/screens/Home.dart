import 'package:flutter/material.dart';
import 'package:tic/Parts/Constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
            title: Text("TaS"),
            backgroundColor: Colors.grey[400],
            actions:<Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: IconButton(
                      icon:Icon(
                        Icons.brightness_6,
                        size: 26.0,
                      ),
                      onPressed: (){
                        setState(() {
                        });
                      }
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: IconButton(
                      icon:Icon(
                        Icons.settings,
                        size: 26.0,
                      ),
                      onPressed: (){}
                  )
              ),
            ]

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Center (
                  child: Text('TaS',
                    style: TextStyle(
                      color: Colors.pink,
                      fontSize: 100,
                    ),
                  ),
                )
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Layout4');
              },
              color: Colors.black,
              textColor: Colors.white,
              child: Text("Start",
              ),
              hoverColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
