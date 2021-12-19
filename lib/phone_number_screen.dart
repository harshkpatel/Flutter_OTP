import 'package:flutter/material.dart';
import 'package:otp_verification/language_select.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/otp_field.dart';
import 'select.dart';

FirebaseAuth auth = FirebaseAuth.instance;
String verificationIdReceived = "";
String code = "";
TextEditingController phoneController = TextEditingController();

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {

  final Color buttonColor = const Color(0xff2e3b62);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              IconButton(
                icon: const Image(image: ResizeImage(AssetImage("Images/cross.png"), width: 25, height: 22),) ,
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LanguageSelect()));
                },
              )
            ],
          ),
              const SizedBox(height: 100,),
              const SizedBox(
                width: 400,
                child: Text("Please enter your mobile number",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,),
              ),
              const SizedBox(height: 6),
              const SizedBox(
                width: 400,
                child: Text("You'll recieve a 6 digit code",
                  textAlign: TextAlign.center,),
              ),
              const SizedBox(
                height: 60,
                width: 400,
                child: Text("to verify next.",
                  textAlign: TextAlign.center,),
              ),
              Container(
                height: 50,
                width: 400,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Color(0xFF000000)),
                    left: BorderSide(width: 1.0, color: Color(0xFF000000)),
                    right: BorderSide(width: 1.0, color: Color(0xFF000000)),
                    bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
                  ),
                ),
                child: Row(
                  children:[
                    const Image(image: ResizeImage(AssetImage("Images/flag.jpeg"), width: 30, height: 20),),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal:12, vertical: 0),
                      width: 65,
                      child: const Text("+91   -",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                    ),
                    Flexible(
                      child: TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          hintText: "Mobile Number"
                      ),
                        keyboardType: TextInputType.phone,),
                    ),
                  ]
                ),
                ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 400,
                child: MaterialButton(
                    onPressed: (){
                      sendCode();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CodeScreen(phoneNumber: phoneController.text)));
                    },
                    height: 50,
                    color: buttonColor,
                    textColor: Colors.white,
                    child: const Text("CONTINUE",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),)),
              ),
            ],
          ),
        )
    );
  }
  Future sendCode() async {

    var phoneNumber = "+91" + phoneController.text;
    var verifyNumber = auth.verifyPhoneNumber(phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential){
          auth.signInWithCredential(credential).then((value){

          });
        },
        verificationFailed: (FirebaseException exception){

        },
        codeSent: (String verificationID, int? resendToken){

          verificationIdReceived = verificationID;
          setState(() {

          });
        },
        codeAutoRetrievalTimeout: (String verificationID){

        });
    await verifyNumber;
  }
}
class CodeScreen extends StatefulWidget {
  String phoneNumber;

  CodeScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _CodeScreenState createState() => _CodeScreenState();
}
class _CodeScreenState extends State<CodeScreen> {
  final Color buttonColor = const Color(0xff2e3b62);

  TextStyle defaultStyle = const TextStyle(
      fontWeight: FontWeight.normal, color: Colors.black, fontSize: 15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => PhoneNumberScreen()));
                    },
                  )
                ],
              ),
              const SizedBox(height: 100,),
              const SizedBox(
                width: 400,
                child: Text("Verify Phone",
                  textScaleFactor: 1.5,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,),
              ),
              const SizedBox(height: 6),
              SizedBox(
                width: 400,
                child: Text("Code is sent to " + widget.phoneNumber,
                  textAlign: TextAlign.center,),
              ),
              const SizedBox(height: 20,),
              OTPTextField(
                length: 6,
                outlineBorderRadius: 0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                fieldWidth: 50,
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: Color(0xff93d3f3),
                  borderColor: Colors.white,
                ),
                style: const TextStyle(
                    fontSize: 18
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                onCompleted: (pin) {
                  code = pin;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 400,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: defaultStyle,
                    text: "Didn\'t get the code? ",
                    children: <TextSpan>[
                      TextSpan(text: 'Request Again',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              sendCode();
                            }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 400,
                child: MaterialButton(
                    onPressed: () {
                      verifyCode();
                    },
                    height: 50,
                    color: buttonColor,
                    textColor: Colors.white,
                    child: const Text("VERIFY AND CONTINUE",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),)),
              ),
            ],
          ),
        )
    );
  }
  Future sendCode() async {
    var phoneNumber = "+91" + phoneController.text;
    var verifyNumber = auth.verifyPhoneNumber(phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {
          auth.signInWithCredential(credential).then((value) {

          });
        },
        verificationFailed: (FirebaseException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verificationIdReceived = verificationID;
          setState(() {

          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {

        });
    await verifyNumber;
  }

  Future<void> verifyCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIdReceived, smsCode: code);

    await auth.signInWithCredential(credential).then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => SelectOption()));
    });
  }
}