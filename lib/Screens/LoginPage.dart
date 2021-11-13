import 'package:delivery_app/Services/apiservices.dart';
import 'package:delivery_app/Services/securityServices.dart';
import 'package:delivery_app/Services/storageServices.dart';
import 'package:delivery_app/userModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usr = new TextEditingController();
  TextEditingController pwd = new TextEditingController();
  TextEditingController phn = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is a Login page')
      ),
    );
  }

  checkUser(String text)async{
    if(text.isEmpty){
      print('Username cannot be empty');
    }else{
      var response = await ApiServices().checkUser(text);
      if(response['status']=='true'){
        if(response['msg'] == 'true'){
          print('Username Already taken!');
        }else{
        }
      }
    }
  }
  // Follow these conditions before using these functions:
  //1. username , pwd , phonenumber should not be empty.
  signUp(String usrname,String e_mail,String phn,String pwd,bool googleUser)async{
    final username = usrname;
    final password = pwd;
    final email = e_mail;
    final phone = phn;
    print('Trying to SignUp');
    var response = await ApiServices().registerUser(username,email, password, phone , googleUser);
    print('recorded the response');
    if(response['status'] == 'true'){
      final encryptedPwd= Security().encrypt(password);
      await Storage().saveData(username, encryptedPwd);
      token = response['token'];
      print(response['msg']);
    }else{
      print(response['msg']);
    }
  }

  Future<String> login(String usrname,String pwd)async{
    final username = usrname;
    final password = pwd;

    var response = await ApiServices().login(username, password);
    if(response['status']=='true'){
      print(response['msg']);
      final encryptedPwd= Security().encrypt(password);
      await Storage().saveData(username, encryptedPwd);
      print(response['token']);
      token = response['token'];
      return 'true';
    }else{
      String err = response['msg'];
      print(err);
      return err;
    }
  }
  updatePassword(String password,String newPassword)async{
    final encryptedPwd= Security().encrypt(password);
    final details = await Storage().getData();
    final myPwd = details[1];
    print("token is $token");
    if(encryptedPwd == myPwd){
     String response =  await ApiServices().changePassword(token, newPassword);
     print(response);
    }else{
      print('Incorrect pwd Entered!');
    }
  }
  deleteAccount(String password)async{
    final encryptedPwd= Security().encrypt(password);
    final myPwd = await Storage().getData()[1];
    if(encryptedPwd == myPwd){
      bool response =  await ApiServices().deleteAccount(token);
      print(response);
    }else{
      print('Incorrect pwd Entered!');
    }
  }
}
