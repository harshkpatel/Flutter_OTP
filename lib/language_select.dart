import 'package:flutter/material.dart';
import 'phone_number_screen.dart';

class LanguageSelect extends StatefulWidget {
  const LanguageSelect({Key? key}) : super(key: key);

  @override
  _LanguageSelectState createState() => _LanguageSelectState();
}

class _LanguageSelectState extends State<LanguageSelect> {

  final items = ["English"];
  final Color buttonColor = const Color(0xff2e3b62);

  String ? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
              width: MediaQuery.of(context).size.width,
              child: const Image(image: ResizeImage(AssetImage('Images/logo.png',), width: 55, height: 55),)
          ),
          const SizedBox(height: 10),
          const Text("Please select your Language",
          textScaleFactor: 1.5,
          style: TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 6),
          const SizedBox(
            height: 60,
            width: 190,
            child: Text("You can change the language at any time.",
            textAlign: TextAlign.center,),
          ),
          Container(
            height: 60,
            width: 230,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 1.0, color: Color(0xFF000000)),
                left: BorderSide(width: 1.0, color: Color(0xFF000000)),
                right: BorderSide(width: 1.0, color: Color(0xFF000000)),
                bottom: BorderSide(width: 1.0, color: Color(0xFF000000)),
              ),
            ),
            child: DropdownButton<String>(
              itemHeight: 75,
              isExpanded: true,
              value: "English",
              items: items.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() => this.value = value),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: 230,
            child: MaterialButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PhoneNumberScreen()));
            },
                height: 45,
                color: buttonColor,
                textColor: Colors.white,
                child: const Text("NEXT",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),)),
          ),
        ],
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: const Image(image: ResizeImage(AssetImage('Images/bottom.png',), width: 400, height: 110),)
      ),
    );
  }
  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item,
      child: Text(item, textAlign: TextAlign.center,));
}
