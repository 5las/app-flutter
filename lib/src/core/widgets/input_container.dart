import 'package:flutter/widgets.dart';

class InputContainer extends StatelessWidget {
  Widget child;

  InputContainer({@required this.child});
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);

    return Container(
      width: _mediaQuery.size.width * 0.85,
      height: 42.0,
      child: child,
    );
  }
}
