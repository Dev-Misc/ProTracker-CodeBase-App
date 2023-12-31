import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scretask/app/routes/app.routes.dart';
import 'package:scretask/core/notifiers/user.data.notifier.dart';
import 'package:scretask/presentation/homeScreen/widgets/home.appbar.dart';
import 'package:scretask/presentation/homeScreen/widgets/home.createTask.dart';
import 'package:scretask/presentation/homeScreen/widgets/home.taskType.dart';
import 'package:scretask/presentation/pleaseWaitScreen/wait.screen.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Provider.of<UserDataNotifier>(context, listen: true).getAllowTouch
          ? Scaffold(
              floatingActionButton: FloatingActionButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 0,
                backgroundColor: Colors.black,
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRouter.createTaskRoute);
                },
                child: const Icon(
                  Icons.add,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.white,
              appBar: homeAppBar(context: context),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CreateTask(),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'Tasks',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: TaskType(),
                  )
                ],
              ),
            )
          : const WaitingScreen(),
    );
  }
}
