import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/app/cubit/root_cubit.dart';
import 'package:sneaky_shopper/app/injection_container.dart';
import 'package:sneaky_shopper/common_widgets_themes/textbutton_theme.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RootCubit>(
      create: (context) => getIt(),
      child: BlocConsumer<RootCubit, RootState>(
        listener: (context, state) {
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  errorMessage,
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xff2D9A8D),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                        image: AssetImage('images/logo.png'), width: 144),
                    Text(
                      'Sneaky Shopper',
                      style: GoogleFonts.teko(
                          color: const Color(0xffBBFFF7), fontSize: 48),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 4),
                      child: _ThemedTextField(
                        controller: emailController,
                        obscureText: false,
                        text: 'E-mail',
                        icon: const Icon(Icons.mail, color: Colors.black),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 4),
                        child: _ThemedTextField(
                          controller: passwordController,
                          obscureText: true,
                          text: 'Password',
                          icon:
                              const Icon(Icons.key_sharp, color: Colors.black),
                        )),
                    if (state.isCreatingAccount == true) ...[
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 4),
                          child: _ThemedTextField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            text: 'Confirm password',
                            icon: const Icon(Icons.check, color: Colors.black),
                          )
                          //
                          ),
                    ],
                    if (state.isCreatingAccount == true) ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ThemedTextButton(
                          text: 'Already have an account? Login',
                          onPressed: () {
                            context.read<RootCubit>().notCreatingAccount();
                          },
                        ),
                      ),
                    ],
                    if (state.isCreatingAccount == false) ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ThemedTextButton(
                          text: 'Don\'t have an account? Register',
                          onPressed: () {
                            context.read<RootCubit>().creatingAccount();
                          },
                        ),
                      ),
                    ],
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.black, width: 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        backgroundColor: const Color(0xffff40ac),
                      ),
                      onPressed: () async {
                        if (state.isCreatingAccount == true) {
                          // registration
                          context.read<RootCubit>().register(
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                              );
                        }
                        // login
                        context.read<RootCubit>().signIn(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      },
                      child: Text(
                        state.isCreatingAccount == true ? 'Register' : 'Login',
                        style:
                            GoogleFonts.teko(color: Colors.white, fontSize: 32),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ThemedTextField extends StatelessWidget {
  const _ThemedTextField({
    required this.controller,
    required this.text,
    required this.icon,
    required this.obscureText,
  });

  final TextEditingController controller;
  final String text;
  final Icon icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        filled: true,
        fillColor: const Color(0xffD9D9D9),
        prefixIcon: icon,
        hintText: text,
        hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
