import 'package:doctor_appointment_app/Doctors%20List/doctors_list2.dart';
import 'package:doctor_appointment_app/Doctors%20List/health_issues_list.dart';
import 'package:doctor_appointment_app/Models/doctor_list2_model.dart';
import 'package:doctor_appointment_app/Screens/find_doctor_details.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Search_Bar extends StatefulWidget {
  const Search_Bar({super.key});

  @override
  State<Search_Bar> createState() => _Search_BarState();
}

// ignore: camel_case_types
class _Search_BarState extends State<Search_Bar> {

  // ignore: non_constant_identifier_names
  TextEditingController search_menu = TextEditingController();

  List<HealthIssuesModel> display = List.from(healthList);

  void updateList(value){
    display = healthList.where((element) => element.diseaseName!.toLowerCase().contains(value.toString())).toList();
    setState(() {});
  }

  List<DoctorListModel> display_2 = List.from(doctors_List2);

  // ignore: non_constant_identifier_names
  TextEditingController search_menu_2 = TextEditingController();

  void updateList_1(value){
    display_2 = doctors_List2.where((element) => element.Name!.toLowerCase().contains(value.toString())).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          bottom:  const TabBar(tabs: [Tab(text: "Doctors",),Tab(text: "Health issues",)],indicatorColor: Colors.white,labelColor: Colors.white,unselectedLabelColor: Colors.black,),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                  controller: search_menu,
                  onChanged: (value) => updateList_1(value),
                  decoration: const InputDecoration(
                   hintText: "Search Doctor",
                   hintStyle: TextStyle(color: Color.fromARGB(255, 30, 77, 116),fontSize: 15),
                   contentPadding: EdgeInsets.all(10),
                   prefixIcon: Icon(Icons.search_rounded,size: 30,color: Color.fromARGB(255, 30, 77,    116),),
                   filled: true,
                   fillColor: Color.fromARGB(255, 236, 236, 236),
                   enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                   ),
                   focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                   )
                  ),
                ),
            ),
            Container(
              child: display.isEmpty ? 
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Center(child: Text("No Result Found",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),),
              ) : 
              ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: display_2.length,
              itemBuilder: (context,index) {
                final item = display_2[index];
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

      //Separation for line
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: search_menu,
                onChanged: (value) => updateList(value),
                decoration: const InputDecoration(
                 hintText: "Search Health Issue",
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
            Container(
              child: display.isEmpty ? 
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Center(child: Text("No Result Found",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),))
                : 
                ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 20),
                itemCount: display.length,
                itemBuilder: (context,index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: display[index].tileColor,
                      ),
                      duration: const Duration(seconds: 2),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: display[index].imageData,
                              ),
                              const SizedBox(width: 20,),
                              Text(display[index].diseaseName.toString(),style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w600),),
                              const Spacer(),
                              IconButton(onPressed: () {
                               setState(() {
                                display[index].selected = !display[index].selected;
                               });
                              }, icon: Icon(display[index].selected ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined,size: 32,)),
                            ],
                          ),
                          display[index].selected ? const SizedBox(height: 20,) : const SizedBox(),
                          display[index].selected ? Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              border: Border(top: BorderSide(width: 0.3))
                            ),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Text("Description",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),)
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Text(display[index].text.toString(),style: const TextStyle(fontSize: 14),)
                              ],
                            ),
                          ) : Container(),
                          display[index].selected ? const SizedBox(height: 20,) : const SizedBox(),
                          display[index].selected ? Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              border: Border(top: BorderSide(width: 0.3))
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: const Color.fromARGB(159, 0, 0, 0)
                                      ),
                                      child: const Text("Precautions",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),))
                                  ],
                                ),
                                const SizedBox(height: 20,),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("1. Don't smoke or use tobacco.",style: TextStyle(fontSize: 14),),
                                    SizedBox(height: 5,),
                                    Text("2. Get moving: Aim for at least 30 to 60 minutes of activity daily.",style: TextStyle(fontSize: 14),),
                                    SizedBox(height: 5,),
                                    Text("3. Eat a heart-healthy diet.",style: TextStyle(fontSize: 14),),
                                    SizedBox(height: 5,),
                                    Text("4. Maintain a healthy weight.",style: TextStyle(fontSize: 14),),
                                    SizedBox(height: 5,),
                                    Text("5. Get quality sleep.",style: TextStyle(fontSize: 14),),
                                    SizedBox(height: 5,),
                                    Text("6. Manage stress.",style: TextStyle(fontSize: 14),),
                                    SizedBox(height: 5,),
                                    Text("7. Get regular health screening tests.",style: TextStyle(fontSize: 14),),
                                    SizedBox(height: 5,),
                                    Text("8. Take steps to prevent infections.",style: TextStyle(fontSize: 14),),
                                  ],
                                )
                              ],
                            ),
                          ) : Container(),
                        ],
                      ),
                      ),
                  );
              }
              ),
            ),
          ],
        ),
      ),
          ]
          ),
      ),
    );
  }
}











// import 'package:easy_search_bar/easy_search_bar.dart';
// import 'package:flutter/material.dart';

// // ignore: camel_case_types
// class Search_Bar extends StatefulWidget {
//   const Search_Bar({super.key});

//   @override
//   State<Search_Bar> createState() => _Search_BarState();
// }

// // ignore: camel_case_types
// class _Search_BarState extends State<Search_Bar> {

//   String searchValue = '';
//   final List<String> _suggestions = ['Afeganistan', 'Albania', 'Algeria', 'Australia', 'Brazil', 'German', 'Madagascar', 'Mozambique', 'Portugal', 'Zambia'];

//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Example',
//       theme: ThemeData(
//         primarySwatch: Colors.orange
//       ),
//       home: Scaffold(
//         appBar: EasySearchBar(
//           leading: IconButton(onPressed: (){
//             Navigator.pop(context);
//           }, icon: const Icon(Icons.arrow_back_rounded,color: Colors.white,)),
//           elevation: 10,
//           iconTheme: const IconThemeData(color: Colors.white,size: 25),
//           isFloating: false,
//           backgroundColor: Colors.blue,
//           title: const Text('Search doctor or health issue',style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),),
//           onSearch: (value) => setState(() => searchValue = value),
//           suggestions: _suggestions
//         ),
//         body: Center(
//           child: Text('Value: $searchValue')
//         )
//       )
//     );
//   }
// }


 