import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page_1/home.dart';
import 'package:login_page_1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
   ScreenLogin ({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _usernameController=TextEditingController();

  final _passwordController=TextEditingController();

bool _isDataMatched=true;
final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(

            key: _formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  TextFormField(
                    controller:  _usernameController,
                    decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                    ) ,
                    validator: (value) {
                      if(value==null||value.isEmpty){
                        return 'Username is required';
                      }else{
                        return null;
                      }
                    },
          
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller:  _passwordController,
                    obscureText: true,
                     decoration:const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ) ,
                     validator: (value) {
                         if(value==null||value.isEmpty){
                        return 'Password is required';
                      }else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Visibility(
                    visible: !_isDataMatched,
                    child: Text(
                      'Username password does not match',style: TextStyle(color: Colors.red),),
                  ),
                   ElevatedButton(
                    onPressed:(){
                       if( _formKey.currentState!.validate()){
                  checkLogin(context);
                     }else{
                   print('Data Empty');
                   }
                    } ,
                    child: Text('Login'),
                    )
                ],
                ),
          ),
        ),
          
        ),
        );
    
    
  }

  void checkLogin(BuildContext ctx) async{
    final _username=_usernameController.text;
    final _passworde=_passwordController.text;
    if(_username=='sandra' && _passworde=='121'){
      print('Username password  match');

      // Gotot Home 
      final _sharedprefs = await SharedPreferences.getInstance();
      await  _sharedprefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx).pushReplacement(MaterialPageRoute(builder: (ctx) =>ScreenHome()));

    }else if( _username==null|| _passworde==null|| _passworde.isEmpty){
      print('Username password doesnot match');

    }else{

    setState(() {
      _isDataMatched=false;
    });

    }

    // Show Text


    }

  }
