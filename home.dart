
import 'dart:math';

import 'package:bmi/result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   var age=30;
   var weight=75;
   double value=120;

   bool v=true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:const Text('BMI calculator'),),
      body:Column(
        children:
        [
         Expanded(
           child: Padding(
             padding:EdgeInsets.all(20.0),
             child: Row(
               children: [

                 Expanded(
                   child: GestureDetector(
                      onTap: ()
                      {
                        setState(()
                        {
                         v=true;
                        });
                      },
                     child: Container(
                       decoration: BoxDecoration(color: v?Colors.blue:Colors.grey,
                       borderRadius: BorderRadius.circular(10.0)
                       ),


                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children:  const [
                          Image(image: AssetImage('images/male.png'),
                          width: 100,
                          height: 100,
                           ),
                           Text('Male',
                          style: TextStyle(
                            fontSize: 20
                          ), )
                         ],
                       ),
                     ),
                   ),
                 ),
                 SizedBox(width: 20,),
                 Expanded(
                   child: GestureDetector(
                     onTap: ()
                     {
                       setState(()
                       {
                        v=false;
                       });
                     },
                     child: Container(
                       decoration: BoxDecoration(color:v? Colors.grey : Colors.blue,
                       borderRadius: BorderRadius.circular(10.0),
                       ),

                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: const [
                           Image(image: AssetImage('images/female2.png'),
                             width: 100,
                             height: 100,
                           ),
                           Text('Female',
                          style: TextStyle(
                            fontSize: 20
                          ), )
                         ],
                       ),
                     ),
                   ),
                 ),

               ],
             ),
           )
         ),
         Expanded(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0),
             child: Container(
               decoration: BoxDecoration(color: Colors.grey,
               borderRadius: BorderRadius.circular(10.0),
               ),
               child: Column(mainAxisAlignment: MainAxisAlignment.center,
                 children: [

                   const Text('Height',
                   style: TextStyle(fontSize:20.0,
                   fontWeight:FontWeight.w900 ),),
                   Row(
                       mainAxisAlignment:MainAxisAlignment.center ,
                     children:[
                       Text('${value.round()}',
                     style: TextStyle(fontSize:20.0,
                     fontWeight:FontWeight.w900 ),),
                       Text('cm',
                     style: TextStyle(fontSize:20.0,
                     fontWeight:FontWeight.w900 ),),
                     ]
                   ),

                   Slider(
                       max:220,
                       value:value,
                       min: 50,
                       onChanged: (double newValue) {
                               setState(() {
                                    value=newValue;
                               });
                               }
                   )
                 ],
               ),
             ),
           )
         ),
         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(20.0),
             child:Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Expanded(
                     child: Container(


                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment:CrossAxisAlignment.center ,
                         children: [
                           const Text('Age',
                           style: TextStyle(fontWeight: FontWeight.w900,
                           fontSize: 20.0),
                           ),
                           Text('$age',
                           style:const TextStyle(fontSize: 20.0,
                           fontWeight: FontWeight.w900),),
                           Row(mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(

                                 onPressed: (){
                                   setState(() {
                                     age++;
                                   });
                                 },
                                 heroTag: 'plus age',
                                 child: const Icon(Icons.add),
                               ),
                               FloatingActionButton(heroTag: 'minus age',
                                 onPressed: (){
                                   setState(() {
                                     age--;
                                   });
                                 },
                                 child: const Icon(Icons.remove),
                               ),
                             ],
                           )

                         ],

                       ),
                               decoration: BoxDecoration(color: Colors.grey,
    borderRadius: BorderRadius.circular(10.0)),
                     ),
                   ),
                   const SizedBox(width:20.0 ,),
                   Expanded(
                     child: Container(decoration: BoxDecoration(color: Colors.grey,
                     borderRadius: BorderRadius.circular(10.0)),
                       child: Column(
                         mainAxisAlignment:MainAxisAlignment.center,
                         crossAxisAlignment:CrossAxisAlignment.center ,
                         children: [
                          const Text('Weight',
                          style: TextStyle(fontWeight: FontWeight.w900,
                          fontSize: 20.0),),
                           Text('$weight',
                           style: const TextStyle(fontSize: 20.0,
                           fontWeight: FontWeight.w900),
                           ),
                           Row(mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               FloatingActionButton(

                                 onPressed: (){
                                   setState(() {
                                     weight++;
                                   });
                                 },
                                 heroTag: 'Plus weight',
                                 child: const Icon(Icons.add),
                               ),
                               FloatingActionButton(heroTag: 'minus weight',
                                 onPressed: (){
                                   setState(() {
                                     weight--;
                                   });
                                 },
                                 child: const Icon(Icons.remove),
                               ),
                             ],
                           )

                         ],
                       ),
                     ),
                   ),
                 ],
               ),

             ),
           ),

         MaterialButton(color: Colors.blue,
             height: 50.0,
             minWidth: double.infinity,
             child: const Text('CALCULATE',
             style: TextStyle(color: Colors.white),),
             onPressed:() {
               var result = weight/ pow(value/100, 2) ;
               Navigator.push(context, MaterialPageRoute(builder:
               (context)
               => ResultScreen(isMale: v, age: age, result: result.round())

               )
               );
             }

         )
        ],
      )

    );

  }

}
