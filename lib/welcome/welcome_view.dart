import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 13.h),
          child: Column(
            children: [
              SizedBox(height: 13.h),
              Container(
                margin: EdgeInsets.only(left: 24.w),
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 60.h),
              Text(
                "Welcome to UpTodo",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 42.w),
                child: Text(
                  "Please login to your account or create new account to continue",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 16.sp,
                    height: 1.5,
                    color: Colors.white60,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(142, 124, 255, 1),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Text(
                      "LOGIN",
                      style: GoogleFonts.lato(
                        fontSize: 18.sp,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/register");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(
                        width: 2,
                        color: const Color.fromRGBO(142, 124, 255, 1),
                      ),
                    ),
                    child: Text(
                      "CREATE ACCOUNT",
                      style: GoogleFonts.lato(
                        fontSize: 18.sp,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 13.h),
            ],
          ),
        ),
      ),
    );
  }
}
