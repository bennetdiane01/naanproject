import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:naan_project/shared/variables.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:path/path.dart' as Path;



class CampaignController extends GetxController{
  //all textfield controller here
  TextEditingController txtCampaignNameController = TextEditingController();
  TextEditingController txtAboutCampaignController = TextEditingController();
  TextEditingController txtkeywordCampaignController = TextEditingController();
  TextEditingController txtCampaignAmountController = TextEditingController();
  TextEditingController txtFacebooLinkController = TextEditingController();

  DateTime? StartingDate;
  DateTime? EndingDate;

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';

  double val = 0;

  bool uploading = false;


  var firebaseUser =  FirebaseAuth.instance.currentUser;
  final firestoreInstance = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorageRef = FirebaseStorage.instance;


  List<File> imagee = [];
  final picker = ImagePicker();
  List imgValue = [];
  CollectionReference imgRef = FirebaseFirestore.instance.collection('imageURLs');

  @override
  void onInit() {
    // TODO: implement onInit
    imgRef; //= FirebaseFirestore.instance.collection('imageURLs');
    super.onInit();
  }

  final formKey = new GlobalKey<FormState>();

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    StartingDate = args.value.startDate;
    EndingDate = args.value.endDate;
    _range =
        DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
            ' - ' +
            DateFormat('dd/MM/yyyy')
                .format(args.value.endDate ?? args.value.startDate)
                .toString();
    print(_range);
    print(args.value.endDate);
    update();

  }
  //to pick date range
  pickDateRange() async {
    return Get.dialog(
        AlertDialog(
          title: Text('Date range'),
          scrollable: true,
          actions: [
            InkWell(
              onTap: (){
                if(StartingDate == null || EndingDate == null){
                  Get.snackbar(
                    'Error',
                    'Please select the date range correctly!',
                    backgroundColor: colorRed,
                    colorText: colorWhite,
                    snackPosition: SnackPosition.TOP,
                    isDismissible: true,
                  );
                } else{
                  Get.back();
                }

              },
              child: Container(
                padding: EdgeInsets.all(4.w),
                  child: Text('Ok')),
            )
          ],
          content: Container(
            height: 50.h,
            width: 80.w,
            child: Column(
              children: [
                SfDateRangePicker(
                  onSelectionChanged: onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  initialSelectedRange: PickerDateRange(
                      DateTime.now().subtract(const Duration(days: 4)),
                      DateTime.now().add(const Duration(days: 3))),
                ),
              ],
            ),
          ),
        ),
    );
  }


  // to get image from gallery
  Future getImageFromGallery() async {

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile == null){
      retrieveLostData();
      return Get.snackbar(
          'Error',
          'No Image selected',
          backgroundColor: colorRed,
        colorText: colorWhite,
        snackPosition: SnackPosition.TOP,
        isDismissible: true,
      );
    }
    //final File image = File(pickedFile.path); I use ths for single upload
    //  File image = await ImagePicker.pickImage(source: ImageSource.camera);
    imagee.add(File(pickedFile.path));
    //uploadImageToFirebase();
    update();
  }

  Future<void> retrieveLostData() async {
    final LostData response = await picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
        imagee.add(File(response.file!.path));
    } else {
      print(response.file);
    }
    update();
  }

  Future uploadImageToFirebase() async {
    uploading = true;
    int i = 1;

    for (var img in imagee) {
      val = i / imagee.length;
      Reference ref = firebaseStorageRef.ref('images')
          .child(Path.basename(img.path));
      await ref.putFile(img).whenComplete(() async {
        String imageUrl = await ref.getDownloadURL();

        print(ref.getDownloadURL());
        imgValue.add(imageUrl);
        await ref.getDownloadURL().then((value) {
          //imgRef.add({'url': value});
          i++;
        });
      });
    }
    createCampaign();
    /*
    *
    * I use this for single upload
    String fileName = imagee!.path;

    FirebaseStorage firebaseStorageRef = FirebaseStorage.instance;

    Reference ref =firebaseStorageRef.ref('images').child(fileName+DateTime.now().toString());

// FirebaseStorage.instance.ref().child('uploads/$fileName');
    UploadTask uploadTask = ref.putFile(imagee!);

    uploadTask.then((res) {res.ref.getDownloadURL().then((value) => imgValue = value);});
    print(imgValue);*/
    update();
  }


  //Create campaign
  createCampaign() async {
    var form = formKey.currentState;

    if(txtCampaignNameController.text == "" ||
        txtAboutCampaignController.text == "" ||
    txtCampaignAmountController.text == "" ||
    txtFacebooLinkController.text == "" ||
    picker == null || imagee.length < 1 ||
    //imgValue == "" || imgValue == null ||
    StartingDate == null ||
    EndingDate == null ){
      return Get.snackbar(
        'Error',
        'Please check all your field and try again!',
        backgroundColor: colorRed,
        colorText: colorWhite,
        snackPosition: SnackPosition.TOP,
        isDismissible: true,
      );
    }


    // validated form
    try{
      firestoreInstance.collection('campaigns').add({
        'campaignName': txtCampaignNameController.text,
        'aboutCampaign': txtAboutCampaignController.text,
        'campaignImage': imgValue,
        'campaignStartingDate': StartingDate,
        'campaignEndingDate': EndingDate,
        'campaignAmount': txtCampaignAmountController.text,
        'facebookLink': txtFacebooLinkController.text,
        'status': 'active',
        'mealsCount': '1000',
        'mealsRemaining': '1000',
        'creadtedBy': firebaseUser!.displayName,
        'userId': firebaseUser!.uid,
        'keywords': txtkeywordCampaignController.text,
        'createdAt': DateTime.now(),
      }).whenComplete(() => uploading = false);
      Get.dialog(
          AlertDialog(
          actions: [
            ElevatedButton(
                onPressed: (){
                  txtCampaignNameController.clear();
                  txtAboutCampaignController.clear();
                  txtCampaignAmountController.clear();
                  txtFacebooLinkController.clear();
                  Get.back();
                },
                child: Text('Ok'),
            )
          ],
          content: Container(
            height: 20.h,
            child: Center(
              child: Text('Campaign uploaded!'),
            ),
          ),
        )
      );
    } catch(e){
      print(e);
      Get.snackbar('Error', 'An error occured!');
    }
    update();
  }
}