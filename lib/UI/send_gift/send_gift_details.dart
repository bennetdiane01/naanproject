import 'package:flutter/material.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class SendGiftDetails extends StatelessWidget {
  const SendGiftDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Gift'),
        backgroundColor: colorWhite,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(Icons.person_pin),
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            //height: 45.h,
            width: 90.w,
            margin: EdgeInsets.all(2.h),
            decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.08),
                borderRadius: BorderRadius.all(Radius.circular(12))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: tertiaryColor,
                      image: DecorationImage(image: AssetImage('assets/images/6.png')),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12))
                  ),
                ),
                SizedBox(height: 2.h,),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Gift Send',
                    style: black14MediumTextStyle.copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 1.h,),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut arcu tortor sed laoreet. Magna id non nam egestas dolor. Tortor felis lacinia eros nibh eget. Enim, sem sed facilisis ac scelerisque suspendisse dignissim elementum cursus.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut arcu tortor sed laoreet. Magna id non nam egestas dolor. Tortor felis lacinia eros nibh eget. Enim, sem sed facilisis ac scelerisque suspendisse dignissim elementum cursus.', style: black14RegularTextStyle,),
                ),
                SizedBox(height: 2.h,),
                _projectKeyWords('Children,World'),
                SizedBox(height: 4.h,),
                Center(
                  child: ElevatedButton(
                    onPressed: () => {
                      //Get.to(() => SignIn()),

                    },
                    child: const Text('Send Gift'),
                    style: ElevatedButton.styleFrom(
                      //minimumSize: const Size(10, 50),
                        elevation: 0.0,
                        primary: primaryColor, // background
                        onPrimary: Colors.white, // foreground
                        shape: const StadiumBorder(), // shape
                        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3.w)
                    ),
                  ),
                ),
                SizedBox(height: 5.h,)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _projectKeyWords(keyword) {
    final tagName = keyword;
    final split = tagName.split(',');
    var values = {
      for (int i = 0; i < split.length; i++)
        i: split[i]
    };
    return Container(
      height: 5.h,
      margin: EdgeInsets.symmetric(horizontal: 3.w),
      child: ListView.builder(
          itemCount: values.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 1.w),
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Text(values[index]!, style: black12RegularTextStyle.copyWith(color: colorWhite),),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }
      ),
    );
  }

}
