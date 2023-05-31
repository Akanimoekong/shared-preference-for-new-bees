import 'package:flutter/material.dart';
import 'package:flutter_constraintlayout/flutter_constraintlayout.dart';
import 'package:mysharedpref_example/displaypage.dart';
import 'package:mysharedpref_example/preference_file.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  TextEditingController firstInputController = TextEditingController();
  TextEditingController secondInputController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.shade800,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white70,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  16,
                ),
              ),
            ),
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome back',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              Text(
                'Enter Inputs below',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 8),
                child: TextFormField(
                  controller: firstInputController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter first Input',
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16, bottom: 8),
                child: TextFormField(
                  controller: secondInputController,
                  decoration: InputDecoration(
                    label: Text(
                      'Enter Second Input',
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 60,
                margin: EdgeInsets.only(
                  top: 32,
                  right: 8,
                  left: 8,
                ),
                child: ElevatedButton(
                    onPressed: () {
                      executeButton();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => CreatePassword(),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      maximumSize: Size(double.infinity, 100),
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Save to Preference', style: TextStyle(color: Colors.white))),
              )
            ],
          ),

          ),
        ),
      ),
    );
  }

  buildme(){
    if (firstInputController.text.isNotEmpty || secondInputController.text.isNotEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DisplayPage()));
    } else {
      var snackBar = SnackBar(
        content: Text('One of the Input field is Empty'),
        backgroundColor: Colors.blueGrey,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }
}
  execute() async{
    await MyPreferences.setFirstInput(firstInputController.text.trim());
    await MyPreferences.setSecondInput(secondInputController.text.trim());
  }

  executeButton(){
    buildme();
    execute();
  }




}
