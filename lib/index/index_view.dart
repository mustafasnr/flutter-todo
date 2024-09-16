import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/index/index_view_model.dart';

class IndexView extends StatelessWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<IndexViewModel>(
      builder: (context, indexState, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(18, 18, 18, 1),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu, size: 24, color: Colors.white),
                        ClipOval(
                          child: Image.asset(
                            "assets/image/person.jpg",
                            fit: BoxFit.contain,
                            width: 40.r,
                            height: 40.r,
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      child: Text(
                        "Index",
                        style: GoogleFonts.lato(
                            fontSize: 20.sp, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              // const IndexPlaceholder(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: const Color.fromRGBO(151, 151, 151, 1),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 24,
                          ),
                          Expanded(
                            child: TextField(
                              style: GoogleFonts.lato(
                                fontSize: 16.sp,
                                height: 1.5,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 12.w),
                                border: InputBorder.none,
                                hintText: "Search for your task...",
                                hintStyle: GoogleFonts.lato(
                                  fontSize: 16.sp,
                                  height: 1.5,
                                  color: const Color.fromRGBO(175, 175, 175, 1),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    const TodoFilter(filter: "Today"),
                    SizedBox(height: 16.h),
                    const SingleTodo(),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          backgroundColor: const Color.fromRGBO(54, 54, 54, 1),
          gapLocation: GapLocation.center,
          notchMargin: 0,
          activeIndex: indexState.index,
          notchSmoothness: NotchSmoothness.sharpEdge,
          itemCount: indexState.icons.length,
          onTap: indexState.setIndex,
          tabBuilder: (int index, bool isActive) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  indexState.icons[index],
                ),
                SizedBox(height: 4.h),
                Text(
                  indexState.labels[index],
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                    color: isActive ? Colors.white : Colors.white70,
                  ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 16.h),
                      width: double.infinity,
                      height: 228.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                        color: const Color.fromRGBO(54, 54, 54, 1),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Add Task",
                            style: GoogleFonts.lato(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          TextField(
                            style: GoogleFonts.lato(
                              fontSize: 18.sp,
                              height: 1.5,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.w),
                              hintText: "Title",
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                ),
                              ),
                              hintStyle: GoogleFonts.lato(
                                fontSize: 18.sp,
                                height: 1.5,
                                color: const Color.fromRGBO(175, 175, 175, 1),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          TextField(
                            style: GoogleFonts.lato(
                              fontSize: 18.sp,
                              height: 1.5,
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16.w),
                              hintText: "Description",
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(151, 151, 151, 1),
                                ),
                              ),
                              hintStyle: GoogleFonts.lato(
                                fontSize: 18.sp,
                                height: 1.5,
                                color: const Color.fromRGBO(175, 175, 175, 1),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedErrorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () async {},
                                child: SvgPicture.asset(
                                  "assets/svg/time.svg",
                                ),
                              ),
                              SizedBox(width: 32.w),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return const CategoryDialog();
                                    },
                                  );
                                },
                                child: SvgPicture.asset(
                                  "assets/svg/tag.svg",
                                ),
                              ),
                              SizedBox(width: 32.w),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return const PriorityDialog();
                                    },
                                  );
                                },
                                child: SvgPicture.asset(
                                  "assets/svg/flag.svg",
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  "assets/svg/send.svg",
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
          shape: const CircleBorder(),
          backgroundColor: const Color.fromRGBO(134, 135, 255, 1),
          child: const Icon(
            Icons.add,
            size: 32,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class TodoFilter extends StatelessWidget {
  final String filter;
  const TodoFilter({super.key, required this.filter});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(93, 93, 93, 1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            filter,
            style: GoogleFonts.lato(
              fontSize: 12.sp,
              height: 21 / 12,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 10.w),
          Icon(
            Icons.arrow_downward,
            size: 16.dm,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class SingleTodo extends StatelessWidget {
  const SingleTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(55, 55, 55, 1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        children: [
          Radio(
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            fillColor: const WidgetStatePropertyAll(Colors.white),
            overlayColor: const WidgetStatePropertyAll(Colors.white24),
            value: true,
            groupValue: true,
            onChanged: (value) {
              debugPrint("$value");
            },
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do Math Homework",
                  style: GoogleFonts.lato(
                    fontSize: 16.sp,
                    height: 21 / 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Today at 16:45",
                      style: GoogleFonts.lato(
                        fontSize: 14.sp,
                        height: 1.5,
                        color: const Color.fromRGBO(175, 175, 175, 1),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.w, vertical: 7.5.w),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Icon(
                            Icons.cake,
                            color: Colors.black,
                            size: 16.sp,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "Grocery",
                            style: GoogleFonts.lato(
                              fontSize: 12.sp,
                              height: 1.75,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.w, vertical: 6.5.w),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                          width: 1,
                          color: Color.fromRGBO(134, 135, 255, 1),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Icon(
                            Icons.flag,
                            color: Colors.black,
                            size: 16.sp,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            "3",
                            style: GoogleFonts.lato(
                              fontSize: 12.sp,
                              height: 1.75,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryDialog extends StatelessWidget {
  const CategoryDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.w),
          width: 327.w,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(54, 54, 54, 1),
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(width: 0, color: Colors.transparent),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Choose Category",
                style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  height: 1.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10.h),
              const Divider(),
              SizedBox(height: 10.h),
              Wrap(
                spacing: 32.dm,
                runSpacing: 16.dm,
                alignment: WrapAlignment.start,
                runAlignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  ...List.generate(
                    10,
                    (index) => const Category(),
                  ),
                  const AddCategory()
                ],
              ),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(134, 135, 255, 1),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(
                    "Add Category",
                    style: GoogleFonts.lato(
                      fontSize: 16.sp,
                      height: 1.5,
                      color: Colors.white,
                    ),
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

class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          Container(
            width: 64.dm,
            height: 64.dm,
            decoration: BoxDecoration(
              color: Colors.lime,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Icon(
              Icons.cake,
              size: 32.dm,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            "Grocery",
            style: GoogleFonts.lato(
              fontSize: 14.sp,
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class AddCategory extends StatelessWidget {
  const AddCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 64.dm,
            height: 64.dm,
            decoration: BoxDecoration(
              color: Colors.lime,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Icon(
              Icons.add,
              size: 32.dm,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            "New",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontSize: 14.sp,
              height: 1.5,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class PriorityDialog extends StatelessWidget {
  const PriorityDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.w),
          width: 327.w,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(54, 54, 54, 1),
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                width: 0,
                color: Colors.transparent,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Task Priority",
                style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  height: 1.25,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const Divider(),
              SizedBox(height: 20.h),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 10.r,
                runSpacing: 10.r,
                children: List.generate(
                  10,
                  (index) => Priority(index: index),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 11.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(134, 135, 255, 1),
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.lato(
                            fontSize: 16.sp,
                            height: 1.5,
                            color: const Color.fromRGBO(134, 135, 255, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(134, 135, 255, 1),
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Text(
                          "Save",
                          style: GoogleFonts.lato(
                            fontSize: 16.sp,
                            height: 1.5,
                            color: Colors.white,
                          ),
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

class Priority extends StatelessWidget {
  final int? index;
  const Priority({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 64.r,
      height: 64.r,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(39, 39, 39, 1),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Icon(
            Icons.flag,
            color: Colors.white,
          ),
          Text(
            index != null ? (index! + 1).toString() : 0.toString(),
            style: GoogleFonts.lato(
              fontSize: 16.sp,
              height: 1.4,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class IndexPlaceholder extends StatelessWidget {
  const IndexPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 75.h),
        SvgPicture.asset("assets/svg/index_background.svg"),
        SizedBox(height: 10.h),
        Text(
          "What do you want to do today?",
          style: GoogleFonts.lato(
            fontSize: 20.sp,
            height: 1.5,
            color: const Color.fromRGBO(255, 255, 255, 0.8),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          "Tap + to add your tasks",
          style: GoogleFonts.lato(
            fontSize: 16.sp,
            height: 1.5,
            color: const Color.fromRGBO(255, 255, 255, 0.8),
          ),
        ),
      ],
    );
  }
}
