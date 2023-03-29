import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/constant_colors.dart';

class RulesWidget extends StatefulWidget {
  final VoidCallback onPressed;
  const RulesWidget({
    super.key,
    required this.onPressed,
  });

  @override
  State<RulesWidget> createState() => _RulesWidgetState();
}

class _RulesWidgetState extends State<RulesWidget> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColors.kLightGreen,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ConstantColors.kLightGreen,
        title: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w700),
            children: const [
              TextSpan(
                text: 'About ',
                style: TextStyle(color: ConstantColors.kNeutralSkin),
              ),
              TextSpan(
                text: 'Location',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20.h),
          padding:
              EdgeInsets.only(top: 20.h, right: 20.h, left: 20.h, bottom: 0.h),
          height: 500.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ConstantColors.kNeutralSkin,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Text(
                "Conditions to follow while going on a trek in Nepal:",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h),
              Text(
                '''
      1. Trekkers should respect local customs and traditions and must not indulge in any activity that goes against the established norms and culture of the society.
      
      2. Individual trekking in Restricted Areas is strictly forbidden. There should be minimum two trekkers.
      
      3. Daily remuneration, safety gears and appropriate clothes, Personal Accident insurance must be provided to Nepali citizen accompanying travel group as guide/porter/any other supporting roles.
      
      4. Trekkers should trek only in the specified or designated route as per the Trekking Permit. They are not allowed to change route. Or concerned trekking agency/trekking guide accompanying the group must not let trekkers change the route.
      
      5. Trekkers should comply with instructions given by authorized Officials in trekking zone (Restricted Area).''',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5.sp,
                    fontSize: 12.sp),
              ),
              CheckboxListTile(
                checkColor: ConstantColors.kNeutralSkin,
                activeColor: ConstantColors.kLightGreen,
                contentPadding: EdgeInsets.zero,
                title: const Text("I agree to follow the conditions"),
                value: _value,
                onChanged: (value) {
                  setState(
                    () {
                      _value = value!;
                    },
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: ConstantColors.kMidGreen,
                  backgroundColor: ConstantColors.kLightGreen,
                ),

                // style: TextButton.styleFrom(
                //     backgroundColor: ConstantColors.kLightGreen),
                onPressed: _value == true ? widget.onPressed : null,
                child: Text(
                  "Continue",
                  style: TextStyle(
                      color: ConstantColors.kNeutralSkin, fontSize: 12.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
