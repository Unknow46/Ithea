import 'package:flutter/widgets.dart';

class CustomTextStyle extends StatelessWidget {
  const CustomTextStyle(this.text, this._fontWeight,this._size, {Key key, this.colors }):super(key:key);

  final String text;
  final FontWeight _fontWeight;
  final double _size;
  final dynamic colors;

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(
      fontWeight: _fontWeight,
      fontSize: _size,
      fontFamily: 'Roboto',
      color: colors,
      ),
    );
  }
}
