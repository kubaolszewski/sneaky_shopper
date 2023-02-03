import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sneaky_shopper/app/core/enums.dart';
import 'package:sneaky_shopper/app/cubit/root_cubit.dart';
import 'package:sneaky_shopper/app/injection_container.dart';

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
                  )),
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
                      image: AssetImage('images/logo.png'),
                      width: 144,
                    ),
                    Text(
                      'Sneaky Shopper',
                      style: GoogleFonts.teko(
                          color: const Color(0xffBBFFF7), fontSize: 48),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 4),
                      child: TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          filled: true,
                          fillColor: Color(0xffD9D9D9),
                          prefixIcon: Icon(Icons.mail, color: Colors.black),
                          hintText: 'E-mail',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        cursorColor: Colors.black,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 4),
                        child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xffD9D9D9),
                                prefixIcon:
                                    Icon(Icons.key, color: Colors.black),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            cursorColor: Colors.black)),
                    if (state.isCreatingAccount == true) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 4),
                        child: TextField(
                            controller: confirmPasswordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              filled: true,
                              fillColor: Color(0xffD9D9D9),
                              prefixIcon:
                                  Icon(Icons.check, color: Colors.black),
                              hintText: 'Confirm password',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            cursorColor: Colors.black),
                      ),
                    ],
                    if (state.isCreatingAccount == true) ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            context.read<RootCubit>().notCreatingAccount();
                          },
                          child: Text(
                            'Already have an account? Login',
                            style: GoogleFonts.teko(
                                color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                    if (state.isCreatingAccount == false) ...[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          onPressed: () {
                            context.read<RootCubit>().creatingAccount();
                          },
                          child: Text(
                            'Don\'t have an account? Register',
                            style: GoogleFonts.teko(
                                color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ],
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                          color: Colors.black,
                          width: 0.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        backgroundColor: const Color(0xffff40ac),
                      ),
                      onPressed: () async {
                        if (state.isCreatingAccount == true) {
                          // rejestracja
                          context.read<RootCubit>().register(
                                email: emailController.text,
                                password: passwordController.text,
                                confirmPassword: confirmPasswordController.text,
                              );
                        } else {
                          // logowanie
                          context.read<RootCubit>().signIn(
                              email: emailController.text,
                              password: passwordController.text);
                        }
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
