
import 'package:flutter/material.dart';

class Town extends StatelessWidget {

  final String town;
  final String currentStatus;
  final String weatherStatus,dayStatus;

  Town({
    this.town,
    this.currentStatus,
    this.weatherStatus,
    this.dayStatus
  }):assert(town != null);

  @override
  Widget build(BuildContext context){
    return DefaultTextStyle(style: TextStyle(color: Colors.white),
      child:Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Section1(
            town:town
          ),
          Section2(
            weatherStatus:weatherStatus,
            dayStatus:dayStatus
          ),
          Section3(
            currentStatus: currentStatus
          )
        ],
      )
    ) ,
    );
    
  }
}

class Section1 extends StatelessWidget{

  final String town;

  Section1({
    this.town
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        town,
        style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),
      ),
    );
  }
}

class Section2 extends StatelessWidget{

  final String weatherStatus,dayStatus;

  Section2({
    this.weatherStatus,
    this.dayStatus
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
         Text(weatherStatus,style: TextStyle(fontSize: 20),),
         Text(dayStatus,style: TextStyle(fontSize: 20),)
      ],),
    );
  }
}

class Section3 extends StatelessWidget{

  final String currentStatus;
  
  Section3({
    this.currentStatus
  });

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(currentStatus,style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic)),
    );
  }
}
