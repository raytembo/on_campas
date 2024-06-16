import 'package:flutter/material.dart';
import 'package:on_campus/Auth/login.dart';
import 'package:on_campus/components/auth_button.dart';
import 'package:on_campus/essentials/nav.dart';
import '../components/register_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

 TextEditingController emailController = TextEditingController();
 TextEditingController passwordController = TextEditingController();
 TextEditingController repasswordController = TextEditingController();

 final snackBar = SnackBar(
   content: const Text('This is a snackbar message!'),
   backgroundColor: Colors.blue,
   action: SnackBarAction(
     label: 'Undo',
     onPressed: () {
       // Perform undo action (optional)
     },
   ),
 );

 void signUpUser() async {

 if (passwordController.text == repasswordController.text){
   try{
     await Supabase.instance.client.auth.signUp(
         password: passwordController.text,
         email: emailController.text
     );
     passwordController.clear();
     emailController.clear();
     repasswordController.clear();

     final userDetails = Supabase.instance.client.auth.currentUser!;

     final snackBar =  SnackBar(
       content: Text('Welcome to Our Campus ${userDetails.email}'),
     );
     ScaffoldMessenger.of(context).showSnackBar(snackBar);


     Navigator.of(context).push(MaterialPageRoute(
         builder: (context) => const NavBar()));


   } on AuthException {
     const snackBar =  SnackBar(
       content: Text("Try Again"),
     );
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
   }

  }
 else{
   const SnackBar snackBar =  SnackBar(
     content: Text("Passwords Don't Match"),
   );
   ScaffoldMessenger.of(context).showSnackBar(snackBar);

 }


 }


 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
          children: [
          const Icon(
          Icons.account_circle_sharp,
            size: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(child: Text("Join Us Today",style:
          TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),)),
          
          const SizedBox(
            height: 30,
          ),
          MyTextFile(
              obscure: false,
              hint: "Enter Your Email",
              userInput: emailController
          ),
          const SizedBox(
            height: 30,
          ),
          MyTextFile(
              obscure: true,
              hint: "Enter Your Password",
              userInput: passwordController
          ),
          const SizedBox(
            height: 30,
          ),
            MyTextFile(
                obscure: true,
                hint: "Confirm your Password",
                userInput: repasswordController
            ),
            const SizedBox(
              height: 30,
            ),
          RegisterButton(
              onTap: signUpUser,
              buttonName: "Sign Up"
          ),
          const SizedBox(
            height: 20,
          ),
          
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Divider(),
              Center(
                  child: Text("or",
                    style:
                    TextStyle(
                      fontSize: 20,
                    ) ,
                  )
              ),
              Divider(),
            ],
          ),
          const SizedBox(height: 20,),
          const Text("Already Have an Account?"),
          const SizedBox(height: 30,),
          RegisterButton(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Login()));
              },
              buttonName: "Login"
          ),
          
          ],),
        ),
      ),

    );
  }
}
