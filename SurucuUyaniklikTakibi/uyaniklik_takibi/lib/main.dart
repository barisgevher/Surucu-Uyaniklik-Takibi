import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:lottie/lottie.dart';
import 'package:uyaniklik_takibi/ekranlar/giris.dart';
import 'package:uyaniklik_takibi/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, //ekledim tamamını
  );
  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.debug,
    appleProvider: AppleProvider.appAttest,
  );


  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: "LexendDeca",
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  static const TextStyle goldcoinGreyStyle = TextStyle(
      color: Colors.grey,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "LexendDeca");

  static const TextStyle goldCoinWhiteStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "LexendDeca");
  static const TextStyle goldCoinBlackStyle = TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "LexendDeca");

  static const TextStyle greyStyle =
  TextStyle(fontSize: 40.0, color: Colors.grey, fontFamily: "LexendDeca");

  static const TextStyle whiteStyle =
  TextStyle(fontSize: 40.0, color: Colors.white, fontFamily: "LexendDeca");

  static const TextStyle blueStyle = TextStyle(
      fontSize: 40.0, color: Color(0xff404040), fontFamily: "LexendDeca");

  static const TextStyle boldStyle = TextStyle(
    fontSize: 50.0,
    color: Colors.black,
    fontFamily: "LexendDeca",
    fontWeight: FontWeight.bold,
  );

  static const TextStyle descriptionGreyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
    fontFamily: "LexendDeca",
  );

  static const TextStyle descriptionWhiteStyle = TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    fontFamily: "LexendDeca",
  );

  static const TextStyle descriptionBlueStyle = TextStyle(
    color: Color(0xff404040),
    fontSize: 20.0,
    fontFamily: "LexendDeca",
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LiquidSwipe(
          pages: [
            Container(
              color: Color(0xffb6e4f8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/SürücüGözü.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Sürücü Uyanıklık Takibi",
                                style: goldCoinBlackStyle,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthScreen()));
                          },
                          child: Text(
                            "Giriş",
                            style: goldCoinBlackStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Center(
                    child: Lottie.asset("assets/lottie/face-scan.json",
                        width: 300, fit: BoxFit.fill),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Göz",
                          style: greyStyle,
                        ),
                        Text(
                          "Takibi",
                          style: boldStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Gerçek zamanlı\n"
                              "eğitilmiş model ile\n"
                              "uyanıklık takibi",
                          style: descriptionGreyStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Color(0xffefefef),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/SürücüGözü.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Sürücü Uyanıklık Takibi",
                                style: goldcoinGreyStyle,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthScreen()));
                          },
                          child: Text(
                            "Giriş",
                            style: goldcoinGreyStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Lottie.asset("assets/lottie/secure.json"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Daha",
                          style: blueStyle,
                        ),
                        Text(
                          "Güvenli ",
                          style: boldStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Daha güvenli\n"
                              "sürüşler için \n"
                              "göz takibi",
                          style: descriptionBlueStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage("assets/SürücüGözü.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Sürücü Uyanıklık Takibi",
                                style: goldCoinWhiteStyle,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AuthScreen()));
                          },
                          child: Text(
                            "Giriş",
                            style: goldCoinWhiteStyle,
                          ),
                        )
                      ],
                    ),
                  ),
                  Lottie.asset("assets/lottie/drive.json"),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Risksiz",
                          style: whiteStyle,
                        ),
                        Text(
                          "Sürüş",
                          style: boldStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Risksiz sürüş\n"
                              "deneyimi\n"
                              "",
                          style: descriptionWhiteStyle,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
          enableLoop: true,
          fullTransitionValue: 300,
          waveType: WaveType.liquidReveal,
          positionSlideIcon: 0.5,
        ),
      ),
    );
  }
}
