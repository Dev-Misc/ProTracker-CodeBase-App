// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:scretask/app/constants/app.assets.dart';
import 'package:scretask/app/routes/app.routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  void _initiateCache({required BuildContext context}) async {
    // final prefs = await SharedPreferences.getInstance();
    // final String? action = prefs.getString(AppConst.splashKey);
    // var dAuth = await Provider.of<LocalAuthService>(context, listen: false)
    //     .authenticate();
    // if (!kIsWeb) {
    //   if (dAuth) {
    //     if (action == null) {
    //       Navigator.of(context).pushReplacementNamed(AppRouter.deciderRoute);
    //     } else {
    //       Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute);
    //     }
    //   } else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackUtil.stylishSnackBar(
    //         text: 'Please Complete Biometric Auth',
    //         context: context,
    //       ),
    //     );
    //   }
    // } else {
    //   if (action == null) {
    Navigator.of(context).pushReplacementNamed(AppRouter.deciderRoute);
    //   } else {
    // Navigator.of(context).pushReplacementNamed(AppRouter.homeRoute);
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              'ProTracker',
              style: TextStyle(
                fontSize: 42,
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IconButton(
              icon: Image.asset(
                width: 200,
                AppAssets.fprint,
              ),
              onPressed: () {
                _initiateCache(context: context);
              },
              iconSize: 130,
            ),
          ),
        ],
      )),
    );
  }
}
