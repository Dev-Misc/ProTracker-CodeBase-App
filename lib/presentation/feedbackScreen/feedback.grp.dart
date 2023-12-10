import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scretask/app/constants/app.colors.dart';
import 'package:scretask/core/notifiers/authentication.notifer.dart';
import 'package:scretask/core/notifiers/user.data.notifier.dart';
import 'package:scretask/presentation/widgets/custom.text.field.dart';
import 'package:scretask/presentation/widgets/loading.dialog.dart';
import 'package:scretask/presentation/widgets/snackbar.widget.dart';

class FeedbackScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userProfileData = Provider.of<UserDataNotifier>(context, listen: false);

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Feedback Time',
          style: TextStyle(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                width: width,
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextField.customTextField(
                            hintText: 'Feedback Name',
                            textEditingController: titleController,
                            minLines: 1,
                          ),
                          CustomTextField.customTextField(
                            hintText: 'Feedback Description',
                            textEditingController: descController,
                            minLines: 1,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 80,
              width: width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (titleController.text.isNotEmpty &&
                          descController.text.isNotEmpty) {
                        LoadingDialog.showLoaderDialog(context: context);
                        Provider.of<AuthenticationNotifier>(context,
                                listen: false)
                            .sendFeedback(
                          title: titleController.text,
                          desc: descController.text,
                          addedBy: userProfileData.getName!,
                          context: context,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackUtil.stylishSnackBar(
                            text: "Feedback Added Successfully",
                            context: context,
                          ),
                        );
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackUtil.stylishSnackBar(
                            text: 'Task Name and Task Description is Required',
                            context: context,
                          ),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                      width: width - 40,
                      decoration: BoxDecoration(
                        color: AppColors.perano,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        'Create Feedback',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
