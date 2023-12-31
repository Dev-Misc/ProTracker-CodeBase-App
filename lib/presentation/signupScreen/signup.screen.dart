import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scretask/app/routes/app.routes.dart';
import 'package:scretask/core/notifiers/authentication.notifer.dart';
import 'package:scretask/core/services/photo.service.dart';
import 'package:scretask/core/util/obscure.text.util.dart';
import 'package:scretask/presentation/widgets/custom.button.dart';
import 'package:scretask/presentation/widgets/custom.text.field.dart';
import 'package:scretask/presentation/widgets/custom.styles.dart';
import 'package:scretask/presentation/widgets/loading.dialog.dart';
import 'package:scretask/presentation/widgets/snackbar.widget.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController userSecurityCodeController =
      TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userPassController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            "Register",
                            style: kHeadline,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Create new account to get started.",
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
                                  enabled: false,
                                  initialValue:
                                      Provider.of<AuthenticationNotifier>(
                                              context,
                                              listen: false)
                                          .getEmail,
                                  inputType: TextInputType.text,
                                ),
                                CustomTextField.customTextField(
                                  hintText: 'Username',
                                  inputType: TextInputType.text,
                                  textEditingController: userNameController,
                                  validator: (val) =>
                                      val!.isEmpty ? 'Enter a username' : null,
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
                                CustomTextField.customTextField(
                                  hintText: 'Security Code',
                                  inputType: TextInputType.number,
                                  maxLength: 4,
                                  textEditingController:
                                      userSecurityCodeController,
                                  validator: (val) => val!.isEmpty
                                      ? 'Enter Security Code'
                                      : null,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // const DisplayPhotoSignUp(),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: kBodyText,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRouter.loginRoute);
                          },
                          child: Text(
                            'Sign In',
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
                      buttonName: 'Register',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Provider.of<PhotoService>(context, listen: false)
                                  .photo_url =
                              "https://www.conserve-energy-future.com/wp-content/uploads/2020/07/Sunflower.jpg";

                          if (Provider.of<PhotoService>(context, listen: false)
                                  .photo_url ==
                              null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackUtil.stylishSnackBar(
                                text: 'Please Select Profile Pic',
                                context: context,
                              ),
                            );
                          } else {
                            LoadingDialog.showLoaderDialog(context: context);

                            Provider.of<AuthenticationNotifier>(context,
                                    listen: false)
                                .createAccount(
                                  context: context,
                                  username: userNameController.text,
                                  secretcodeinput:
                                      userSecurityCodeController.text,
                                  userpassword: userPassController.text,
                                )
                                .whenComplete(() => Navigator.pop(context));
                          }
                        }
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
