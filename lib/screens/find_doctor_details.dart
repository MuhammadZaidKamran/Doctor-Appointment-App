import 'package:doctor_appointment_app/Models/doctor_list2_model.dart';
import 'package:doctor_appointment_app/Screens/find_doctor_details_2.dart';
import 'package:flutter/material.dart';

class FindDoctorDetails extends StatelessWidget {
  final DoctorListModel doctorDetails;
  const FindDoctorDetails({super.key, required this.doctorDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Details",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Hero(
            tag: doctorDetails.ProfilePic.toString(),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                boxShadow: [BoxShadow(color: Colors.black,blurRadius: 8,blurStyle: BlurStyle.solid)]),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                child: Image(image: doctorDetails.ProfilePic,)
                ),
            ),
          ),
          const SizedBox(height: 15,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("${doctorDetails.Name}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    const Spacer(),
                    const Icon(Icons.star,color: Colors.amber,),
                    Text("${doctorDetails.Rating}"),
                  ],
                ),
                const SizedBox(height: 7,),
                Row(
                  children: [
                    Text("${doctorDetails.Faculty}",style: const TextStyle(fontSize: 15),)
                  ],
                ),
                const SizedBox(height: 30,),
                const Row(
                  children: [
                    Text("Description :",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 7,),
                Column(
                  children: [
                    Text("${doctorDetails.Description}")
                  ],
                ),
                const SizedBox(height: 30,),
                const Row(
                  children: [
                    Text("Available Time :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                      child: Text("${doctorDetails.Time}",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),))
                  ],
                ),
                const SizedBox(height: 30,),
                const Row(
                  children: [
                    Text("Available Date :",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),),
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color:  Colors.blue,
                      ),
                      child: Expanded(child: Text("${doctorDetails.Date} ,${doctorDetails.Day}" ,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),))),
                  ],
                ),
                const SizedBox(height: 30,),
                const Row(
                  children: [
                    Expanded(child: Text("Want to Apply for this Appointment ?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)),
                  ],
                ),
                const SizedBox(height: 25,),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FindDoctorDetails2(doctorDetails2: doctorDetails)));
                },style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        elevation: const WidgetStatePropertyAll(0),
                        backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                        minimumSize: const WidgetStatePropertyAll(Size(250, 50)),
                        maximumSize: const WidgetStatePropertyAll(Size(300, 50)),
                      ), 
                      child: const Expanded(
                  child: Text("Click to Apply",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),)
              ],
            ),
          )
        ],
      ),
    );
  }
}