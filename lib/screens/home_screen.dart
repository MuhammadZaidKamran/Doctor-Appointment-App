
import 'package:doctor_appointment_app/Doctors%20List/doctors_list.dart';
import 'package:doctor_appointment_app/Extras/data.dart';
//import 'package:doctor_appointment_app/utils/data.dart';
import 'package:doctor_appointment_app/Screens/doctor_details.dart';
import 'package:doctor_appointment_app/Screens/find_doctors_screen.dart';
import 'package:doctor_appointment_app/Screens/health_issues_screen.dart';
import 'package:doctor_appointment_app/Screens/profile_screen.dart';
import 'package:doctor_appointment_app/Screens/schedule_screen.dart';
import 'package:doctor_appointment_app/search_bar/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // bool isLoading = true;

  // List<DoctorListModel> items = [];

  // callData() {
  //   setState(() {
  //     doctors_List = items;
  //   });
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  // @override
  // void initState() {
  //   callData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    if (doctors_List.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
          ),
          leading: Builder(builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: const Icon(Icons.menu,color: Colors.white,))),
          backgroundColor: Colors.blue,
          title: const Text("Home",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
          centerTitle: true,
        ),
       drawer: Drawer(
        child: Container(
          // padding: EdgeInsets.all(25),
           margin: const EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.only(top: 0),
                child: Row(
                  children: [
                    const Icon(Icons.account_circle,size: 65,),
                    const SizedBox(width: 10,),
                    Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("${userName.firstOrNull}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                                IconButton(onPressed: (){
                                 // Navigator.push(context, MaterialPageRoute(builder: (context) => const DrawerEdit()));
                                }, icon: const Icon(Icons.mode_edit_outlined,color: Colors.white,))
                              ],
                            ),
                            Text("${userEmail.firstOrNull}",style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.white),),
                            
                          ],
                        ),
                  ],
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     //Navigator.push(context, MaterialPageRoute(builder: (context) => const ExplorePage()));
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.2))),
              //     padding: EdgeInsets.all(20),
              //     child: Row(
              //       children: [
              //         Icon(Icons.manage_search_rounded,size: 30,),
              //         SizedBox(width: 10,),
              //         Text("Explore",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
              //         Spacer(),
              //         Icon(Icons.arrow_forward_ios_rounded,size: 20,),
              //       ],
              //     ),
              //   ),
              // ),
          
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ScheduleScreen()));
                },
                child: Container(
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 0.2))),
                  padding: const EdgeInsets.all(20),
                  child: const Row(
                    children: [
                      Icon(Icons.calendar_month,size: 30,),
                      SizedBox(width: 10,),
                      Text("Appointments",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded,size: 20,),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                },
                child: Container(
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 0.2))),
                  padding: const EdgeInsets.all(20),
                  child: const Row(
                    children: [
                      Icon(Icons.account_circle_outlined,size: 30,),
                      SizedBox(width: 10,),
                      Text("Account",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded,size: 20,),
                    ],
                  ),
                ),
              ),
          
            ],
          ),
        ),
       ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
            child: Column(
              children: [
                Row(
                 // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // IconButton(onPressed: (){
                    //   // Drawer(
                    //   //   child: Container(),
                    //   // );
                    //   // setState(() {});
                    // }, icon: const Icon(Icons.account_circle_rounded,size: 45,color: Colors.blueGrey,)),
                    //    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Hello"),
                        Text("Hi, ""${userName.firstOrNull}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                      ],
                    ),
                  ],
                ),
               // const SizedBox(height: 40,),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorDetails()));
                //   },
                //   child: Column(
                //     children: [
                //       Container(
                //         padding: const EdgeInsets.all(25),
                //         decoration: BoxDecoration(
                //           gradient: const LinearGradient(colors: [Colors.blue,Color.fromARGB(255, 115, 207, 247)]),
                //           color: const Color.fromARGB(220, 34, 150, 244),
                //           borderRadius: BorderRadius.circular(20),
                //           boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 5)]
                //         ),
                //         height: 180,
                //         child: Column(
                //           children: [
                //              Row(
                //               children: [
                //                 CircleAvatar(
                //                 backgroundImage: AssetImage("assets/Images/doctor_2.webp"),
                //                 radius: 30,
                //                 ),
                //                 SizedBox(width: 15,),
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text("${doctors_List[0].Name ?? "Not Available"}",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),
                //                     SizedBox(height: 3,),
                //                     Text("${doctors_List[0].Faculty ?? "Not Available"}",style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w300),),
                //                   ],
                //                 ),
                //                 Spacer(),
                //                 Icon(Icons.arrow_forward_ios_rounded,size: 30,color: Colors.white,),
                //               ],
                //             ),
                //             const Spacer(),
                //             Container(
                //               decoration: const BoxDecoration(
                //                 border: Border(top: BorderSide(width: 0.6,color: Colors.white))
                //               ),
                //               padding: const EdgeInsets.only(top: 18),
                //               child: const Row(
                //                 children: [
                //                   Icon(Icons.calendar_month_rounded,color: Color.fromARGB(215, 255, 255, 255),),
                //                   SizedBox(width: 5,),
                //                   Text("Sunday, 12 June",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.white),),
                //                   Spacer(),
                //                   Icon(Icons.access_time,color: Color.fromARGB(217, 255, 255, 255),),
                //                   SizedBox(width: 5,),
                //                   Text("11:00 - 12:00 AM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.white),)
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                const SizedBox(height: 20,),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       TextButton(onPressed: (){},style: ButtonStyle(
                //         backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(36, 33, 149, 243)),
                //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                //         padding: const MaterialStatePropertyAll(EdgeInsets.all(10))
                //       ), child: const Text("Upcoming schedule",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 26, 136, 225)),),
                //       ),
                //       const SizedBox(width: 10,),
                //       TextButton(onPressed: (){},style: ButtonStyle(
                //         backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(36, 33, 149, 243)),
                //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                //         padding: const MaterialStatePropertyAll(EdgeInsets.all(10))
                //       ), child: const Text("Cancelled schedule",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 26, 136, 225)),),
                //       ),
                //       const SizedBox(width: 10,),
                //       TextButton(onPressed: (){},style: ButtonStyle(
                //         backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(36, 33, 149, 243)),
                //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                //         padding: const MaterialStatePropertyAll(EdgeInsets.all(10))
                //       ), child: const Text("Completed schedule",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 26, 136, 225)),),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 20,),
                SearchBar(
                 onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Search_Bar()));
                 },
                 leading: const Icon(Icons.search_rounded,size: 25,), 
                 padding: const WidgetStatePropertyAll(EdgeInsets.all(8)), 
                 shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))), 
                 hintText: "Search doctor or health issue",
                ),
                const SizedBox(height: 30,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FindDoctors()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 180,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(33, 158, 158, 158),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person_rounded,color: Colors.blue,size: 32,),
                              SizedBox(width: 5,),
                              Text("Doctor",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HealthIssues()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 180,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(34, 158, 158, 158),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.medication_rounded,color: Colors.blue,size: 32,),
                              SizedBox(width: 5,),
                              Text("Health Issues",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w500),maxLines: 2,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                const Row(
                  children: [
                    Text("Near Doctor",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  ],
                ),
                const SizedBox(height: 25,),
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
                                backgroundImage: AssetImage("assets/Images/doctor.webp"),
                                radius: 30,
                                ),
                                SizedBox(width: 15,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Dr.Joseph Brostito",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600),),
                                      SizedBox(height: 3,),
                                      Text("Dental Specialist",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w200),),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                // Row(
                                //   children: [
                                //     Icon(Icons.location_on_outlined,size: 20,color: Colors.blueGrey,),
                                //     Text("1.2 KM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),
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
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25,),
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
                                      Text("Phsychologist",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w200),),
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
          ),
        )
      );
    } else {
      double screenHeight = MediaQuery.of(context).size.height;
      return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
          ),
          leading: Builder(builder: (context) => IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: const Icon(Icons.menu,color: Colors.white,))),
          backgroundColor: Colors.blue,
          title: const Text("Home",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
          centerTitle: true,
        ),
       drawer: Drawer(
        child: Container(
          // padding: EdgeInsets.all(25),
           margin: const EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Container(
                color: Colors.blue,
                padding: const EdgeInsets.all(30),
                margin: const EdgeInsets.only(top: 0),
                child: Row(
                  children: [
                    const Icon(Icons.account_circle,size: 65,),
                    const SizedBox(width: 10,),
                    Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("${userName.firstOrNull}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.white),),
                                IconButton(onPressed: (){
                                 // Navigator.push(context, MaterialPageRoute(builder: (context) => const DrawerEdit()));
                                }, icon: const Icon(Icons.mode_edit_outlined,color: Colors.white,))
                              ],
                            ),
                            Text("${userEmail.firstOrNull}",style: const TextStyle(fontSize: 11,fontWeight: FontWeight.w400,color: Colors.white),),
                            
                          ],
                        ),
                  ],
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     //Navigator.push(context, MaterialPageRoute(builder: (context) => const ExplorePage()));
              //   },
              //   child: Container(
              //     decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.2))),
              //     padding: EdgeInsets.all(20),
              //     child: Row(
              //       children: [
              //         Icon(Icons.manage_search_rounded,size: 30,),
              //         SizedBox(width: 10,),
              //         Text("Explore",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
              //         Spacer(),
              //         Icon(Icons.arrow_forward_ios_rounded,size: 20,),
              //       ],
              //     ),
              //   ),
              // ),
          
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ScheduleScreen()));
                },
                child: Container(
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 0.2))),
                  padding: const EdgeInsets.all(20),
                  child: const Row(
                    children: [
                      Icon(Icons.calendar_month,size: 30,),
                      SizedBox(width: 10,),
                      Text("Appointments",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded,size: 20,),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                },
                child: Container(
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(width: 0.2))),
                  padding: const EdgeInsets.all(20),
                  child: const Row(
                    children: [
                      Icon(Icons.account_circle_outlined,size: 30,),
                      SizedBox(width: 10,),
                      Text("Account",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded,size: 20,),
                    ],
                  ),
                ),
              ),
          
            ],
          ),
        ),
       ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Hello"),
                        Text("Hi, ""${userName.firstOrNull}",style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                      ],
                    ),
                    // const Spacer(),
                    // IconButton(onPressed: (){}, icon: const Icon(Icons.account_circle_rounded,size: 55,color: Colors.blueGrey,))
                  ],
                ),
                const SizedBox(height: 10,),
                const Row(
                  children: [
                    Text("Upcoming Appointment",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  ],
                ),
                const SizedBox(height: 25,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DoctorDetails()));
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [Colors.blue,Color.fromARGB(255, 115, 207, 247)]),
                          color: const Color.fromARGB(220, 34, 150, 244),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 5)]
                        ),
                        height: screenHeight * 0.25,
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
                                    Text(doctors_List[0].Name ?? "Not Available",style: const TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.w600),),
                                    const SizedBox(height: 3,),
                                    Text(doctors_List[0].Faculty ?? "Not Available",style: const TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w300),),
                                  ],
                                ),
                                const Spacer(),
                                const Icon(Icons.arrow_forward_ios_rounded,size: 30,color: Colors.white,),
                              ],
                            ),
                            //const Spacer(),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: const BoxDecoration(
                                border: Border(top: BorderSide(width: 0.6,color: Colors.white))
                              ),
                              padding: const EdgeInsets.only(top: 18),
                              child:  Row(
                                children: [
                                  const Icon(Icons.calendar_month_rounded,color: Color.fromARGB(215, 255, 255, 255),),
                                  const SizedBox(width: 5,),
                                  Text("${doctors_List[0].Date}",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.white),),
                                  const Spacer(),
                                  const Icon(Icons.access_time,color: Color.fromARGB(217, 255, 255, 255),),
                                  const SizedBox(width: 5,),
                                  Expanded(child: Text("${doctors_List[0].Time}",style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.white),))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30,),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       TextButton(onPressed: (){},style: ButtonStyle(
                //         backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(36, 33, 149, 243)),
                //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                //         padding: const MaterialStatePropertyAll(EdgeInsets.all(10))
                //       ), child: const Text("Upcoming schedule",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 26, 136, 225)),),
                //       ),
                //       const SizedBox(width: 10,),
                //       TextButton(onPressed: (){},style: ButtonStyle(
                //         backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(36, 33, 149, 243)),
                //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                //         padding: const MaterialStatePropertyAll(EdgeInsets.all(10))
                //       ), child: const Text("Cancelled schedule",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 26, 136, 225)),),
                //       ),
                //       const SizedBox(width: 10,),
                //       TextButton(onPressed: (){},style: ButtonStyle(
                //         backgroundColor: const MaterialStatePropertyAll(Color.fromARGB(36, 33, 149, 243)),
                //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                //         padding: const MaterialStatePropertyAll(EdgeInsets.all(10))
                //       ), child: const Text("Completed schedule",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color.fromARGB(255, 26, 136, 225)),),
                //       ),
                //     ],
                //   ),
                // ),
                // const SizedBox(height: 20,),
                SearchBar(
                 onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Search_Bar()));
                 },
                 leading: const Icon(Icons.search_rounded,size: 25,), 
                 padding: const WidgetStatePropertyAll(EdgeInsets.all(8)), 
                 shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))), 
                 hintText: "Search doctor or health issue",
                ),
                const SizedBox(height: 30,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FindDoctors()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 180,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(33, 158, 158, 158),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.person_rounded,color: Colors.blue,size: 32,),
                              SizedBox(width: 5,),
                              Text("Doctor",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w500),)
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HealthIssues()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 180,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(34, 158, 158, 158),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.medication_rounded,color: Colors.blue,size: 32,),
                              SizedBox(width: 5,),
                              Text("Health Issues",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w500),maxLines: 2,)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25,),
                const Row(
                  children: [
                    Text("Near Doctor",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  ],
                ),
                const SizedBox(height: 25,),
                 Column(
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
                               backgroundImage: AssetImage("assets/Images/doctor.webp"),
                               radius: 30,
                               ),
                               SizedBox(width: 15,),
                               Expanded(
                                 child: Column(
                                   children: [
                                     Text("Dr.Joseph Brostito",style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w600),),
      
                                     Text("Dental Specialist",style: TextStyle(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w300),),
                                   ],
                                 ),
                               ),
                               Spacer(),
                              //  Expanded(
                              //    child: Row(
                              //      children: [
                              //        Icon(Icons.location_on_outlined,size: 20,color: Colors.blueGrey,),
                              //        Text("1.2 KM",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300),),
                              //      ],
                              //    ),
                              //  )
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
                     )
                   ],
                 ),
                const SizedBox(height: 25,),
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
          ),
        )
      );
    }
  }
}











// TextField(
                //   onTap: () {},
                //   cursorColor: Colors.blue,
                //   decoration: InputDecoration(
                //   hintText: "Search doctor or health issue",
                //   hintStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400),
                //   contentPadding: const EdgeInsets.all(20),
                //   prefixIcon: const Icon(Icons.search_rounded,size: 30,),
                //   filled: true,
                //   fillColor: const Color.fromARGB(43, 158, 158, 158),
                //     enabledBorder: OutlineInputBorder(
                //        borderRadius: BorderRadius.circular(25),
                //        borderSide: const BorderSide(width: 0,color: Color.fromARGB(68, 158, 158, 158),)
                //        ),
                //     focusedBorder:  OutlineInputBorder(
                //        borderRadius: BorderRadius.circular(25),
                //        borderSide: const BorderSide(width: 0,color: Color.fromARGB(68, 158, 158, 158),)
                //        ),
                //     ),
                // ),