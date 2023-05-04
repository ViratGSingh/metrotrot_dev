// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoTab extends StatelessWidget {
  // final String title;
  // final String type;
  final String info;
  final int value;
  final int selectedValue;
  final Function selectedFunc;
  // final bool isLoading;
 InfoTab({
    Key? key,
    required this.value,
    required this.selectedValue,
    required this.info,
    required this.selectedFunc
    //required this.isLoading,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
  bool _isSelected = value==selectedValue?true:false;
    print(_isSelected);
    return  ElevatedButton(
          onPressed: ()=>selectedFunc(),
          style: ButtonStyle(
              backgroundColor:MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
          // if (states.contains(MaterialState.pressed)) {
          //    // Change background color to red when button is pressed
          // }
          return selectedValue==value?Color(0xFFFFBB23):Colors.white; // Default background color
        }),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
              fixedSize: MaterialStateProperty.all(
                Size.fromHeight(40),
              )),
          child: Text(
            info,
            style:GoogleFonts.notoSans(
                            color:selectedValue==value?Colors.white:Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
          ),
        );
      }
   
}

