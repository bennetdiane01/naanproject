import 'package:flutter/material.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class ProjectCard extends StatelessWidget {
  const ProjectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.10),
        borderRadius: BorderRadius.all(Radius.circular(12))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 35.h,
            width: 100.w,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/5.png',
                ),
                fit: BoxFit.cover,
              )
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Affected families in Afghan', style: black14SemiBoldTextStyle,),
                SizedBox(height: 2.h,),
                Row(
                  children: [
                    Image.asset(
                        'assets/images/logo2.png'
                    ),
                    SizedBox(width: 5.w,),
                    RichText(
                      text: TextSpan(
                        text: '650 ',
                        style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'of 1000 Meals',
                              style:  TextStyle(fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ),
                    SizedBox(width: 35.w,),
                    Image.asset('assets/images/award.png')
                  ],
                ),
                SizedBox(height: 2.h,),
                Container(
                  height: 1.h,
                  color: primaryColor,
                ),
                SizedBox(height: 2.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40.w,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          //Get.to(() => const Signup());
                        },
                        icon: Icon(Icons.leaderboard, size: 20,),
                        label: Text('View All Projects', style: TextStyle(color: primaryColor),),
                        style: OutlinedButton.styleFrom(
                            primary: primaryColor, // background
                            side: BorderSide(width: 2.0, color: primaryColor),
                            shape: const StadiumBorder(), //Shape
                            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 4.w)
                        ),
                      ),
                    ),
                    Container(
                      width: 40.w,
                      child: ElevatedButton(
                        onPressed: () => {
                          //Get.to(() => SignIn()),

                        },
                        child: const Text('Learn More'),
                        style: ElevatedButton.styleFrom(
                          //minimumSize: const Size(10, 50),
                            elevation: 0.0,
                            primary: primaryColor, // background
                            onPrimary: Colors.white, // foreground
                            shape: const StadiumBorder(), // shape
                            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 4.w)
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
