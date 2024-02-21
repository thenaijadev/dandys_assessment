import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:minimalist_social_app/config/router/routes.dart';
import 'package:minimalist_social_app/core/validator/validator.dart';
import 'package:minimalist_social_app/core/widgets/loading_widget.dart';
import 'package:minimalist_social_app/core/widgets/snackbar.dart';
import 'package:minimalist_social_app/core/widgets/text_widget.dart';
import 'package:minimalist_social_app/features/auth/presentation/bloc/auth_bloc.dart';
// import 'package:minimalist_social_app/features/auth/presentation/widgets/biometrics_button.dart';
import 'package:minimalist_social_app/features/auth/presentation/widgets/form_button.dart';
import 'package:minimalist_social_app/features/auth/presentation/widgets/input_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormFieldState>();
  final emailKey_1 = GlobalKey<FormFieldState>();

  final nameKey = GlobalKey<FormFieldState>();

  final passwordKey = GlobalKey<FormFieldState>();
  final passwordKey_1 = GlobalKey<FormFieldState>();
  bool isInLogin = true;
  bool? emailState = false;
  bool? nameState = false;

  bool? passwordState = false;
  bool enabled = false;
  bool obscureText = true;
  bool? checkBoxValue = false;
  late PageController controller;
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> forms = [
      ListView(
        children: [
          FadeInUp(
            child: InputFieldWidget(
              textFieldkey: emailKey,
              label: "Your email address",
              hintText: "e.g:mark@gmail.com",
              onChanged: (val) {
                setState(() {
                  emailState = emailKey.currentState?.validate();
                });
              },
              validator: (val) {
                final emailState =
                    Validator.validateEmail(emailKey.currentState?.value);
                return emailState;
              },
              enabledBorderRadius: 10,
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 800),
            child: InputFieldWidget(
              textFieldkey: passwordKey,
              obscureText: obscureText,
              label: "Password",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon:
                    Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                color: Theme.of(context).colorScheme.secondary,
              ),
              hintText: "e.g: Password5&",
              onChanged: (val) {
                setState(() {
                  passwordState = passwordKey.currentState?.validate();
                });
              },
              validator: (val) {
                final passwordState =
                    Validator.validatePassword(passwordKey.currentState?.value);
                return passwordState;
              },
              enabledBorderRadius: 10,
            ),
          ),
          const Gap(10),
          FadeInUp(
            delay: const Duration(milliseconds: 1600),
            from: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.forgotPassword);
                  },
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          FadeInLeft(
            delay: const Duration(milliseconds: 2400),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateAuthError) {
                  InfoSnackBar.showErrorSnackBar(
                      context, state.authError.message);
                }
                if (state is AuthStateIsLoggedIn) {
                  if (state.user.isEmailVerified == false) {
                    Navigator.pushReplacementNamed(
                        context, Routes.emailVerification);
                    // logger.e(state.user.isEmailVerified);
                  }
                  Navigator.popAndPushNamed(context, Routes.home);
                }

                if (state is AuthStateBiometricsError) {
                  InfoSnackBar.showErrorSnackBar(context, state.error.message);
                }
              },
              builder: (context, state) {
                return state is AuthStateIsLoading
                    ? const LoadingWidget()
                    : FormButton(
                        label: "Login",
                        onTap: () {
                          if (emailState! && passwordState!) {
                            context.read<AuthBloc>().add(AuthEventLogin(
                                email: emailKey.currentState?.value,
                                password: passwordKey.currentState?.value));
                          }
                        },
                      );
              },
            ),
          ),
          const Gap(20),
        ],
      ),
      ListView(
        children: [
          FadeInUp(
            child: InputFieldWidget(
              textFieldkey: emailKey_1,
              label: "Your email address",
              hintText: "e.g:mark@gmail.com",
              onChanged: (val) {
                setState(() {
                  emailState = emailKey.currentState?.validate();
                });
              },
              validator: (val) {
                final emailState =
                    Validator.validateEmail(emailKey.currentState?.value);
                return emailState;
              },
              enabledBorderRadius: 10,
            ),
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 800),
            child: InputFieldWidget(
              textFieldkey: passwordKey_1,
              obscureText: obscureText,
              label: "Password",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon:
                    Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                color: Theme.of(context).colorScheme.secondary,
              ),
              hintText: "e.g: Password5&",
              onChanged: (val) {
                setState(() {
                  passwordState = passwordKey.currentState?.validate();
                });
              },
              validator: (val) {
                final passwordState =
                    Validator.validatePassword(passwordKey.currentState?.value);
                return passwordState;
              },
              enabledBorderRadius: 10,
            ),
          ),
          const Gap(58),
          FadeInUp(
            delay: const Duration(milliseconds: 1600),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthStateAuthError) {
                  InfoSnackBar.showErrorSnackBar(
                      context, state.authError.message);
                }
                if (state is AuthStateIsLoggedIn) {
                  if (state.user.isEmailVerified == false) {
                    Navigator.pushReplacementNamed(
                        context, Routes.emailVerification);
                    // logger.e(state.user.isEmailVerified);
                  }
                  Navigator.popAndPushNamed(context, Routes.home);
                }

                if (state is AuthStateBiometricsError) {
                  InfoSnackBar.showErrorSnackBar(context, state.error.message);
                }
              },
              builder: (context, state) {
                return state is AuthStateIsLoading
                    ? const LoadingWidget()
                    : FormButton(
                        label: "Register",
                        onTap: () {
                          if (emailState! && passwordState!) {
                            context.read<AuthBloc>().add(AuthEventLogin(
                                email: emailKey.currentState?.value,
                                password: passwordKey.currentState?.value));
                          }
                        },
                      );
              },
            ),
          ),
          const Gap(20),
        ],
      ),
    ];
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Form(
        key: formKey,
        child: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          Column(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * .6,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "images/login.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeInLeft(
                          delay: const Duration(milliseconds: -800),
                          child: TextWidget(
                              text: "GREY",
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                        FadeInUp(
                          child: TextWidget(
                              text: "Never too old for love",
                              fontSize: 16,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary),
                        ),
                        const SizedBox(
                          height: 120,
                        )
                      ],
                    ),
                  )),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: TextWidget(
                          text: "Login",
                          fontWeight:
                              isInLogin ? FontWeight.bold : FontWeight.normal,
                          decoration:
                              isInLogin ? TextDecoration.underline : null,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: TextWidget(
                          text: "Register",
                          decoration:
                              !isInLogin ? TextDecoration.underline : null,
                          fontWeight:
                              !isInLogin ? FontWeight.bold : FontWeight.normal,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 400,
                    child: PageView.builder(
                      controller: controller,
                      onPageChanged: (value) {
                        setState(() {
                          isInLogin = !isInLogin;
                        });
                      },
                      itemCount: forms.length,
                      itemBuilder: (context, index) {
                        return forms[index];
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
