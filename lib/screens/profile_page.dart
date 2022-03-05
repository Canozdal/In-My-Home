import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter1/service/user_services.dart';
class ProfilePage extends StatefulWidget {

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  bool _isSigningOut = false;
  bool _isSendingVerification = false;
  late User _currentUser;

  @override
  void initState(){
    _currentUser = FirebaseAuth.instance.currentUser!;
    super.initState();
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Hesap'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('İsim: ${_currentUser.displayName}',
            style: Theme.of(context).textTheme.bodyText1,),
            Text('Email: ${_currentUser.email}',
            style: Theme.of(context).textTheme.bodyText1,),
            SizedBox(height: 16.0),
            _currentUser.emailVerified ? Text('Email doğrulandı',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.green),
            ) :
                Text('Email doğrulanmadı',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.red),),
            _isSendingVerification ? CircularProgressIndicator() :
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(onPressed: () async{
                      setState(() {
                        _isSendingVerification = false;
                      });
                    }, child: Text('E-mail doğrula'),
                    ),
                    SizedBox(width: 8.0,),
                    IconButton(onPressed: () async{
                      User? user = await UserService.refreshUser(_currentUser);
                      if(user != null){
                        setState(() {
                          _currentUser = user;
                        });
                      }
                    }, icon: Icon(Icons.refresh))
                  ],
                ),
            SizedBox(height: 16.0),
            _isSigningOut ? CircularProgressIndicator() :
                ElevatedButton(onPressed: () async {
                  setState(() {
                    _isSigningOut = true;
                  });
                  await FirebaseAuth.instance.signOut();
                  setState(() {
                    _isSigningOut = false;
                  });
                  Navigator.pushNamed(context, '/oturum');
                }, child: Text('Oturumu Kapat'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )
                ),),
          ],
        ),
      ),
    );
  }
}