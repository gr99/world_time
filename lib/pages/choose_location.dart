import 'package:world_time/services/world_time.dart';
import 'package:flutter/material.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}


class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(location: 'Mumbai',flag: 'india.png',url: 'Asia/Kolkata'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];
  void updateTime(int index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    //navigate back to home page by popoing up the data..
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Build State is called");
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: Text("Choose Location"),
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context,index)
        {
          return Card(child:
            ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),

            ));
        }
        ),
      )
      ,
    );
  }
}


