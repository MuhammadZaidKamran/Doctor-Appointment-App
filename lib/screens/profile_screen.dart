import 'dart:typed_data';
import 'package:doctor_appointment_app/Extras/data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:doctor_appointment_app/Doctors%20List/doctors_list.dart';
//import 'package:doctor_appointment_app/utils/data.dart';
import 'package:doctor_appointment_app/Services/upload_service.dart';
import 'package:doctor_appointment_app/Screens/doctor_details.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String isImageUpload = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (doctors_List.isEmpty) {
       return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Account",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async{
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                     setState(() {
                      isLoading = true;
                     });
                    Uint8List bytes = await image.readAsBytes();
                    UploadService().uploadImage(bytes, image.name).then((value) {
                     setState(() {
                      isImageUpload = value['location'].toString();
                      isLoading = false;
                     });
                    }).onError((error, stackTrace) {
                     setState(() {
                      isLoading = true;
                     });
                   });
                   }
                  },
                  child: isLoading ? CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(isImageUpload),
                  ) : const Icon(Icons.account_circle,size: 80,
                  )
                  )
                //Icon(Icons.account_circle,color: Colors.lightBlue,size: 80,)
              ],
            ),
            //SizedBox(height: 10,),
            //Expanded(child: Text("${userName.firstOrNull}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
            const SizedBox(height: 20,),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Account Details",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(59, 158, 158, 158),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Username :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      const SizedBox(width: 10,),
                      Expanded(child: Text("${userName.firstOrNull}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text("Email :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      const SizedBox(width: 10,),
                      Expanded(child: Text("${userEmail.firstOrNull}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text("Password :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      const SizedBox(width: 10,),
                      Expanded(child: Text("${userPassword.firstOrNull}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            // Row(
            //   children: [
            //     Text("Upcoming Appointment",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            //   ],
            // ),
            // SizedBox(height: 20,),
            // GestureDetector(
            //       onTap: () {
            //         Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorDetails()));
            //       },
            //       child: Column(
            //         children: [
            //           Container(
            //             padding: const EdgeInsets.all(25),
            //             decoration: BoxDecoration(
            //               //gradient: const LinearGradient(colors: [Colors.blue,Color.fromARGB(255, 115, 207, 247)]),
            //               color: Color.fromARGB(47, 158, 158, 158),
            //               borderRadius: BorderRadius.circular(20),
            //              // boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 5)]
            //             ),
            //             height: 180,
            //             child: Column(
            //               children: [
            //                  Row(
            //                   children: [
            //                     CircleAvatar(
            //                     backgroundImage: doctors_List[0].ProfilePic,
            //                     radius: 30,
            //                     ),
            //                     SizedBox(width: 15,),
            //                     Column(
            //                       crossAxisAlignment: CrossAxisAlignment.start,
            //                       children: [
            //                         Text("${doctors_List[0].Name ?? "Not Available"}",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),),
            //                         SizedBox(height: 3,),
            //                         Text("${doctors_List[0].Faculty ?? "Not Available"}",style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w300),),
            //                       ],
            //                     ),
            //                     Spacer(),
            //                     Icon(Icons.arrow_forward_ios_rounded,size: 30,color: Colors.black,),
            //                   ],
            //                 ),
            //                 const Spacer(),
            //                 Container(
            //                   decoration: const BoxDecoration(
            //                     border: Border(top: BorderSide(width: 0.6,color: Colors.black))
            //                   ),
            //                   padding: const EdgeInsets.only(top: 18),
            //                   child:  Row(
            //                     children: [
            //                       Icon(Icons.calendar_month_rounded,color: Colors.blue,),
            //                       SizedBox(width: 5,),
            //                       Expanded(child: Text("${doctors_List[0].Day}, ${doctors_List[0].Date}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.blue),)),
            //                       Spacer(),
            //                       Icon(Icons.access_time,color: Colors.blue),
            //                       SizedBox(width: 5,),
            //                       Expanded(child: Text("${doctors_List[0].Time}",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.blue),))
            //                     ],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //     SizedBox(height: 20,),
                const Row(
                  children: [
                    Text("Near Doctor",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 15,),
                Column(
                   children: [
                     Container(
                       padding: const EdgeInsets.all(25),
                       decoration: BoxDecoration(
                         color: const Color.fromARGB(47, 158, 158, 158),
                         borderRadius: BorderRadius.circular(20),
                       ),
                       height: 180,
                       child: Column(
                         children: [
                           const Row(
                             children: [
                               CircleAvatar(
                               backgroundImage: AssetImage("assets/Images/doctor.webp"),
                               radius: 30,
                               ),
                               SizedBox(width: 15,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Dr.Joseph Brostito",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600),),
                                   SizedBox(height: 3,),
                                   Text("Dental Specialist",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w200),),
                                 ],
                               ),
                               Spacer(),
                               Row(
                                 children: [
                                   Icon(Icons.location_on_outlined,size: 20,color: Colors.blueGrey,),
                                   Text("1.2 KM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),
                                 ],
                               )
                             ],
                           ),
                           const Spacer(),
                           Container(
                             decoration: const BoxDecoration(
                               border: Border(top: BorderSide(width: 0.3,color: Colors.black))
                             ),
                             padding: const EdgeInsets.only(top: 18),
                             child: const Row(
                               children: [
                                 Icon(Icons.calendar_month_rounded,color: Color.fromARGB(255, 212, 196, 49),),
                                 SizedBox(width: 5,),
                                 Text("Friday, 10 June",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 184, 170, 41)),),
                                 Spacer(),
                                 Icon(Icons.access_time,color: Colors.blue,),
                                 SizedBox(width: 5,),
                                 Text("Open at 17:00",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.blue),)
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                     const SizedBox(height: 20,),
                     GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(43, 158, 158, 158),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 180,
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                backgroundImage: AssetImage("assets/Images/doctor_3.webp"),
                                radius: 30,
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Dr.Babe Didrikson",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600),),
                                      SizedBox(height: 3,),
                                      Text("Phsychologist",style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w300),),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                // Row(
                                //   children: [
                                //     Icon(Icons.location_on_outlined,size: 20,color: Colors.blueGrey,),
                                //     Text("2.6 KM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),
                                //   ],
                                // )
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(top: BorderSide(width: 0.3,color: Colors.black))
                              ),
                              padding: const EdgeInsets.only(top: 18),
                              child: const Row(
                                children: [
                                  Icon(Icons.calendar_month_rounded,color: Color.fromARGB(255, 212, 196, 49),),
                                  SizedBox(width: 5,),
                                  Text("Saturday, 11 June",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 184, 170, 41)),),
                                  Spacer(),
                                  Icon(Icons.access_time,color: Colors.blue,),
                                  SizedBox(width: 5,),
                                  Text("Open at 21:00",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.blue),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                   ],
                 ),
          ],
        ),
      ),
    );

    } else {
      return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Account",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.blue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async{
                    final ImagePicker picker = ImagePicker();
                    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                     setState(() {
                      isLoading = true;
                     });
                    Uint8List bytes = await image.readAsBytes();
                    UploadService().uploadImage(bytes, image.name).then((value) {
                     setState(() {
                      isImageUpload = value['location'].toString();
                      isLoading = false;
                     });
                    }).onError((error, stackTrace) {
                     setState(() {
                      isLoading = true;
                     });
                   });
                   }
                  },
                  child: isLoading ? CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(isImageUpload),
                  ) : const Icon(Icons.account_circle,size: 80,),
                  )
                //Icon(Icons.account_circle,color: Colors.lightBlue,size: 80,)
              ],
            ),
            //SizedBox(height: 10,),
            //Expanded(child: Text("${userName.firstOrNull}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
            const SizedBox(height: 20,),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Account Details",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(59, 158, 158, 158),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Username :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      const SizedBox(width: 10,),
                      Expanded(child: Text("${userName.firstOrNull}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text("Email :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      const SizedBox(width: 10,),
                      Expanded(child: Text("${userEmail.firstOrNull}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                  const Divider(),
                  Row(
                    children: [
                      const Text("Password :",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      const SizedBox(width: 10,),
                      Expanded(child: Text("${userPassword.firstOrNull}",style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const Row(
              children: [
                Text("Upcoming Appointment",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              ],
            ),
            const SizedBox(height: 20,),
            GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorDetails()));
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          //gradient: const LinearGradient(colors: [Colors.blue,Color.fromARGB(255, 115, 207, 247)]),
                          color: const Color.fromARGB(47, 158, 158, 158),
                          borderRadius: BorderRadius.circular(20),
                         // boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 5)]
                        ),
                        height: 180,
                        child: Column(
                          children: [
                             Row(
                              children: [
                                CircleAvatar(
                                backgroundImage: doctors_List[0].ProfilePic,
                                radius: 30,
                                ),
                                const SizedBox(width: 15,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(doctors_List[0].Name ?? "Not Available",style: const TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w600),),
                                    const SizedBox(height: 3,),
                                    Text(doctors_List[0].Faculty ?? "Not Available",style: const TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w300),),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(Icons.arrow_forward_ios_rounded,size: 30,color: Colors.black,),
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(top: BorderSide(width: 0.6,color: Colors.black))
                              ),
                              padding: const EdgeInsets.only(top: 18),
                              child:  Row(
                                children: [
                                  const Icon(Icons.calendar_month_rounded,color: Colors.blue,),
                                  const SizedBox(width: 5,),
                                  Expanded(child: Text("${doctors_List[0].Day}, ${doctors_List[0].Date}",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.blue),)),
                                  const Spacer(),
                                  const Icon(Icons.access_time,color: Colors.blue),
                                  const SizedBox(width: 5,),
                                  Expanded(child: Text("${doctors_List[0].Time}",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.blue),))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                const Row(
                  children: [
                    Text("Near Doctor",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 15,),
                Column(
                   children: [
                     Container(
                       padding: const EdgeInsets.all(25),
                       decoration: BoxDecoration(
                         color: const Color.fromARGB(47, 158, 158, 158),
                         borderRadius: BorderRadius.circular(20),
                       ),
                       height: 180,
                       child: Column(
                         children: [
                           const Row(
                             children: [
                               CircleAvatar(
                               backgroundImage: AssetImage("assets/Images/doctor.webp"),
                               radius: 30,
                               ),
                               SizedBox(width: 15,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Dr.Joseph Brostito",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600),),
                                   SizedBox(height: 3,),
                                   Text("Dental Specialist",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w200),),
                                 ],
                               ),
                               Spacer(),
                               Row(
                                 children: [
                                   Icon(Icons.location_on_outlined,size: 20,color: Colors.blueGrey,),
                                   Text("1.2 KM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),
                                 ],
                               )
                             ],
                           ),
                           const Spacer(),
                           Container(
                             decoration: const BoxDecoration(
                               border: Border(top: BorderSide(width: 0.3,color: Colors.black))
                             ),
                             padding: const EdgeInsets.only(top: 18),
                             child: const Row(
                               children: [
                                 Icon(Icons.calendar_month_rounded,color: Color.fromARGB(255, 212, 196, 49),),
                                 SizedBox(width: 5,),
                                 Text("Friday, 10 June",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 184, 170, 41)),),
                                 Spacer(),
                                 Icon(Icons.access_time,color: Colors.blue,),
                                 SizedBox(width: 5,),
                                 Text("Open at 17:00",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.blue),)
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                     const SizedBox(height: 20,),
                     GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(43, 158, 158, 158),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: 180,
                        child: Column(
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                backgroundImage: AssetImage("assets/Images/doctor_3.webp"),
                                radius: 30,
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Dr.Babe Didrikson",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600),),
                                      SizedBox(height: 3,),
                                      Text("Phsychologist",style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w300),),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                // Row(
                                //   children: [
                                //     Icon(Icons.location_on_outlined,size: 20,color: Colors.blueGrey,),
                                //     Text("2.6 KM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),
                                //   ],
                                // )
                              ],
                            ),
                            const Spacer(),
                            Container(
                              decoration: const BoxDecoration(
                                border: Border(top: BorderSide(width: 0.3,color: Colors.black))
                              ),
                              padding: const EdgeInsets.only(top: 18),
                              child: const Row(
                                children: [
                                  Icon(Icons.calendar_month_rounded,color: Color.fromARGB(255, 212, 196, 49),),
                                  SizedBox(width: 5,),
                                  Text("Saturday, 11 June",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 184, 170, 41)),),
                                  Spacer(),
                                  Icon(Icons.access_time,color: Colors.blue,),
                                  SizedBox(width: 5,),
                                  Text("Open at 21:00",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.blue),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                   ],
                 ),
          ],
        ),
      ),
    );
    }
  }
}