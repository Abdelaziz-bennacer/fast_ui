import 'package:fast_ui/config.dart';
import 'package:fast_ui/controllers/onboarding_controller.dart';
import 'package:fast_ui/views/pages/onboarding_screen/util/onboarding_constants.dart';
import 'package:fast_ui/views/pages/onboarding_screen/util/onboarding_fontstyle.dart';
import 'package:fast_ui/views/pages/onboarding_screen/util/onboarding_widget.dart';
import 'package:fast_ui/widgets/common/icon_button_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  final onboardCtrl = Get.put(OnboardingController());
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GetBuilder<AppController>(
        builder: (ctrl) => Scaffold(
          body: AppComponent(
            child: GetBuilder<OnboardingController>(builder: (_) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    //background image layout
                    OnboardingWidget().backgroundImage(
                        image: imageAssets.onboardingImage,
                        height: 2.3,
                        context: context),
                    const Space(0, 5),

                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3.1,
                      child: Column(
                        children: [
                          //logo layout
                          OnboardingWidget().smallLogoImage(
                              image: onboardCtrl.appCtrl.isTheme
                                  ? imageAssets.themeLogo
                                  : imageAssets.smallLogoImage,
                              context: context),
                          const Space(0, 2),

                          //get safe delivery text layout
                          OnboardingFontStyle().nunitoAndQuicksandtextLayout(
                              text: OnboardingFont().getSafeDelivery,
                              color: onboardCtrl.appCtrl.appTheme.titleColor,
                              fontSize: textSizeNormal,
                              fontWeight: FontWeight.w500,
                              type: 'quicksand'),
                          const Space(0, 5),

                          //description layout
                          OnboardingFontStyle().nunitoAndQuicksandtextLayout(
                              text: OnboardingFont().description,
                              color: onboardCtrl.appCtrl.appTheme.contentColor,
                              fontSize: textSizeSMedium,
                              fontWeight: FontWeight.normal,
                              type: 'nunito'),
                        ],
                      ),
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height / 4.50,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppScreenUtil().screenWidth(15)),
                      child: Column(
                        children: [
                          //continoue with phone layout
                          IconButtonWidget(
                            onTap: () => onboardCtrl.onBoardingRead(),
                            lefMargin: 15,
                            rightMargin: 15,
                            icon: iconAssets.mobileIcon,
                            textWidget: OnboardingFontStyle().mulishtextLayout(
                                text: OnboardingFont().continueWithPhone,
                                color: onboardCtrl.appCtrl.appTheme.titleColor,
                                fontSize: textSizeMedium,
                                fontWeight: FontWeight.bold),
                            type: OnboardingFont().phone,
                          ),
                          const Space(0, 10),

                          //continoue with google layout
                          IconButtonWidget(
                            onTap: () => onboardCtrl.googleLogin(),
                            lefMargin: 15,
                            rightMargin: 15,
                            icon: iconAssets.google,
                            textWidget: OnboardingFontStyle().mulishtextLayout(
                                text: OnboardingFont().continueWithGoogle,
                                color: onboardCtrl.appCtrl.appTheme.titleColor,
                                fontSize: textSizeMedium,
                                fontWeight: FontWeight.bold),
                            type: OnboardingFont().google,
                          ),

                          const Space(0, 10),
                          InkWell(
                            onTap: () => onboardCtrl.onBoardingRead(),
                            child: OnboardingFontStyle().mulishtextLayout(
                                text: OnboardingFont().skip,
                                color: onboardCtrl.appCtrl.appTheme.primary,
                                fontSize: textSizexSmall,
                                textDecoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
