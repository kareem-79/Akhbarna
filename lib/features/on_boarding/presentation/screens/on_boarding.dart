import 'package:akhbarna/core/resources/assets_managers.dart';
import 'package:akhbarna/core/resources/colors_managers.dart';
import 'package:akhbarna/core/resources/routes_managers.dart';
import 'package:akhbarna/features/on_boarding/presentation/widget/OnBoardingWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;
  bool isArabic = true;

  final List<OnBoardingWidget> pages = [
    OnBoardingWidget(
      image: ImageManagers.onBoarding1,
      title: "بقَ على اتصال بالعالم من قلب بلدك.احصل على آخرالأخبار من ",
      description: ". مصادر موثوقة ",
    ),
    OnBoardingWidget(
      image: ImageManagers.onBoarding2,
      title: ". خبر بيهمّك في مجالك،بنقدّمه ليك بسرعة",
      description: ". كل التفاصيل بين إيديك",
    ),
    OnBoardingWidget(
      image: ImageManagers.onBoarding3,
      title: ". عيش التجربة الإخبارية بطابع عربي أصيل",
      description: ". الأخبار من قلب الشارع بصورة حقيقية",
    ),
    OnBoardingWidget(
      image: ImageManagers.onBoarding4,
      title: "من الفن إلى السياسة، أي شيء في",
      description: ". «أخبارنا»",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12.sp, right: 20.sp, left: 20.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: ColorsManagers.red.withOpacity(0.3),
                        width: 2.w,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("تغيير اللغة قريبًا")),
                        );
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "English",
                        style: textTheme.labelSmall
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: ColorsManagers.red.withOpacity(0.3),
                        width: 2.w,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesManager.startUp);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "تخطي",
                        style: textTheme.labelSmall
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return _buildPage(pages[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(OnBoardingWidget model) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    model.image,
                    fit: BoxFit.cover,
                    width: 360.w,
                    height: 700.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.1),
                          Colors.black.withOpacity(0.7),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            model.title,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.tajawal(
                              color: ColorsManagers.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              height: 1.4.h,
                            ),
                          ),
                          Text(
                            model.description,
                            textAlign: TextAlign.right,
                            style: GoogleFonts.tajawal(
                              color: ColorsManagers.red,
                              fontSize: 22.sp,
                              height: 1.4.h,
                            ),
                          ),
                          SizedBox(height: 30.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(
                                  pages.length,
                                      (index) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.only(right: 6),
                                    width: currentIndex == index ? 20 : 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: currentIndex == index
                                          ? Colors.red
                                          : Colors.white38,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (currentIndex < pages.length - 1) {
                                    _controller.nextPage(
                                      duration: const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  } else {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      RoutesManager.startUp,
                                    );
                                  }
                                },
                                child: Container(
                                  width: 70.w,
                                  height: 30.h,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: const Icon(
                                    Icons.double_arrow_outlined,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}