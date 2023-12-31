// ignore_for_file: unnecessary_set_literal

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scretask/app/routes/app.routes.dart';
import 'package:scretask/core/notifiers/authentication.notifer.dart';
import 'package:scretask/core/util/obscure.text.util.dart';
import 'package:scretask/presentation/widgets/custom.button.dart';
import 'package:scretask/presentation/widgets/custom.text.field.dart';
import 'package:scretask/presentation/widgets/custom.styles.dart';
import 'package:scretask/presentation/widgets/loading.dialog.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController userEmailController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _userLogin() {
      if (_formKey.currentState!.validate()) {
        LoadingDialog.showLoaderDialog(context: context);
        var authNotifier =
            Provider.of<AuthenticationNotifier>(context, listen: false);
        authNotifier
            .userLogin(
                context: context,
                useremail: userEmailController.text,
                userpassword: userPassController.text)
            .whenComplete(() => {Navigator.pop(context)});
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 24,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome back.",
                            style: kHeadline,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "You've been missed!",
                            style: kBodyText2,
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextField.customTextField(
                                  hintText: 'Email',
                                  inputType: TextInputType.text,
                                  textEditingController: userEmailController,
                                  validator: (val) =>
                                      !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                              .hasMatch(val!)
                                          ? 'Enter an email'
                                          : null,
                                ),
                                CustomTextField.customPasswordField(
                                  context: context,
                                  validator: (val) =>
                                      val!.isEmpty ? 'Enter a password' : null,
                                  onTap: () {
                                    Provider.of<ObscureTextUtil>(context,
                                            listen: false)
                                        .toggleObs();
                                  },
                                  textEditingController: userPassController,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Dont't have an account? ",
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRouter.signUpRoute);
                          },
                          child: Text(
                            'Register',
                            style: kBodyText.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton.customBtnLogin(
                      buttonName: 'Sign In',
                      onTap: () {
                        _userLogin();
                      },
                      bgColor: Colors.black,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
