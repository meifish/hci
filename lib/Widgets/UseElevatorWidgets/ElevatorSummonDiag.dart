import 'package:flutter/material.dart';

class ElevatorSummonDiag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      backgroundColor: Colors.white,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) {
    return Container(
        height: 200,
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                    "Successful! Your Elevator will come in 4.5 seconds.",
                    style: TextStyle(fontSize: 24))),
            SizedBox(height: 10),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK I got it.')),
          ],
        ));
  }
}
