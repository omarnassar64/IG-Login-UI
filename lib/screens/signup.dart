import 'package:flutter/material.dart';
import 'package:flutter_trail/screens/login.dart';
import 'package:flutter_trail/widgets/custom_text_field.dart';

class Signup extends StatefulWidget {
 
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? gendre;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController NewEmailController = TextEditingController();

  final TextEditingController NewPasswordController = TextEditingController();

  final TextEditingController FullNmaeController = TextEditingController();

  final TextEditingController UsernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
             key: _formKey,
            child: 
         
          Column(
            children: [
              SizedBox(height: 50),
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/1280px-Instagram_logo.svg.png",
                width: 250,
                height: 150,
              ),
              CustomTextField(label: "Mobile number or email adress", controller: NewEmailController , validatorFunc: (value){
                if
                ((NewEmailController.text.contains('@') &&
                NewEmailController.text.contains('.') )
                       ||  
                 (RegExp(r'^\d{11}$').hasMatch(NewEmailController.text) && 
                 NewEmailController.text.length ==11 
              )) {return null;}
              else { return "wrong email or number" ;}

              },),
              CustomTextField(label: "Password", controller: NewPasswordController , isPassword: true, validatorFunc: (value){
                 if(NewPasswordController.text.length>=8){
               return(null);
                 }
              else { return "Password must be more than 8 charecters" ;}

              },),
              CustomTextField(label: "Full name", controller: FullNmaeController),
              CustomTextField(label: "Username", controller: UsernameController , validatorFunc: (value){
                if(UsernameController.text.contains(' ')){
                 return ("Enter a valid username");}
                 else {return null;} 

              },),

              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioMenuButton<String>(value: "male", groupValue: gendre , onChanged: (newOption){setState(() {
                    gendre = newOption  ;
                  });}, child: Text("male")),
                   RadioMenuButton<String>(value: "female", groupValue: gendre , onChanged: (newOption){setState(() {
                    gendre = newOption  ;
                  });}, child: Text("female")),
                   RadioMenuButton<String>(value: "other", groupValue: gendre , onChanged: (newOption){setState(() {
                    gendre = newOption  ;
                  });}, child: Text("other")),
                ],
              ),

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
                child: Text('Sign Up' , style: TextStyle(color: Colors.white),),
                 ),
           ),
           SizedBox(height: 70,),

           Text("Have an accout?" , style: TextStyle(color: Colors.black , fontSize: 18),),
           GestureDetector(
            onTap: () {
             
                 Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                           builder: (context) {
                               return Login();
                                       },
                          )
                 );
              
              },
             child: SizedBox(
              width: 380,
              height: 30,
              child: Align(
               alignment: Alignment.center,
             child: 
              Text("Log in", style: TextStyle(color: Colors.blue , fontSize: 18),)
              
              )
             )
              
             
           )
           
           
           
              
            ],
          ),
          )
        ),
      )
      


    );
  }


}
