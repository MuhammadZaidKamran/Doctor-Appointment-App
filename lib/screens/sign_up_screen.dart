import 'package:doctor_appointment_app/BottomNavigationBar/Bottom_Nav_Bar.dart';
import 'package:doctor_appointment_app/Extras/data.dart';
//import 'package:doctor_appointment_app/utils/data.dart';
import 'package:doctor_appointment_app/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController userEmailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/Images/background_image.jpg"),fit: BoxFit.cover)),
        child: Scaffold(
           backgroundColor: const Color.fromARGB(130, 236, 236, 236),
           body: Form(
            key: _formkey,
             child: SingleChildScrollView(
               child: Container(
                margin: const EdgeInsets.only(top: 90),
                 padding: const EdgeInsets.symmetric(horizontal: 25),
                 child: Center(
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.medical_services_rounded,color: Colors.blueGrey,size: 65,),
                      const SizedBox(height: 10,),
                      const Row(
                        children: [
                          Text("Sign Up",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Color.fromARGB(255, 15, 81, 135)),),
                        ],
                      ),
                      const SizedBox(height: 7,),
                      const Row(
                        children: [
                          Text("Create your Account",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300),)
                        ],
                      ),
                      const SizedBox(height: 25,),
                      TextFormField(
                        controller: userEmailController,
                        validator: (value) {
                          if (value == "") {
                            return "Enter Email";
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail_rounded),
                          prefixIconColor: const Color.fromARGB(175, 96, 125, 139),
                          fillColor: const Color.fromARGB(93, 255, 255, 255),
                          filled: true,
                          contentPadding: const EdgeInsets.all(20),
                          labelText: "Email",
                          labelStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1.9,color: Colors.blueGrey)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1.9,color: Colors.blueGrey)
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1.9,color: Color.fromARGB(255, 83, 6, 6))
                          ),
                          errorBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1.9,color: Color.fromARGB(255, 83, 6, 6))
                          ),
                        ),
                      ),
                      const SizedBox(height: 25,),
                      TextFormField(
                        controller: userNameController,
                        validator: (value) {
                          if (value == "") {
                            return "Enter Username";
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.account_box_rounded),
                          prefixIconColor: const Color.fromARGB(175, 96, 125, 139),
                          fillColor: const Color.fromARGB(93, 255, 255, 255),
                          filled: true,
                          contentPadding: const EdgeInsets.all(20),
                          labelText: "Username",
                          labelStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1.9,color: Colors.blueGrey)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1.9,color: Colors.blueGrey)
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1.9,color: Color.fromARGB(255, 83, 6, 6))
                          ),
                          errorBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1.9,color: Color.fromARGB(255, 83, 6, 6))
                          ),
                        ),
                      ),
                      const SizedBox(height: 35,),
                         TextFormField(
                          controller: userPasswordController,
                          validator: (value) {
                          if (value == "") {
                            return "Enter Password";
                          } else {
                            return null;
                          }
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: isVisible,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {
                              isVisible = !isVisible;
                              setState(() {});
                            },
                            child: isVisible ? const Icon(Icons.visibility_off,color: Colors.blueGrey,) : const Icon(Icons.visibility),
                          ),
                          prefixIcon: const Icon(Icons.key_rounded),
                          prefixIconColor: const Color.fromARGB(175, 96, 125, 139),
                          fillColor: const Color.fromARGB(93, 255, 255, 255),
                          filled: true,
                          contentPadding: const EdgeInsets.all(20),
                          labelText: "Password",
                          labelStyle: const TextStyle(fontSize: 15,fontWeight: FontWeight.w300),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1.9,color: Colors.blueGrey)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1.9,color: Colors.blueGrey)
                          ),
                           focusedErrorBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1.9,color: Color.fromARGB(255, 83, 6, 6))
                          ),
                          errorBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(width: 1.9,color: Color.fromARGB(255, 83, 6, 6))
                          ),
                        ),
                      ),
                      const SizedBox(height: 50,),
                      ElevatedButton(onPressed: (){
                        if (_formkey.currentState!.validate()) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
                          userName.add(userNameController.text);
                          userEmail.add(userEmailController.text);
                          userPassword.add(userPasswordController.text);
                          setState(() {});
                        }
                      },style: ButtonStyle(minimumSize: const WidgetStatePropertyAll(Size(340, 60)),maximumSize: const WidgetStatePropertyAll(Size(340, 60)),backgroundColor: const WidgetStatePropertyAll(Color.fromARGB(255, 15, 81, 135)),shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),elevation: const WidgetStatePropertyAll(10)), child: const Text("Sign Up",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,color: Colors.white),),),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already Have an Account?"),
                          TextButton(onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                          }, child: const Text("Login",style: TextStyle(color: Color.fromARGB(255, 15, 81, 135)),))
                        ],
                      )
                    ],
                   ),
                 ),
               ),
             ),
           ),
        ),
      )
      );
  }
}