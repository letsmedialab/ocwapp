import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ocwapp/containers/home_page_container.dart';
import 'package:ocwapp/containers/login_container.dart';
import 'package:ocwapp/utils/size_config.dart';
import 'package:ocwapp/utils/string.dart';

class PromptSignUpPage extends StatelessWidget {
  static const String routeNamed = 'Splash Sign Up';
  final bool isLoggedIn;

  PromptSignUpPage({this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return isLoggedIn
        ? HomePageContainer()
        : SafeArea(
            child: Scaffold(
                body: Container(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.cover),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: SizeConfig.screenHeight * 0.07,
                    left: SizeConfig.screenWidth * 0.2,
                    right: SizeConfig.screenWidth * 0.2,
                    child: Container(
                      height: SizeConfig.screenHeight*0.2,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://cleanngo.in/inside/images/logo/logo-app-profile1.png',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, LoginContainer.routeNamed);
                        },
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            margin: EdgeInsets.all(15),
                            child: Text(
                              'Skip',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.5,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(
                              height: SizeConfig.screenHeight*0.1,
                            ),
                            Container(
                              child: Text(
                                StringValue.welcomeMessage,
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w300),
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.screenHeight * 0.07,
                            ),
                            RaisedButton(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.black12)),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, LoginContainer.routeNamed);
                              },
                              color: Theme.of(context).primaryColor,
                              child: Container(
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  width: SizeConfig.screenWidth * 0.5,
                                  height: SizeConfig.screenHeight * 0.07,
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          );
  }
}
