import 'package:doctor_appointment_app/Doctors%20List/doctors_list.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  //final DoctorListModel doctorList;
  const DoctorDetails({super.key,});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                selected = !selected;
                setState(() {});
              },
              child: AnimatedContainer(
                alignment: selected ? Alignment.centerLeft : Alignment.bottomCenter,
                padding: selected ? const EdgeInsets.all(20) : const EdgeInsets.all(20),
                duration: const Duration(seconds: 1),
                height: selected ? 250 : 200,
                decoration: BoxDecoration(
                  border: selected ? Border.all() : null,
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50),bottomRight: Radius.circular(50)),
                  color: selected ? const Color.fromARGB(255, 35, 156, 255) : const Color.fromARGB(130, 54, 155, 237),
                  boxShadow: selected ? [const BoxShadow(color: Color.fromARGB(199, 0, 0, 0),blurRadius: 8)] : null,
                 // gradient: LinearGradient(colors: [Colors.blue,Color.fromARGB(190, 115, 208, 247)]),
                ),
                child: Column(
                  mainAxisAlignment: selected ? MainAxisAlignment.end : MainAxisAlignment.end ,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(selected ? Icons.arrow_back : null,color: Colors.white,size: 30,)
                          ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: selected ? MainAxisAlignment.start : MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            boxShadow: const [BoxShadow(color: Color.fromARGB(162, 0, 0, 0),blurRadius: 8)],
                            shape: BoxShape.circle,
                            color: selected ? const Color.fromARGB(73, 54, 155, 237) : const Color.fromARGB(255, 35, 156, 255)
                          ),
                          child: CircleAvatar(
                            backgroundImage: doctors_List[0].ProfilePic,
                            radius: selected ? 45 : 40,
                          ),
                        ),
                        selected ? const SizedBox(width: 10,) : const SizedBox(width: 0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(selected ? "${doctors_List[0].Name}" : "",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.white,),maxLines: 2,),
                            selected ? const SizedBox(height: 10,) : const SizedBox(height: 0,),
                            Container(
                              decoration: BoxDecoration(
                                border: selected ? Border.all(width: 0.3) : null,
                                borderRadius: BorderRadius.circular(20),
                                color: selected ? const Color.fromARGB(147, 0, 0, 0) : null,
                              ),
                              padding: selected ? const EdgeInsets.all(10) : null,
                              child: Text(selected ? "${doctors_List[0].Faculty}" : "",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.white,),maxLines: 2,)),
                              const SizedBox(height: 10,),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: selected ? const Color.fromARGB(147, 0, 0, 0) : null,
                                ),
                                child: Row(
                                  children: [
                                    Icon(selected ? Icons.star : null,size: 17,color: Colors.amber,),
                                    Icon(selected ? Icons.star : null,size: 17,color: Colors.amber,),
                                    Icon(selected ? Icons.star : null,size: 17,color: Colors.amber,),
                                    Icon(selected ? Icons.star : null,size: 17,color: Colors.amber,),
                                    Icon(selected ? Icons.star_border : null,size: 17,color: Colors.amber,),
                                    const SizedBox(width: 8,),
                                     Text(selected ? "${doctors_List[0].Rating}" : "",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.white),maxLines: 2,),
                                  ],
                                ),
                              ),
                              
                          ],
                        ),
                        selected ? const Spacer() : const SizedBox(width: 0,),
                        selected ? const SizedBox(height: 10,) : const SizedBox(height: 0,),
                        // Container(
                        //   padding: const EdgeInsets.all(8),
                        //    decoration: BoxDecoration(
                        //         border: selected ? Border.all(width: 0.3) : null,
                        //         borderRadius: BorderRadius.circular(20),
                        //         color: selected ? const Color.fromARGB(147, 0, 0, 0) : null,
                        //       ),
                        //   child: Row(
                        //     children: [
                        //       Icon(selected ? Icons.location_on_rounded : null,color: Colors.white,size: 20,),
                        //       selected ? const SizedBox(width: 3,) : const SizedBox(width: 0,),
                             
                        //     ],
                        //   ),
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
                              child: Center(child: Expanded(child: Text("${doctors_List[0].diseaseList[0] ?? "Not Assigned"}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)))
                              ),
                          ],
                        ),
                      const SizedBox(height: 20,),
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
                              child: Expanded(child: Text("${doctors_List[0].applicationList[0] ?? "Not Assigned"}",style: const TextStyle(fontSize: 16,color: Color.fromARGB(255, 80, 105, 118),fontWeight: FontWeight.w500),))
                            ),
                          ],
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
                                  child: const Text("Appointment Date",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),)),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.calendar_month_rounded,color: Color.fromARGB(255, 215, 198, 47),size: 30,),
                                  const SizedBox(width: 5,),
                                  Expanded(child: Text("${doctors_List[0].Day}, ${doctors_List[0].Date}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 215, 198, 47)),)),
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
                                  Expanded(child: Text("${doctors_List[0].Time}",style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.blue),)),
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