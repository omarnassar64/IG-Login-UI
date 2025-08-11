import 'package:flutter/material.dart';
import 'package:flutter_trail/screens/login.dart';
import 'package:flutter_trail/widgets/custom_text_field.dart';
import 'package:flutter_trail/screens/signup.dart';

class ForgotPassword extends StatefulWidget {
   ForgotPassword({super.key});


  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
 final _formKey = GlobalKey<FormState>();
 final TextEditingController RecoverController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
             key: _formKey,
             
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
    
            
            children: [
              SizedBox(height: 40,),
              Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                    image: DecorationImage(
                        image: NetworkImage("https://cdn0.iconfinder.com/data/icons/instagram-ui-1/24/Instagram-UI_privacy-512.png" , scale: 2,),  
                              scale: 5,        
                          ),
                )
              ),
              Text("Trouble logging in?", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
              SizedBox(height: 10,),
              Text(
         '''    Enter your email, phone or username and
    we'll send you a link to get back into your
                              accout''', style: TextStyle(color: Colors.grey , fontSize: 20),),
              SizedBox(height: 20,),
              CustomTextField(label: "Email, phone or username", controller: RecoverController, validatorFunc:(value){
                if
                ((RecoverController.text.contains('@') &&
                RecoverController.text.contains('.') )
                       ||  
                 (RegExp(r'^\d{11}$').hasMatch(RecoverController.text) && 
                 RecoverController.text.length ==11 
              )) {return null;}
              else { return "wrong email or number" ;}
              }, ),  
              SizedBox(height: 15,),
               SizedBox(
            width: 380,
            height: 40,
            
             child: ElevatedButton(
             
                style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),)
                ),
                
                onPressed: () {if (_formKey.currentState!.validate()) {
 
                     Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) => Login()),
                       );
                  }
                  },
                child: Text('Send Login Link' , style: TextStyle(color: Colors.white),),
                 ),
           ),
           SizedBox(height: 70,),
           Text("OR", style: TextStyle(color: Colors.grey , fontSize: 20),),
           SizedBox(height: 20,),

           GestureDetector(
            onTap:(){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) {
                return Signup();
               },
            
             ),
             );
            },
            child: SizedBox(
              width: 380,
              height: 40,
              child: Align(
               alignment: Alignment.center,
            child: 
              Text(" Create new account", style: TextStyle(color: const Color.fromARGB(255, 0, 3, 6) , fontSize: 20, fontWeight: FontWeight.bold),)
              ),
           )
              ),

            ],
            
          )
          
          
        ),
      ),
      ),
    );
  }

// _Recover(BuildContext context) {
//   if ((RecoverController.text.contains('@') &&
//       RecoverController.text.contains('.') 
//        ||  
//       (RecoverController.text is int && 
//       RecoverController.text.length ==11 
//        ))) {
//     print("Wait for the link");
//   }
//   else {print("Enter a valid email or phone number");}
// }
   }