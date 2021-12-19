import 'package:flutter/material.dart';


class SelectOption extends StatefulWidget {
  const SelectOption({Key? key}) : super(key: key);

  @override
  _SelectOptionState createState() => _SelectOptionState();
}

class _SelectOptionState extends State<SelectOption> {
  final Color buttonColor = const Color(0xff2e3b62);
  final bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 400,
    child: Column(
      children: [
        const SizedBox(height: 150,),
        const Text("Please select your profile",
          textScaleFactor: 1.5,
          style: TextStyle(fontWeight: FontWeight.bold),),
        const SizedBox(height: 30,),
        Container(height: 80,
          width: 360,
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
          children: [
            Radio(
              value: 1,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = 1;
                });
              },
              activeColor: Colors.black,
            ),
            const Image(image: ResizeImage(AssetImage("Images/home.png"), width: 60, height: 60),),
            Container(
                width: 200,
                padding: const EdgeInsets.symmetric(horizontal:12, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 10,),
                    Text('Shipper',
                      style: TextStyle(fontSize: 19),),
                    SizedBox(height: 10,),
                    Text('Lorem ipsum dolor sit amet',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.start,),
                    Text('consectuer adipiscing',
                      style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.start,)
                  ],
                )
            )
          ],
        ),),
        const SizedBox(height: 30,),
        Container(height: 80,
          width: 360,
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
            children: [
              Radio(
                value: 2,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = 2;
                  });
                },
                activeColor: Colors.black,
              ),
              const Image(image: ResizeImage(AssetImage("Images/truck.png"), width: 60, height: 60),),
              Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(horizontal:12, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 10,),
                      Text('Transporter',
                      style: TextStyle(fontSize: 19),),
                      SizedBox(height: 10,),
                      Text('Lorem ipsum dolor sit amet',
                        style: TextStyle(fontSize: 12),
                      textAlign: TextAlign.start,),
                      Text('consectuer adipiscing',
                        style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.start,)
                    ],
                  )
              )
            ],
          ),
        ),
        const SizedBox(height: 25,),
        SizedBox(
          width: 360,
          child: MaterialButton(
              onPressed: (){},
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
    ),
    );
  }
}
