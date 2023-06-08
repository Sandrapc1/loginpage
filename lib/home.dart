import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page_1/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(onPressed: () {
          signout(context);
          }, 
          icon:Icon( Icons.exit_to_app)),
        ],
        ),
      body:SafeArea(
        child: ListView.separated(
          itemBuilder: (ctx,index) {
            if(index % 2 == 0){
              return ListTile(
                title: Text(
                  'Alia Bhatt',
                  ),
                  subtitle: Text(
                     'Message '

                  ),
                  
              leading:  CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://c4.wallpaperflare.com/wallpaper/926/317/219/alia-bhatt-indian-celebrities-desi-girls-girls-wallpaper-preview.jpg'), 
              ),
              trailing: Text('1$index:00 PM'),
              );

            }else{
              return ListTile(
                title: Text(
                  'Shah Rukh Khan'
                ),
                subtitle:  Text(
                   'Message '
                ),
                leading: ClipRRect(
                  child:Image (
                    width: 40,
                    image: AssetImage('assets/images/shah.jpg'),
                   ),
                  ),
                  trailing: Text('$index:00 PM'),
              );
            }   
          },
           separatorBuilder: (ctx,index) {
            return Divider();

           },
            itemCount: 20,
        ),

        ),
    );
  }

  signout(BuildContext ctx)async{

  final _sharedprefs = await SharedPreferences.getInstance();
     await _sharedprefs.clear(); 
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx1)=>ScreenLogin()), (route) => false);


  }
}