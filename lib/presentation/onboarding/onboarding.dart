import 'package:advance_flutter/presentation/resources/assets_manager.dart';
import 'package:advance_flutter/presentation/resources/color_manager.dart';
import 'package:advance_flutter/presentation/resources/routes_manager.dart';
import 'package:advance_flutter/presentation/resources/strings_manager.dart';
import 'package:advance_flutter/presentation/resources/theme_manager.dart';
import 'package:advance_flutter/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:advance_flutter/domain/model.dart';


class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  PageController _pageController = PageController(initialPage: 0);





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        elevation: AppSize.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(_list[index]);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        height: AppSize.s100,
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child:
                    TextButton(onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.loginRoute);
                    }, child: Text(AppStrings.skip,textAlign: TextAlign.end,style: Theme.of(context).textTheme.titleSmall))),
                //add layout for indicators and arrows
              _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }



 Widget _getBottomSheetWidget() {
    return Expanded(
      child: Container(
      
        color: ColorManager.primary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // left arrow
            Padding(padding: EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.leftArrowIc),
                ),
                onTap: () {
                  // go to next slide
                  _pageController.animateToPage(_getPreviousIndex(), duration:Duration(microseconds:  DurationConstants.d300 ), curve: Curves.bounceIn);
                },
              ),),
        
        
            // circles indicator
            Row(
              children: [
                for(int i = 0; i < _list.length; i++)
                  Padding(padding: EdgeInsets.all(AppPadding.p8),
                    child: _getProperCircle(i),)
              ],
            ),
        
            // right arrow
            Padding(padding: EdgeInsets.all(AppPadding.p14),
              child: GestureDetector(
                child: SizedBox(
                  height: AppSize.s20,
                  width: AppSize.s20,
                  child: SvgPicture.asset(ImageAssets.rightarrowIc),
                ),
                onTap: () {
                  // go to next slide
                 _pageController.animateToPage(_getNextIndex(), duration:Duration(microseconds:  DurationConstants.d300 ), curve: Curves.bounceIn);
                },
              ),)
          ],
        ),
      ),
    );
  }

    int _getPreviousIndex() {

  }

  int _getNextIndex() {
    
  }


  Widget _getProperCircle(int index){
    if(index == _currentIndex){
      return SvgPicture.asset(ImageAssets.hollowCircleIc); // selected slider
    }else{
      return SvgPicture.asset(ImageAssets.solidCircleIc); // unselected slider
    }
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
}



class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;

  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image),
      ],
    );
  }
}


