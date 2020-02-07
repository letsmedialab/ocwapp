import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ocwapp/containers/booking_container.dart';
import 'package:ocwapp/containers/profile_page_container.dart';
import 'package:ocwapp/containers/splash_container.dart';
import 'package:ocwapp/database/user/user_database.dart';
import 'package:ocwapp/models/call.dart';
import 'package:ocwapp/models/user/user.dart';
import 'package:ocwapp/models/user/user_type.dart';
import 'package:ocwapp/presentation/function/wil_pop_scope.dart';
import 'package:ocwapp/presentation/profile/logout_dialog.dart';
import 'package:ocwapp/presentation/table.dart';
import 'package:ocwapp/service/broadcaster_service.dart';
import 'package:ocwapp/utils/globals.dart';
import 'package:ocwapp/utils/size_config.dart';

class HomePage extends StatefulWidget {
  final User user;
  final Function onExit;
  final Function logout;
  final Function refresh;

  HomePage(this.user, this.onExit, this.logout, this.refresh);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int selectedIndex = 0;
  TabController tabController;

  Widget _widget;

  @override
  void initState() {
    super.initState();
    _widget = ProfileContainer();
    tabController = TabController(
        length: widget.user.userType == UserType.Admin ? 3 : 2,
        initialIndex: 1,
        vsync: this);

    broadcasterService.on(BroadcasterEventType.onExitSession).listen((data) {
      if (mounted) {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
    });
    broadcasterService.on(BroadcasterEventType.onLogout).listen((data) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, SplashContainer.routeNamed);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            builder: (BuildContext context) {
              return Exit(widget.onExit);
            });
      },
      child: SafeArea(
        child: Scaffold(
          drawer: _drawer(),
          appBar: _appBar(),
          body: RefreshIndicator(
              onRefresh: () async {
                widget.refresh();
                await Future.delayed((Duration(seconds: 2)));
                return null;
              },
              child: _widget),
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.black,
      actions: <Widget>[
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 10),
          child: Text(
            widget.user != null ? widget.user.firstName : '',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }

//  Widget _drawer() {
//    return Drawer(
//      child: Container(
//        color: Colors.blue,
//        padding: EdgeInsets.only(
//          top: SizeConfig.screenHeight * 0.1,
//        ),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Container(
//              child: Column(
//                mainAxisSize: MainAxisSize.min,
//                children: <Widget>[
//                  Container(
//                    margin: EdgeInsets.all(10),
//                    height: SizeConfig.screenHeight * 0.2,
//                    width: SizeConfig.screenWidth * 0.4,
//                    decoration: BoxDecoration(
//                      color: Colors.white,
//                      borderRadius: BorderRadius.all(
//                        Radius.circular(SizeConfig.screenHeight * 0.1),
//                      ),
//                      image: DecorationImage(
//                        image: AssetImage('assets/profilepic1.png'),
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                  ),
//                  Text(
//                    widget.user != null ? widget.user.firstName : '',
//                    style: TextStyle(color: Colors.white, fontSize: 24),
//                  ),
//                ],
//              ),
//            ),
//            Container(
//              padding: EdgeInsets.symmetric(
//                  horizontal: SizeConfig.screenWidth * 0.1),
//              child: Divider(
//                color: Colors.white,
//                thickness: 2,
//              ),
//            ),
//            _drawerOptions(StringValue.bookingPage, () {
//              setState(() {
//                _widget = BookingContainer();
//              });
////              Navigator.push(
////                  context,
////                  MaterialPageRoute(
////                      builder: (BuildContext context) =>
////                          _scaffoldChild(BookingContainer())));
//            }),
//            _drawerOptions(StringValue.profilePage, () {
//              setState(() {
//                _widget = ProfileContainer();
//              });
////              Navigator.push(
////                  context,
////                  MaterialPageRoute(
////                      builder: (BuildContext context) =>
////                          _scaffoldChild(ProfileContainer())));
//            }),
//            _drawerOptions("Call Log", () async {
//              List<dynamic> map = await callLogDone(widget.user.ivrNumber);
//              List<DataRow> dataRow = [];
//              map.forEach((b) {
//                dataRow.add(_buildTableRow(
//                    b['srl'],
//                    b['SourceNumber'],
//                    DateTime.parse(b['EndTime']).toString(),
//                    b['CallDuration']));
//              });
//              setState(() {
//                _widget = table(dataRow);
//              });
//            }),
//            _drawerOptions(StringValue.logOut, () {
//              showDialog(
//                  context: context,
//                  builder: (BuildContext context) {
//                    return LogoutDialog(widget.logout);
//                  });
//            }),
//          ],
//        ),
//      ),
//    );
//  }
  Widget _drawer() {
    return Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: new Text(widget.user.firstName),
              decoration: BoxDecoration(color: Colors.black26),
              accountEmail: new Text(widget.user.emailId),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/profilepic1.png'),
              )),

          // _createDrawerItem(icon: Icons.history, text: 'History',onTap:),
          _createDrawerItem(
              icon: Icons.call,
              text: 'Call Logs',
              onTap: () async {
                List<dynamic> map = await callLogDone(widget.user.ivrNumber);
                List<DataRow> dataRow = [];
                map.forEach((b) {
                  dataRow.add(_buildTableRow(
                      b['srl'],
                      b['SourceNumber'],
                      DateTime.parse(b['EndTime']).toString(),
                      b['CallDuration']));
                });
                setState(() {
                  Navigator.pop(context);
                  _widget = table(dataRow);
                });
              }),
          _createDrawerItem(
              icon: Icons.perm_contact_calendar,
              text: 'Profile',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            _scaffoldChild(ProfileContainer(), 'Profile')));
              }),
          _createDrawerItem(
              icon: Icons.book,
              text: 'Booking',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            _scaffoldChild(BookingContainer(), 'Booking')));
              }),
//          _createDrawerItem(
//              icon: Icons.local_post_office,
//              text: 'Posts',
//              onTap: () {
//                Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                        builder: (BuildContext context) =>
//                            _scaffoldChild(
//                                NotificationContainer(
//                                    widget.user.isClient ? false : true),'Posts')));
//              }),
          _createDrawerItem(
              icon: Icons.exit_to_app,
              text: 'Logout',
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return LogoutDialog(widget.logout);
                    });
              }),
        ],
      ),
    );
  }

  Widget _createDrawerItem({IconData icon, String text, Function onTap}) {
    return InkWell(
      child: ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon),
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(text),
            )
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _scaffoldChild(dynamic widget, String text) {
    return Scaffold(
      appBar: AppBar(
        title: Text(text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
      ),
      body: widget,
    );
  }

  DataRow _buildTableRow(String srn, String num, String date, String time) {
    return DataRow(cells: [
      DataCell(Text(srn)),
      DataCell(InkWell(
        child: Text(
          num,
          style: TextStyle(color: Colors.blue),
        ),
        onTap: () {
          Call().call(num);
        },
      )),
      DataCell(Text(date)),
      DataCell(Text(time)),
    ]);
  }
  Future logs () async {
    List<dynamic> map = await callLogDone(widget.user.ivrNumber);
    List<DataRow> dataRow = [];
    map.forEach((b) {
      dataRow.add(_buildTableRow(
          b['srl'],
          b['SourceNumber'],
          DateTime.parse(b['EndTime']).toString(),
          b['CallDuration']));
    });
    setState(() {
      Navigator.pop(context);
      _widget = table(dataRow);
    });
  }

//  Widget _scaffoldChild(Widget widget) {
//    return Scaffold(
//      body: widget,
//    );
//  }

  Widget _drawerOptions(String text, Function onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
//            border: Border.all(
//              color: Colors.white,
//            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.all(
          SizeConfig.screenHeight * 0.01,
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
