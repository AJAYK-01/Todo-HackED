import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final tooltip, ficon;
  final Function onPressed;
  const AddButton({Key key, this.onPressed, this.tooltip, this.ficon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ficon = widget.ficon;
    return FloatingActionButton(
      backgroundColor: Color(0XFFF6376D),
      onPressed: () {
        // if (widget.ficon == Icons.add) {
        //   setState(() {
        //     ficon = Icons.cancel_rounded;
        //   });
        // } else {
        //   setState(() {
        //     ficon = Icons.add;
        //   });
        // }
        onPressed();
      },
      tooltip: tooltip,
      child: Icon(ficon),
    );
  }
}
