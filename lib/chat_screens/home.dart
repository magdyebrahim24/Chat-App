import 'package:chatapp/constants.dart';
import 'package:chatapp/models/user.dart';
import 'package:chatapp/sign/sign-in.dart';
import 'package:chatapp/widgets/buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
//    getUsersInfo();
//    UserInfo().getUsersInfo();
  }

  List users = ['magdy', 'mohamed'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Mega',
          style: KMegaText.copyWith(color: secondaryColor, fontSize: 28),
        ),
        leading: CircleButton(
          icn: Icons.arrow_back_ios,
          clor: backgroundColor,
          fun: () {
            auth.signOut();
//            UserInfo().auth.signOut();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => SignIn()));
          },
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 200,
        child: ListView.builder(
          padding: EdgeInsets.only(top: 0, bottom: 0),
          itemCount: 10,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                // getUsersInfo();
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .05,
                    vertical: MediaQuery.of(context).size.height * .02,
                  ),
//                  child: ListTile(
//                    subtitle: Text(UserInfo().usersInfo[i].email),
//                    title: Text(UserInfo().usersInfo[i].name),
//                  ),
                   child:ChatItem(),
                  ),
            );
          },
        ),
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ClipRect(
          clipBehavior: Clip.antiAlias,
          child: Container(
            height: MediaQuery.of(context).size.height * .09,
            width: MediaQuery.of(context).size.width * .16,
            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: AssetImage('assets/profile-img.png'), fit: BoxFit.cover,
//              ),
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .05,
              right: MediaQuery.of(context).size.width * .02,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'magdy',
//                  UserInfo().usersInfo[1].email,
                  style: TextStyle(fontSize: 19),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .015,
                ),
                Text(
                  'if i saw you i will kill you can you understand me',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 15, color: Colors.grey[400]),
                ),
              ],
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'now',
              style: TextStyle(fontSize: 18, color: Colors.grey[400]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .015,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .017,
              width: MediaQuery.of(context).size.width * .03,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
