import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/login_register/components/login_register_components.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/login_register/register_view_model.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RegisterViewModel>(
      builder: (context, registerState, child) => Scaffold(
        backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 13.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Register",
                    style: GoogleFonts.lato(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  InputField(
                    title: "Username",
                    placeholder: "Username",
                    controller: registerState.userNameController,
                  ),
                  SizedBox(height: 24.h),
                  InputField(
                    title: "Password",
                    placeholder: "Password",
                    controller: registerState.passwordController,
                  ),
                  SizedBox(height: 24.h),
                  InputField(
                    title: "Confirm Password",
                    placeholder: "Confirm password",
                    controller: registerState.confirmPasswordController,
                  ),
                  SizedBox(height: 24.h),
                  Opacity(
                    opacity: true == false ? 1 : 0.5,
                    child: GestureDetector(
                      onTap: () {
                        if (true == true) {
                          //Login Fonksiyonu
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: const Color.fromRGBO(134, 135, 231, 1),
                        ),
                        child: Text(
                          "Register",
                          style: GoogleFonts.lato(
                            fontSize: 16.sp,
                            height: 1.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  HorizontalDivider(
                    child: Text(
                      "or",
                      style: GoogleFonts.lato(
                        fontSize: 16.sp,
                        height: 1.5,
                        color: const Color.fromRGBO(151, 151, 151, 1),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(134, 135, 255, 1),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svg/google.svg"),
                          SizedBox(width: 10.w),
                          Text(
                            "Register with Google",
                            style: GoogleFonts.lato(
                              fontSize: 16.sp,
                              height: 1.5,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(134, 135, 255, 1),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/svg/apple.svg"),
                          SizedBox(width: 10.w),
                          Text(
                            "Register with Apple",
                            style: GoogleFonts.lato(
                              fontSize: 16.sp,
                              height: 1.5,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: const Color.fromRGBO(18, 18, 18, 1),
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?  ",
                style: GoogleFonts.lato(
                  fontSize: 12.sp,
                  height: 1.5,
                  color: const Color.fromRGBO(151, 151, 151, 1),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/login");
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.lato(
                    fontSize: 12.sp,
                    height: 1.5,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
