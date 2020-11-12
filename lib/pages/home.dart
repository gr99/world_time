import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={ };
  String isDay;

  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty?data:ModalRoute.of(context).settings.arguments;

    isDay= data['isDaytime']? 'day.png': 'night.png';
    Color bgColor= data['isDaytime'] ? Colors.blue: Colors.indigo[900];
    print(data);

    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(child: Container(
        decoration: BoxDecoration(image: DecorationImage(
          image: AssetImage('asset/$isDay'),
          fit: BoxFit.cover
        )),
        child:         Padding(
          padding: const EdgeInsets.fromLTRB(0,120,0,0),
          child: SafeArea(
            child: Column(children: [
              FlatButton.icon(onPressed: ()async //here we get what we have pop...,,and new data
              {
                dynamic response=await Navigator.pushNamed(context, '/location');
                setState(() {
                  data={
                    'time':response['time'],
                    'location':response['location'],
                    'flag':response['flag'],
                    'isDaytime':response['isDaytime']
                  };
                });
              },
                  icon: Icon(Icons.edit_location,color: Colors.grey,),
                  label: Text("Edit Location",style: TextStyle(
                     color: Colors.grey
                  ),))
              ,SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data['location'],
                    style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                      color: Colors.white
                    ),),
                ],),
              SizedBox(height: 20),
              Text(data['time'],style: TextStyle(fontSize: 58,color: Colors.white),)
            ],),

          ),
        ),
      ),

      ),


    );
  }
}
