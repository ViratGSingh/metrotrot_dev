// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileDrawer extends StatelessWidget {
  
  const UserProfileDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [Container(
              padding: EdgeInsets.fromLTRB(20,20, 0,0),
              child: Row(
                
                children: [
                  //Icon(Icons.account_circle_outlined, size: 40,),SizedBox(width: 4),
                  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Welcome!", style: GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w500),), SizedBox(
                  
                  child: Text("Log in to save your routes",style: GoogleFonts.notoSans(fontSize: 14, color: Colors.grey),))],)],),
              
            ),
             Container(
                 height:MediaQuery.of(context).size.height/4,
                 decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.10)),),
                color: Colors.white,
                image: DecorationImage(
                  
                  image:  AssetImage("assets/images/welcome.gif"),),
              ),
                child: null),
                 ListTile(
                  title:  Row(children: [Icon(Icons.favorite_border_outlined, color: Colors.black),SizedBox(width: 4,), Text("Liked routes",style:GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w500) )],),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title:  Row(children: [Icon(Icons.directions_subway_filled_outlined, color: Colors.black),SizedBox(width: 4,), Text("Offline metros",style:GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w500) )],),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title:  Row(children: [Icon(Icons.history, color: Colors.black),SizedBox(width: 4,), Text("Search history",style:GoogleFonts.notoSans(fontSize: 16, fontWeight: FontWeight.w500) )],),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title:  Row(children: [Icon(Icons.privacy_tip_outlined, color: Colors.black),SizedBox(width: 4,), Text("Privacy policy",style:GoogleFonts.notoSans(fontSize: 16) )],),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
                ],),

                Container(
                  padding: EdgeInsets.only(bottom:0),
                  child: ListTile(
                    title:  Row(children: [Icon(Icons.login_outlined , color: Colors.black),SizedBox(width: 4,), Text("Log in",style:GoogleFonts.notoSans(fontSize: 16) )],),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                  ),
                ),
            ],),
            
            
               
               
      );
  }
}
