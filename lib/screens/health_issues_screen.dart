import 'package:doctor_appointment_app/Doctors%20List/health_issues_list.dart';
import 'package:flutter/material.dart';

class HealthIssues extends StatefulWidget {
  const HealthIssues({super.key});

  @override
  State<HealthIssues> createState() => _HealthIssuesState();
}

class _HealthIssuesState extends State<HealthIssues> {

  // ignore: non_constant_identifier_names
  TextEditingController search_menu = TextEditingController();

  List<HealthIssuesModel> display = List.from(healthList);

  void updateList(value){
    display = healthList.where((element) => element.diseaseName!.toLowerCase().contains(value.toString())).toList();
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
                    Text("Health Issues",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.white),)
                  ],
                ),
                Container(
                      margin: const EdgeInsets.only(top: 20),
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
              ],
            ),
          ),
        ),
      )
      ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text("Health Issues",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.white),),
      //   elevation: 5,
      //   scrolledUnderElevation: 15,
      //   shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))),
      //   backgroundColor: const Color.fromARGB(182, 33, 149, 243),
      //   leading: IconButton(onPressed: (){
      //     Navigator.pop(context);
      //   }, icon: const Icon(Icons.arrow_back,size: 25,)),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: display.isEmpty ? 
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Center(child: Text("No Result Found",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),))
                : 
                ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 10),
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
    );
  }
}