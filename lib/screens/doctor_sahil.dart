import 'package:doctor_appointment_app/Models/doctor_list2_model.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class doctorAppointmentDetails extends StatelessWidget {
  final DoctorListModel? doctorAppointmentList;
  const doctorAppointmentDetails({super.key, this.doctorAppointmentList});

  //bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                //selected = !selected;
                //setState(() {});
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(20),
               // duration: const Duration(seconds: 1),
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                  color: const Color.fromARGB(255, 35, 156, 255),
                  boxShadow: const [BoxShadow(color: Color.fromARGB(199, 0, 0, 0),blurRadius: 8)],
                 // gradient: LinearGradient(colors: [Colors.blue,Color.fromARGB(190, 115, 208, 247)]),
                ),
                child: Column(
                  mainAxisAlignment:  MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back,color: Colors.white,size: 30,)
                          ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Hero(
                          tag: doctorAppointmentList!.ProfilePic,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              boxShadow: [BoxShadow(color: Color.fromARGB(162, 0, 0, 0),blurRadius: 8)],
                              shape: BoxShape.circle,
                              color:  Color.fromARGB(73, 54, 155, 237),
                            ),
                            child: CircleAvatar(
                              backgroundImage: doctorAppointmentList!.ProfilePic,
                              radius: 45 ,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${doctorAppointmentList!.Name}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.white,),maxLines: 2,),
                            const SizedBox(height: 10,),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(width: 0.3),
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(147, 0, 0, 0),
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Text("${doctorAppointmentList!.Faculty}",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white,),maxLines: 2,)),
                              const SizedBox(height: 10,),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:  const Color.fromARGB(147, 0, 0, 0),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(Icons.star ,size: 17,color: Colors.amber,),
                                    const Icon(Icons.star ,size: 17,color: Colors.amber,),
                                    const Icon(Icons.star ,size: 17,color: Colors.amber,),
                                    const Icon(Icons.star ,size: 17,color: Colors.amber,),
                                    const Icon(Icons.star_border ,size: 17,color: Colors.amber,),
                                    const SizedBox(width: 6,),
                                    Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(20)
                                      ),
                                      child: Center(child: Text("${doctorAppointmentList!.Rating}",style: const TextStyle(color: Colors.white),))
                                      )
                                  ],
                                ),
                              ),
                              
                          ],
                        ),
                        const Spacer(),
                        // Column(
                        //   children: [
                        //     Container(
                        //       padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                        //       decoration: BoxDecoration(
                        //         border:  Border.all(color: const Color.fromARGB(255, 77, 101, 113)),
                        //         borderRadius: BorderRadius.circular(20),
                        //         color:  const Color.fromARGB(255, 60, 193, 255),
                        //       ),
                        //       child: Text("Upcoming",style: const TextStyle(fontSize: 13,color: Colors.white,fontWeight: FontWeight.w600),),
                        //     ),
                        //     const SizedBox(height: 10,),
                        //     Container(
                        //       padding: const EdgeInsets.all(8),
                        //        decoration: BoxDecoration(
                        //             border: Border.all(width: 0.3),
                        //             borderRadius: BorderRadius.circular(20),
                        //             color:  const Color.fromARGB(147, 0, 0, 0),
                        //           ),
                        //       child: Row(
                        //         children: [
                        //           Icon( Icons.location_on_rounded,color: Colors.white,size: 20,),
                        //           const SizedBox(width: 3,),
                        //           Text( "2.7" ,style: const TextStyle(fontSize: 9,fontWeight: FontWeight.w400,color: Colors.white),maxLines: 2,),
                        //         ],
                        //       ),
                        //     ),
                        //   ],
                        // )
                    ],
                  ),

                ],
              ),
              ),
            ),
            const SizedBox(height: 5,),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                         const Row(
                          children: [
                            Text("Appointment Details",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                          ],
                        ),
                        const SizedBox(height: 12,),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(39, 33, 149, 243),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 0.2,color: Colors.blue),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 80, 105, 118),fontWeight: FontWeight.w500),),
                        ),
                        const SizedBox(height: 20,),
                        const Row(
                          children: [
                            Text("Patient Disease : " ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue
                              ),
                              child: Center(child: Expanded(child: Text("${doctorAppointmentList!.diseaseList[0] ?? "Not Assigned"}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)))
                              ),
                          ],
                        ),
                        const SizedBox(height: 25,),
                        const Row(
                          children: [
                            Text("Patient Application : " ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(39, 33, 149, 243),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: 0.2,color: Colors.blue),
                          ),
                              child: Expanded(child: Text("${doctorAppointmentList!.applicationList[0] ?? "Not Assigned"}",style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 80, 105, 118),fontWeight: FontWeight.w500),))
                            ),
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: const Color.fromARGB(205, 33, 149, 243)
                              ),
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(39, 33, 149, 243),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(69, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: const Text("Appointment Date",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),)),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.calendar_month_rounded,color: Colors.blue,size: 30,),
                                    const SizedBox(width: 5,),
                                    Expanded(child: Text("${doctorAppointmentList!.Day}, ${doctorAppointmentList!.Date}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.blue),)),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all( 
                              width: 4,
                              color: const Color.fromARGB(205, 33, 149, 243)
                              ),
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(39, 33, 149, 243),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(69, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: const Text("Appointment Time",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),)),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.watch_later_outlined,color: Colors.blue,size: 30,),
                                    const SizedBox(width: 5,),
                                    Expanded(child: Text("${doctorAppointmentList!.Time}",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.blue),)),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}