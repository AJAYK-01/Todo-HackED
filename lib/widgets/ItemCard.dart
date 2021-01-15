import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final Function() onDelete;

  const ItemCard({Key key, this.title, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var heightRatio = MediaQuery.of(context).size.height / 812;
    var widthRatio = MediaQuery.of(context).size.width / 375;
    return Container(
      width: 331 * widthRatio,
      margin: EdgeInsets.symmetric(vertical: 15 * heightRatio),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 16 * widthRatio),
          Container(
            width: 290 * widthRatio,
            child: Text(
              title,
              style: TextStyle(
                color: Color(0XFFB3C6EA),
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          SizedBox(width: 16 * widthRatio),
          GestureDetector(
            onTap: onDelete,
            child: Container(
              height: 32 * heightRatio,
              width: 42 * heightRatio,
              child: Icon(
                Icons.check,
                size: 24,
                color: Colors.green,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
