import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scretask/app/constants/app.colors.dart';
import 'package:scretask/app/routes/app.routes.dart';
import 'package:scretask/core/notifiers/authentication.notifer.dart';
import 'package:scretask/core/notifiers/user.data.notifier.dart';
import 'package:scretask/presentation/grpScreen/createGrpScreen/widget/create.appbar.dart';
import 'package:scretask/presentation/widgets/custom.text.field.dart';
import 'package:scretask/presentation/widgets/loading.dialog.dart';
import 'package:scretask/presentation/widgets/snackbar.widget.dart';

class AddGrpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  AddGrpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: createGrpBar(context: context),
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
                            hintText: 'Group Name',
                            textEditingController: titleController,
                            minLines: 1,
                          ),
                          CustomTextField.customTextField(
                            hintText: 'Group Description',
                            textEditingController: descController,
                            minLines: 1,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              constraints: const BoxConstraints(maxWidth: 290),
                              child: CustomTextField.customTextField(
                                hintText: 'Add User By Email',
                                textEditingController: emailController,
                                minLines: 1,
                                maxLines: 3,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            var userProfileData = Provider.of<UserDataNotifier>(
                                context,
                                listen: false);

                            if (titleController.text.isNotEmpty &&
                                emailController.text.isNotEmpty) {
                              _sendEmailGroup(
                                context: context,
                                email: emailController.text,
                                grpName: titleController.text,
                                admin: userProfileData.getName!,
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackUtil.stylishSnackBar(
                                  text: 'Group Name and Group Desc',
                                  context: context,
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.send),
                        ),
                      ],
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
                            .addGroup(
                                titleController.text, descController.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackUtil.stylishSnackBar(
                            text: "Group Added Successfully",
                            context: context,
                          ),
                        );
                        Navigator.of(context)
                            .pushReplacementNamed(AppRouter.homeRoute);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackUtil.stylishSnackBar(
                            text: 'Group Name and Group Desc',
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
                        'Create Grp',
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

_sendEmailGroup(
    {required BuildContext context,
    required String email,
    required String grpName,
    required String admin}) {
  LoadingDialog.showLoaderDialog(context: context);
  Provider.of<AuthenticationNotifier>(context, listen: false).sendGroupEmail(
    useremail: email,
    grpName: grpName,
    byAdmin: admin,
    context: context,
  );
}
