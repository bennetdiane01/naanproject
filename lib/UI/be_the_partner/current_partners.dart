import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:naan_project/controller/be_the_partner/be_the_partner_controller.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
class CurrentPartners extends StatelessWidget {
  CurrentPartners({Key? key}) : super(key: key);
  BeThePartnerController beThePartnerController = Get.put(BeThePartnerController());

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(height: 3.h,),
        Text('Current Partners', style: black18MediumTextStyle,textAlign: TextAlign.start,),
        SizedBox(height: 2.h,),
        Container(
          height: 0.4,
          width: 100.w,
          color: primaryColor,
        ),
        SizedBox(height: 1.h,),
        StreamBuilder<QuerySnapshot>(
          stream: beThePartnerController.firestoreInstance.collection('beThePartner').snapshots(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child: Text('Loading...'),
              );
            }else if (snapshot.hasData){
              var items = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    if(items.length < 1){
                      return Text(' No Parters', style: black18MediumTextStyle,);
                    }
                    return Container(
                      height: 15.h,
                      padding: EdgeInsets.all(2.h),
                      margin: EdgeInsets.symmetric(vertical: 1.h),
                      decoration: BoxDecoration(
                          color: colorWhite,
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
                                shape: BoxShape.circle
                            ),
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(items[index]['userImg']),
                              //child: Image.network(items[index]['userImg'], fit: BoxFit.cover,)
                            ),
                          ),
                          SizedBox(width: 3.w,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  child: Text('${items[index]['firstname']} ${items[index]['surname']}', style: black14SemiBoldTextStyle, overflow: TextOverflow.visible,)),
                              //SizedBox(height: 1.h,),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.location_on_rounded),
                                    Container(
                                        width: 50.w,
                                        child: Text(
                                          '${items[index]['city']}, ${items[index]['state']}, ${items[index]['country']}',
                                          style: TextStyle(fontStyle: FontStyle.normal),
                                          overflow: TextOverflow.visible,
                                        ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          //SizedBox(width: 18.w,),
                        ],
                      ),
                    );
                  });
            } else if (snapshot.hasError){
              return const Center(
                child: Text('Error!'),
              );
            }
            return Text('');
          }
        ),
      ],
    );
  }
}
