import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scretask/core/notifiers/home.notifier.dart';
import 'package:scretask/core/notifiers/user.data.notifier.dart';
import 'package:scretask/presentation/aboutScreen/about.user.dart';
import 'package:scretask/presentation/feedbackScreen/feedback.grp.dart';
import 'package:scretask/presentation/grpScreen/grp.screen.dart';
import 'package:scretask/presentation/homeScreen/widgets/home.bottomNav.dart';
import 'package:scretask/presentation/homeScreen/widgets/home.section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<UserDataNotifier>(context, listen: false)
        .decodeUserData(context: context);
    Provider.of<HomeNotifier>(context, listen: false).timeSetter();
    super.initState();
  }

  int pageIndex = 0;
  final PageController homePageController = PageController();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring:
          Provider.of<UserDataNotifier>(context, listen: true).getAllowTouch
              ? false
              : true,
      child: Scaffold(
        body: PageView(
          controller: homePageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (page) {
            setState(() {
              pageIndex = page;
            });
          },
          children: [
            const HomeSection(),
            const GrpScreen(),
            const AboutScreen(),
            FeedbackScreen()
          ],
        ),
        bottomNavigationBar: homeBottomNav(
          controller: homePageController,
          index: pageIndex,
        ),
      ),
    );
  }
}
