import 'package:flutter/material.dart';

class MIALoading {

  static bool isInstanceRunning = false;

  static void show(BuildContext context) {

    if(MIALoading.isInstanceRunning){
      return;
    }

    MIALoading.isInstanceRunning = true;
    showDialog(
      context: context, 
      builder: (context) => MIALoadingWidget(),
      barrierDismissible: false,
    );
  }

  static void hide(BuildContext context) {
    if(MIALoading.isInstanceRunning){
      MIALoading.isInstanceRunning = false;
      Navigator.of(context).pop();
    }
  }
}

class MIALoadingWidget extends StatelessWidget {

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
        "Loading...",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(height: 16.0),
    ],
  ),
    );
  }
}