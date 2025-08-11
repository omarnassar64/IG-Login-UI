import 'package:flutter/material.dart';
import 'package:flutter_trail/screens/forgot_Password.dart';
import 'package:flutter_trail/screens/profile.dart';
import 'package:flutter_trail/screens/signup.dart';
import 'package:flutter_trail/widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFF58529), 
            Color(0xFFDD2A7B),
            Color(0xFF8134AF),
            Color(0xFF515BD4),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
       ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Form( 
           key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/1280px-Instagram_logo.svg.png",
                width: 230,
                height: 150,
              ),
      
              CustomTextField(label: "Phone number or email adress", controller: emailController , validatorFunc:(value){
                if
                ((emailController.text.contains('@') &&
                emailController.text.contains('.') )
                       ||  
                 (RegExp(r'^\d{11}$').hasMatch(emailController.text) && 
                 emailController.text.length ==11 
              )) {return null;}
              else { return "wrong email or number" ;}
              } ,),
              CustomTextField(label: "Password", controller: passwordController , isPassword: true,validatorFunc:(value){
                if(passwordController.text.length>=8){
               return(null);
                 }
              else { return "Password must be more than 8 charecters" ;}
              } ),
      
             
             GestureDetector(
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) {
                  return ForgotPassword();
          },
              
        ),
        );
              },
              child: SizedBox(
                width: 400,
                height: 40,
                child: Align(
                 alignment: Alignment.centerRight,
              child: 
                Text("Forgot password?", style: TextStyle(color: Colors.blue ,),)
                ),
             )
                ),
      
                SizedBox(height: 20,),
      
             SizedBox(
              width: 380,
              height: 40,
               child: ElevatedButton(
                  style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),)
                  ),
                //  onPressed: () {if(_formKey.currentState!.validate()){
                 onPressed: () {if (_formKey.currentState!.validate()) {
 
                     Navigator.push(
                      context,
                       MaterialPageRoute(builder: (context) => Profile()),
                       );
                  }
                  },
                  
                  child: Text('Log In' , style: TextStyle(color: Colors.white),),
                   ),
             ),
             SizedBox(height: 120,),
      
             Text("Don't have an accout?" , style: TextStyle(color: Colors.black , fontSize: 18),),
             GestureDetector(
              onTap: () {
                   Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                             builder: (context) {
                                 return Signup();
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
                Text("Sign Up", style: TextStyle(color: Colors.blue , fontSize: 18),)
                
                )
               )
             )
            ],
          ),
        ),
      ),
      ),
        );
       
  }

  //  _login(BuildContext context) {
  // if ((emailController.text.contains('@') &&
  //     emailController.text.contains('.') &&
  //     passwordController.text.length >= 8) || 
  //     (RegExp(r'^\d{11}$').hasMatch(emailController.text) &&
  //     passwordController.text.length >= 8 )) {
  //   emailController.clear();
  //   passwordController.clear();
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) {
  //         return Profile();
  //       },
  //     ),
  //   );
  // } else if 
  //   (!((emailController.text.contains('@') &&
  //       emailController.text.contains('.')) || 
  //       (RegExp(r'^\d{11}$').hasMatch(emailController.text)))) 
  //     print('Enter a valid email or number');
    
  //   else if (passwordController.text.length < 8) {
  //     print('wrong password');
  //   }
  // }
}