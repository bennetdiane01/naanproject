import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class SuggestedConnection extends StatelessWidget {
  const SuggestedConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 3.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Suggested Connections', style: black18MediumTextStyle.copyWith(fontWeight: FontWeight.bold),),
            Text('View all', style: black14SemiBoldTextStyle.copyWith(color: primaryColor),)
          ],
        ),
        SizedBox(height: 2.h,),
        Container(
          height: 0.4,
          width: 100.w,
          color: primaryColor,
        ),
        SizedBox(height: 1.h,),
        Container(
          height: 15.h,
          padding: EdgeInsets.all(2.h),
          margin: EdgeInsets.symmetric(vertical: 1.h),
          decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.10),
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 7.h,
                height: 7.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/5.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  shape: BoxShape.circle
                ),
              ),
              SizedBox(width: 3.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Text('Patricia Boehm', style: black14SemiBoldTextStyle, overflow: TextOverflow.visible,)),
                  //SizedBox(height: 1.h,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.location_on_rounded),
                        Text('San Francisco, CA', style: TextStyle(fontStyle: FontStyle.normal),),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(width: 18.w,),
              Container(
                width: 7.h,
                height: 7.h,
                decoration: BoxDecoration(
                  color: primaryColor,
                    shape: BoxShape.circle
                ),
                alignment: Alignment.center,
                child: Icon(Icons.add, color: colorWhite,),
              ),
            ],
          ),
        ),
        Container(
          height: 15.h,
          padding: EdgeInsets.all(2.h),
          margin: EdgeInsets.symmetric(vertical: 1.h),
          decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.10),
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 7.h,
                height: 7.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/5.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  shape: BoxShape.circle
                ),
              ),
              SizedBox(width: 3.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Text('Patricia Boehm', style: black14SemiBoldTextStyle, overflow: TextOverflow.visible,)),
                  //SizedBox(height: 1.h,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.location_on_rounded),
                        Text('San Francisco, CA', style: TextStyle(fontStyle: FontStyle.normal),),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(width: 18.w,),
              Container(
                width: 7.h,
                height: 7.h,
                decoration: BoxDecoration(
                  color: primaryColor,
                    shape: BoxShape.circle
                ),
                alignment: Alignment.center,
                child: Icon(Icons.add, color: colorWhite,),
              ),
            ],
          ),
        ),
        Container(
          height: 15.h,
          padding: EdgeInsets.all(2.h),
          margin: EdgeInsets.symmetric(vertical: 1.h),
          decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.10),
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 7.h,
                height: 7.h,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/5.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  shape: BoxShape.circle
                ),
              ),
              SizedBox(width: 3.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Text('Patricia Boehm', style: black14SemiBoldTextStyle, overflow: TextOverflow.visible,)),
                  //SizedBox(height: 1.h,),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.location_on_rounded),
                        Text('San Francisco, CA', style: TextStyle(fontStyle: FontStyle.normal),),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(width: 18.w,),
              Container(
                width: 7.h,
                height: 7.h,
                decoration: BoxDecoration(
                  color: primaryColor,
                    shape: BoxShape.circle
                ),
                alignment: Alignment.center,
                child: Icon(Icons.add, color: colorWhite,),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
