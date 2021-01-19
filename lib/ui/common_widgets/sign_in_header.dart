import 'package:flutter/material.dart';
import 'package:test_app/config.dart';
import 'package:test_app/utils/screen_dimensions.dart';

class SignInHeader extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    final hMultiplier = ScreenDimensions.getInstance().getHeightMultiplier();
    return AppBar(
      elevation: 0,
      leading: IconButton (
        icon:Icon(Icons.arrow_back_ios, size: 19.93 * hMultiplier,),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black, size: 1.0),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

}