import 'package:doctor_appointment_app/Doctors%20List/doctors_list.dart';
import 'package:doctor_appointment_app/Models/doctor_list2_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FindDoctorDetails2 extends StatefulWidget {
  final DoctorListModel doctorDetails2;
  const FindDoctorDetails2({super.key , required this.doctorDetails2});

  @override
  State<FindDoctorDetails2> createState() => _FindDoctorDetails2State();
}

class _FindDoctorDetails2State extends State<FindDoctorDetails2> {
  TextEditingController diseaseName = TextEditingController();

  TextEditingController application = TextEditingController();

   final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Appointment Application",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Disease Name";
                  } else {
                    return null;
                  }
                },
                controller: diseaseName,
                cursorColor: Colors.blueGrey,
                decoration: const InputDecoration(
                  hintText: "Enter your Disease Name",
                  hintStyle: TextStyle(fontSize: 13,color: Colors.blueGrey),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.blueGrey))
                ),
              ),
              const SizedBox(height: 25,),
              TextFormField(
                 validator: (value) {
                  if (value!.isEmpty) {
                    return "Write an Application";
                  } else {
                    return null;
                  }
                },
                controller: application,
                maxLines: 7,
                cursorColor: Colors.blueGrey,
                decoration: InputDecoration(
                  hintText: "Write an Application for Appointment with ${widget.doctorDetails2.Name} :",
                  hintStyle: const TextStyle(fontSize: 13,color: Colors.blueGrey),
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(width: 2,color: Colors.blueGrey))
                ),
              ),
              const SizedBox(height: 25,),
              ElevatedButton(onPressed: (){
                if (
                  widget.doctorDetails2.diseaseList.isEmpty &&
                  widget.doctorDetails2.applicationList.isEmpty &&
                  _formkey.currentState!.validate()
                ) {
                  doctors_List.add(widget.doctorDetails2);
                  widget.doctorDetails2.diseaseList.add(diseaseName.text);
                  widget.doctorDetails2.applicationList.add(application.text);
                  Navigator.pop(context);
                  toaster_1();
                  setState(() {});
                  } else if (
                    widget.doctorDetails2.diseaseList.isNotEmpty &&
                    widget.doctorDetails2.applicationList.isNotEmpty) {
                    toaster();
                    setState(() {});
                  }
               setState(() {});
              },style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                          elevation: const WidgetStatePropertyAll(0),
                          backgroundColor: const WidgetStatePropertyAll(Colors.blue),
                        ), child: const Text("Sent Application",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)
            ],
          ),
        ),
      ),
    );
  }

  toaster(){
  Fluttertoast.showToast(
        msg: "Already Exist",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
}

  toaster_1(){
  Fluttertoast.showToast(
        msg: "Application sent Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0
    );
}
}