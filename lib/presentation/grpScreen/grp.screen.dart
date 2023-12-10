import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scretask/app/routes/app.routes.dart';
import 'package:scretask/core/notifiers/authentication.notifer.dart';
import 'package:scretask/presentation/grpScreen/grp.tile.dart';

class GrpScreen extends StatefulWidget {
  const GrpScreen({Key? key}) : super(key: key);

  @override
  _GrpScreenState createState() => _GrpScreenState();
}

class _GrpScreenState extends State<GrpScreen> {
  @override
  Widget build(BuildContext context) {
    // Access the AuthenticationNotifier using Provider
    AuthenticationNotifier authNotifier =
        Provider.of<AuthenticationNotifier>(context);

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.of(context).pushNamed(AppRouter.createGrp);
          },
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            const Text(
              "Groups",
              style: TextStyle(fontSize: 50),
            ),
            // Display groups using ListView.builder
            Expanded(
              child: ListView.builder(
                itemCount: authNotifier.groups.length,
                itemBuilder: (context, index) {
                  return grpTile(
                    context: context,
                    name: authNotifier.groups[index]['name']!,
                    desc: authNotifier.groups[index]['desc']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
