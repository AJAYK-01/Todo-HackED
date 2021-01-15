import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final tooltip, ficon;
  final Function onPressed;
  const AddButton({Key key, this.onPressed, this.tooltip, this.ficon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0XFFF6376D),
      onPressed: () {

        onPressed();
      },
      tooltip: tooltip,
      child: Icon(ficon),
    );
  }
}
