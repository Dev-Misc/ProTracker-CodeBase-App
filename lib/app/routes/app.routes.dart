import 'package:flutter/material.dart';
import 'package:scretask/presentation/deciderScreen/decider.screen.dart';
import 'package:scretask/presentation/emailVerificationScreen/verification.screen.dart';
import 'package:scretask/presentation/grpScreen/createGrpScreen/grp.tasks.screen.dart';
import 'package:scretask/presentation/grpScreen/grp.screen.dart';
import 'package:scretask/presentation/homeScreen/home.screen.dart';
import 'package:scretask/presentation/loginScreen/login.screen.dart';
import 'package:scretask/presentation/signupScreen/signup.screen.dart';
import 'package:scretask/presentation/splashScreen/splash.screen.dart';
import 'package:scretask/presentation/taskScreens/createTaskScreen/create.tasks.screen.dart';
import 'package:scretask/presentation/taskScreens/editTaskScreen/edit.tasks.screen.dart';
import 'package:scretask/presentation/taskScreens/taskTypeScreen/task.type.screen.dart';

class AppRouter {
  static const String homeRoute = "/home";
  static const String splashRoute = "/splash";
  static const String createTaskRoute = "/create";
  static const String loginRoute = "/login";
  static const String deciderRoute = "/decider";
  static const String signUpRoute = "/signup";
  static const String verificationRoute = "/verification";
  static const String taskTypeRoute = "/taskType";
  static const String editTask = "/edit";
  static const String grpScreen = "/grp";
  static const String createGrp = "/createGrp";

  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case verificationRoute:
        {
          return MaterialPageRoute(
            builder: (_) => VerificationScreen(),
          );
        }
      case taskTypeRoute:
        {
          return MaterialPageRoute(
            builder: (context) => TaskTypeScreen(
              taskTypeArgs:
                  ModalRoute.of(context)!.settings.arguments as TaskTypeArgs,
            ),
            settings: settings,
          );
        }
      case editTask:
        {
          return MaterialPageRoute(
            builder: (context) => EditTaskScreen(
              editTaskArgs:
                  ModalRoute.of(context)!.settings.arguments as EditTaskArgs,
            ),
            settings: settings,
          );
        }
      case deciderRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const DeciderScreen(),
          );
        }
      case loginRoute:
        {
          return MaterialPageRoute(
            builder: (_) => LoginScreen(),
          );
        }
      case signUpRoute:
        {
          return MaterialPageRoute(
            builder: (_) => SignUpScreen(),
          );
        }
      case homeRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const HomeScreen(),
          );
        }
      case splashRoute:
        {
          return MaterialPageRoute(
            builder: (_) => const SplashScreen(),
          );
        }

      case createTaskRoute:
        {
          return MaterialPageRoute(
            builder: (_) => CreateTaskScreen(),
          );
        }

      case grpScreen:
        {
          return MaterialPageRoute(
            builder: (_) => const GrpScreen(),
          );
        }

      case createGrp:
        {
          return MaterialPageRoute(
            builder: (_) => AddGrpScreen(),
          );
        }

      default:
        {
          return MaterialPageRoute(
            builder: (_) => const DeciderScreen(),
          );
        }
    }
  }
}
