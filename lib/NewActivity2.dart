import 'package:flutter/material.dart';

import 'main.dart';
class NewActivity2 extends StatelessWidget {
  NewActivity2({super.key});


  @override
  Widget build(BuildContext context)
  {
    final ButtonStyle buttonStyle=ElevatedButton.styleFrom(
      padding: EdgeInsets.all(10),
      backgroundColor: Colors.blueAccent,
      foregroundColor: Colors.white,
      textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("New Activity_2"),


      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(

              child:
              Column(
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeActivity()));
                  },
                    child:
                    Text("Go to Home Activity",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(

                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
                    ),

                  ),
                  SizedBox(height: 20,),

                  Card(
                    elevation: 5,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                        ),

                  )
                ],

              ),

            ),
          ]
      ),

    );

  }
}