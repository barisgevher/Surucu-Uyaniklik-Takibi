import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uyaniklik_takibi/ekranlar/giris.dart';
import 'package:uyaniklik_takibi/ekranlar/uyanikliktakibi/animasyon.dart';
import 'package:uyaniklik_takibi/giris.dart';

/*
String name;
String email;
String imageUrl;
*/
final FirebaseAuth auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final AuthService authService = AuthService();

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final Color pColor = Color(0xff18203d);

  final Color sColor = Color(0xff232c51);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController psswdController = TextEditingController();

  bool _validate = false;
  bool visible = true;
  late String email, password; //late

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0),
      backgroundColor: pColor,
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Uyanıklık takibi için kayıt olun',
                style: TextStyle(color: Colors.white, fontSize: 28),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text("Email ve şifre giriniz",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center),
              SizedBox(height: 50),
              _buildTextField(nameController, Icons.account_circle, 'Email'),
              SizedBox(height: 20),
              _buildTextField(psswdController, Icons.lock, 'Şifre'),
              SizedBox(height: 30),
              InkWell(
                child: Text("Hesabınız var mı? Giriş yapın!",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                    textAlign: TextAlign.center),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AuthScreen()));
                },
              ),
              SizedBox(height: 30),
              MaterialButton(
                elevation: 0.0,
                height: 50,
                minWidth: double.maxFinite,
                onPressed: () async {
                  try {
                    dynamic results = await auth.createUserWithEmailAndPassword(
                        email: nameController.text,
                        password: psswdController.text);
                    if (results != null) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                              (Route<dynamic> route) => false);
                    }
                  } catch (err) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Bir şeyler yanlış gitti.Tekrar deneyin!"),
                    ));
                    print(err);
                  }
                },
                child: Text("Kayıt ol",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          color: sColor,
          border: Border.all(color: Colors.blue)),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          icon: Icon(icon, color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
