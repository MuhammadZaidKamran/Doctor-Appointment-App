import 'package:doctor_appointment_app/Doctors%20List/doctors_list.dart';
import 'package:doctor_appointment_app/Screens/doctor_sahil.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.blue,
        title: const Text("Appointments",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: doctors_List.length,
        itemBuilder: (context,index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(35, 158, 158, 158)
              ),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Hero(
                        tag: doctors_List[index].ProfilePic,
                        child: CircleAvatar(backgroundImage: doctors_List[index].ProfilePic,radius: 35,)
                        ),
                      const SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("${doctors_List[index].Name}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        const SizedBox(height: 10,),
                        Text("${doctors_List[index].Faculty}"),
                      ],
                      ),
                      const Spacer(),
                      const Icon(Icons.star,color: Colors.amber,),
                      Center(
                        child: Text("${doctors_List[index].Rating}",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,),)
                        )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.black,width: 0.2))
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_month_rounded,size: 20,),
                        const SizedBox(width: 3,),
                        Expanded(child: Text("${doctors_List[index].Day}, ${doctors_List[index].Date}",style: const TextStyle(fontSize: 11),)),
                        const Spacer(),
                        const Icon(Icons.watch_later_outlined,size: 20,),
                        const SizedBox(width: 3,),
                        Expanded(child: Text("${doctors_List[index].Time}",style: const TextStyle(fontSize: 11),)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => doctorAppointmentDetails(doctorAppointmentList: doctors_List[index],)));
                    // if (doctors_List[index]["Name"] == "Dr.Sahil") {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorSahil()));
                    // } else if(doctors_List[index]["Name"] == "Dr.Kumar") {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorKumar()));
                    // } else if(doctors_List[index]["Name"] == "Dr.Aliya") {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorAliya()));
                    // }
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                    elevation: const WidgetStatePropertyAll(0),
                    backgroundColor: const WidgetStatePropertyAll(Color.fromARGB(39, 33, 149, 243)),
                    minimumSize: const WidgetStatePropertyAll(Size(250, 50)),
                    maximumSize: const WidgetStatePropertyAll(Size(300, 50)),
      
                  ), child: const Text("Details",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.blue),),)
                ],
              ),
            ),
          );
      }),
    );
  }
}