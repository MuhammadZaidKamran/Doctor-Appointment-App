import 'package:doctor_appointment_app/Doctors%20List/doctors_list2.dart';
import 'package:doctor_appointment_app/Models/doctor_list2_model.dart';
import 'package:doctor_appointment_app/Screens/find_doctor_details.dart';
import 'package:flutter/material.dart';

class FindDoctors extends StatefulWidget {
  const FindDoctors({super.key});

  @override
  State<FindDoctors> createState() => _FindDoctorsState();
}

class _FindDoctorsState extends State<FindDoctors> {

  List<DoctorListModel> display = List.from(doctors_List2);

  // ignore: non_constant_identifier_names
  TextEditingController search_menu = TextEditingController();

  void updateList(value){
    display = doctors_List2.where((element) => element.Name!.toLowerCase().contains(value.toString())).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: const Size.fromHeight(110), child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Find Doctors",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),)
                  ],
                ),
                Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: search_menu,
                        onChanged: (value) => updateList(value),
                        decoration: const InputDecoration(
                         hintText: "Search Doctor",
                         hintStyle: TextStyle(color: Color.fromARGB(255, 30, 77, 116),fontSize: 15),
                         contentPadding: EdgeInsets.all(10),
                         prefixIcon: Icon(Icons.search_rounded,size: 30,color: Color.fromARGB(255, 30, 77,    116),),
                         filled: true,
                         fillColor: Color.fromARGB(255, 236, 236, 236),
                         enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                         ),
                         focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(27)),
                         )
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      )),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text("Find Doctors",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),),
      //   backgroundColor: Colors.blue,
      //   elevation: 5,
      //   shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   margin: const EdgeInsets.only(top: 30),
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: TextField(
            //       controller: search_menu,
            //       onChanged: (value) => updateList(value),
            //       decoration: const InputDecoration(
            //        hintText: "Search Doctor",
            //        hintStyle: TextStyle(color: Color.fromARGB(255, 30, 77, 116),fontSize: 15),
            //        contentPadding: EdgeInsets.all(10),
            //        prefixIcon: Icon(Icons.search_rounded,size: 30,color: Color.fromARGB(255, 30, 77,    116),),
            //        filled: true,
            //        fillColor: Color.fromARGB(255, 236, 236, 236),
            //        enabledBorder: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.all(Radius.circular(20)),
            //        ),
            //        focusedBorder: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.all(Radius.circular(20)),
            //        )
            //       ),
            //     ),
            // ),
            Container(
              child: display.isEmpty ? 
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Center(child: Text("No Result Found",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),),
              ) : 
              ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: display.length,
              itemBuilder: (context,index) {
                final item = display[index];
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(35, 158, 158, 158),
                    ),
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                           Hero(
                            tag: item.ProfilePic.toString(),
                             child: CircleAvatar(
                              radius: 35,
                               backgroundImage: item.ProfilePic,
                             ),
                           ),
                           const SizedBox(width: 20,),
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text("${item.Name}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                               Text("${item.Faculty}",style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w300),),
                             ],
                           ),
                           const Spacer(),
                           Row(
                            children: [
                              const Icon(Icons.star,color: Colors.amber,),
                              Text("${item.Rating}")
                            ],
                           ),
                        ],
                      ),
                      const SizedBox(height: 25,),
                      const Divider(thickness: 1,),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const Icon(Icons.calendar_month_outlined,color: Colors.blue,size: 18,),
                          const SizedBox(width: 5,),
                          Expanded(child: Text("${item.Date}, ${item.Day}",style: const TextStyle(fontSize: 11,color: Colors.blue),)),
                          const Spacer(),
                          const Icon(Icons.watch_later_outlined,color: Colors.blue,size: 18,),
                          const SizedBox(width: 5,),
                          Expanded(child: Text("${item.Time}",style: const TextStyle(fontSize: 11,color: Colors.blue),))
                        ],
                      ),
                      const SizedBox(height: 30,),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FindDoctorDetails(doctorDetails: item)));
                      },style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        elevation: const WidgetStatePropertyAll(0),
                        backgroundColor: const WidgetStatePropertyAll(Color.fromARGB(39, 33, 149, 243)),
                        minimumSize: const WidgetStatePropertyAll(Size(250, 50)),
                        maximumSize: const WidgetStatePropertyAll(Size(300, 50)),
                      ), child: const Expanded(child: Text("View More Details",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.blue),)),)
                    ],
                  ),
                ),
              );
            })
            )
          ],
        ),
      ),
    );
  }
}