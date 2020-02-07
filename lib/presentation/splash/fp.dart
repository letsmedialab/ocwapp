import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ocwapp/containers/home_page_container.dart';
import 'package:ocwapp/containers/splash_container.dart';
import 'package:ocwapp/models/user/user.dart';
import 'package:ocwapp/presentation/splash/loader.dart';
import 'package:ocwapp/utils/globals.dart';
import 'package:ocwapp/utils/size_config.dart';

class FrontPage extends StatefulWidget {
  static const String routeNamed = 'Front page';

  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration d) {
      preferenceService.getAuthUser().then((User user) {
        Future.delayed((Duration(seconds: 5)), () {
          if (user != null) {
            Navigator.pushReplacementNamed(
                context, HomePageContainer.routeNamed);
          } else {
            Navigator.pushReplacementNamed(context, SplashContainer.routeNamed);
          }
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Container(
                height: SizeConfig.screenHeight * 0.2,
                width: SizeConfig.screenWidth * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    border: Border.all(color: Colors.black38, width: 10)),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://cleanngo.in/inside/images/logo/logo-app-profile.png',
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[Loader()],
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
