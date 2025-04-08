import 'package:flutter/material.dart';
import 'package:practice_flutter_app/Fragment/HomeFragment.dart';
import 'package:practice_flutter_app/NewActivity.dart';
import 'package:practice_flutter_app/api_integration.dart';
import 'package:practice_flutter_app/my_snackbar.dart';

import 'Fragment/ContactFragment.dart';
import 'Fragment/DashboardFragment.dart';
import 'Fragment/SearchFragment.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  ApiIntegration(),
    );
  }
}

class HomeActivity extends StatefulWidget {
   HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {



    @override
  Widget build(BuildContext context)
 {

   return Scaffold(
     appBar: AppBar(
       centerTitle: true,

       title: Text("Simple To-Do Task App"),



     ),

     body:

       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           children: [

             Center(
               child: ElevatedButton(onPressed: (){
                 MySnackBar("This is a snackbar", actionLabel: "Yes",
                      onActionPressed: () {
                   print("Retry clicked!"); // এখানে API কল বা অন্য কাজ করা যাবে
                 },
                 backgroundColor: Colors.blueAccent
                 )

                     .show(context);
               },
                   style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.blue
                   ),
                   child:
                   Text("Show Toast",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)


               ),
             ),

           ],
         ),
       ),

   );

 }
}


