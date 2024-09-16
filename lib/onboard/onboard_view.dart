import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/onboard/onboard_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Consumer<OnboardViewModel>(
      builder: (context, onboardState, child) => Scaffold(
        backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              PageView.builder(
                controller: pageController,
                onPageChanged: onboardState.setIndex,
                itemCount: onboardState.assets.length,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Positioned(
                      top: 40,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          onboardState.assets[index],
                          // width: onboardState.sizes[index].$1.w,
                          // height: onboardState.sizes[index].$2.h,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, top: 12.h),
                child: GestureDetector(
                  onTap: () {
                    pageController.animateToPage(
                      onboardState.assets.length - 1,
                      duration: const Duration(milliseconds: 375),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    "SKIP",
                    style: GoogleFonts.lato(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(255, 255, 255, 0.6),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          padding: EdgeInsets.all(32.dm),
          height: 399.h,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(18, 18, 18, 1),
            border: Border.all(
              width: 1.h,
              color: Color.fromRGBO(18, 18, 18, 1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                    onboardState.assets.length,
                    (index) => IndexDot(active: onboardState.index == index),
                  )
                ],
              ),
              SizedBox(height: 50.h),
              Text(
                onboardState.context[onboardState.index][0],
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 42.h),
              Text(
                onboardState.context[onboardState.index][1],
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 375),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      "BACK",
                      style: GoogleFonts.lato(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(255, 255, 255, 0.6),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (onboardState.index !=
                          onboardState.assets.length - 1) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 375),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushNamed(context, "/welcome");
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 12.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: const Color.fromRGBO(136, 117, 255, 1)),
                      alignment: Alignment.center,
                      child: Text(
                        onboardState.index != onboardState.assets.length - 1
                            ? "NEXT"
                            : "GET STARTED",
                        style: GoogleFonts.lato(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IndexDot extends StatelessWidget {
  final bool active;
  const IndexDot({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 27.w,
      height: 4.w,
      margin: EdgeInsets.only(right: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27.w),
        color: active ? Colors.white : const Color.fromRGBO(175, 175, 175, 1),
      ),
    );
  }
}
