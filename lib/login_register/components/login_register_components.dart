import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  final String title;
  final String placeholder;
  final TextEditingController controller;
  const InputField({
    super.key,
    required this.title,
    required this.placeholder,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 16.sp,
            height: 1.5,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: controller,
          style: GoogleFonts.lato(
            fontSize: 16.sp,
            height: 1.5,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12.h),
            hintText: placeholder,
            hintStyle: GoogleFonts.lato(
              fontSize: 16.sp,
              height: 1.5,
              color: const Color.fromRGBO(83, 83, 83, 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(151, 151, 151, 1), width: 0.8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(151, 151, 151, 1), width: 0.8),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(151, 151, 151, 1), width: 0.8),
            ),
          ),
        )
      ],
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  final Widget child;
  const HorizontalDivider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: Divider(
            color: Color.fromRGBO(151, 151, 151, 1),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w) +
              EdgeInsets.only(bottom: 2.h),
          child: child,
        ),
        const Expanded(
          child: Divider(
            color: Color.fromRGBO(151, 151, 151, 1),
          ),
        ),
      ],
    );
  }
}
