import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    await googleSignIn.signIn().then((value) async {
      //print(value);

      if (value != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await value.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        User? user = userCredential.user;
        //SAve User Info
        FirebaseFirestore db = FirebaseFirestore.instance;
        final userInfo = {
          "name": user!.displayName,
          "email": user.email,
          "imageUrl": user.photoURL,
          "creationTime": user.metadata.creationTime,
          "lastSignInTime": user.metadata.lastSignInTime,
          "deviceId": androidInfo.id,
          "deviceBrand": androidInfo.brand,
          //"deviceName": androidInfo.device,
          "deviceModel": androidInfo.model,
          //"deviceProduct": androidInfo.product,
          "deviceAndroidOS": androidInfo.version.release,
          "deviceSdkVersion": androidInfo.version.sdkInt,
          'deviceWidthPixels': androidInfo.displayMetrics.widthPx,
          'deviceHeightPixels': androidInfo.displayMetrics.heightPx,
        };
        print(userInfo);
        db.collection("users").doc(user.uid).get().then((value) {
          if(value.exists){
          //Update User Info
          db
              .collection("users")
              .doc(user.uid)
              .update(userInfo)
              .onError((e, _) => print("Error writing document: $e"));
        } else{
          //Set First Time Info
          db
              .collection("users")
              .doc(user.uid)
              .set(userInfo)
              .onError((e, _) => print("Error writing document: $e"));
        }
        });
          
      }
    });
  }
}
