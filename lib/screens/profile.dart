import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/service/add_user.dart';
import 'package:flutter1/service/user_services.dart';

class ProfilePage extends StatefulWidget{


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;
  bool _isRegisteredToDB = false;


  late User _currentUser;
  late AddUser _addUser;



  @override
  void initState(){
    _currentUser = FirebaseAuth.instance.currentUser!;
    _addUser = AddUser(_currentUser.displayName!, _currentUser.email!);
    _addUser.printDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NAME: ${_currentUser.displayName}',
            style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16.0,),
            Text(
              'EMAIL: ${_currentUser.email}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 16.0,),
            _currentUser.emailVerified
                ?Text(
              'Email Verified',
              style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.green),
            ) :
                Text(
                  'Email not Verified',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Colors.red),
                ),
            const SizedBox(height: 16.0,),
            _isSendingVerification ?
                CircularProgressIndicator() :
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                        onPressed: () async{
                          setState(() {
                            _isSendingVerification = true;
                          });
                          await _currentUser.sendEmailVerification();
                          setState(() {
                            _isSendingVerification = false;
                          });
                        }
                        , child: Text('Verify Email')),
                    const SizedBox(width: 8.0,),
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () async{
                        User? user = await UserService.refreshUser(_currentUser);

                        if(user!= null){
                          setState(() {
                            _currentUser = user;
                          });
                        }
                      },
                    ),
                  ],
                ),
            const SizedBox(height: 16.0,),
            _isSigningOut ? CircularProgressIndicator() :
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isSigningOut = true;
                      });
                      await FirebaseAuth.instance.signOut();

                      setState(() {
                        _isSigningOut = false;
                      });
                      Navigator.of(context).pushNamed('/kayıtolma');
                    }, child: Text('SignOut'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    )
                  ),
                ),
            const SizedBox(height: 16.0,)
          ,
            _isRegisteredToDB ? Text('Already in database'):ElevatedButton(
                onPressed: (){

                  _addUser.addUser();
                  _addUser.addProduct();

                  setState(() {
                    _isRegisteredToDB = true;
                  });
                },

                child: Text('Add to Database')),
          ],
        ),
      ),
    );
  }
}