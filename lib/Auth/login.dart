import 'package:flutter/material.dart';
import 'package:on_campus/Auth/signup.dart';
import 'package:on_campus/components/auth_button.dart';
import 'package:on_campus/components/register_button.dart';
import 'package:on_campus/essentials/nav.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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


  void signInUser() async {
    try{
      final user = await Supabase.instance.client.auth.signInWithPassword(
          password: passwordController.text,
          email: emailController.text
      );
       passwordController.clear();
       emailController.clear();
      final userDetails = Supabase.instance.client.auth.currentUser!;
       final snackBar =  SnackBar(
         content: Text('Welcome Back ${userDetails.email}'),
       );
       ScaffoldMessenger.of(context).showSnackBar(snackBar);


       Navigator.of(context).push(MaterialPageRoute(
           builder: (context) => const NavBar()));


    } on AuthException catch (error){
      final snackBar =  SnackBar(
        content: Text(error.message),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
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
              const Center(child: Text("Welcome Back",style:
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
              RegisterButton(
                  onTap: signInUser,
                  buttonName: "Login"
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
              const Text("Don't Have an Account?"),
              const SizedBox(height: 30,),
              RegisterButton(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUp()));
                  },
                  buttonName: "Sign Up"
              ),
            ],
          ),
        ),
      ),
    );
  }
}


