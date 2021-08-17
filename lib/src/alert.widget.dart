import 'package:flutter/material.dart';

import 'loading.widget.dart';

class MIAAlert {

  static void show(BuildContext context, {
    required String title,
    String? subtitle,
  }) {

    if(MIALoading.isInstanceRunning){
      MIALoading.isInstanceRunning = false;
      Navigator.of(context).pop();
    }

    showDialog(context: context, builder: (context) => MIAAlertWidget(title: title, subtitle: subtitle,));
  }

}

class MIAAlertWidget extends StatelessWidget {

  final String title;
  final String? subtitle;

  const MIAAlertWidget({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),      
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
  padding: EdgeInsets.only(
    top: 16,
    bottom: 16,
    left: 16,
    right: 16,
  ),
  margin: EdgeInsets.only(top: 66),
  decoration: new BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10.0,
        offset: const Offset(0.0, 10.0),
      ),
    ],
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min, // To make the card compact
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(height: 16.0),
      Text(
        subtitle ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.0,
        ),
      ),
      SizedBox(height: 24.0),
      Align(
        alignment: Alignment.bottomRight,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            textStyle: MaterialStateProperty.all(TextStyle(
              color: Colors.white
              )),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ))
          ),
          onPressed: () {
            Navigator.of(context).pop(); // To close the dialog
          },
          child: Text("OK!"),
        ),
      ),
    ],
  ),
    );
  }
}