import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:naan_project/shared/variables.dart';

/// *  textInputType - The type of information for which to optimize the text input control.
/// *  hintText - Text that suggests what sort of input the field accepts.
/// *  prefixIcon - Pass Icon if required
/// *  defaultText - If there is predefined value is there for a text field
/// *  focusNode - Currently focus
/// *  obscureText - Is Password field?
/// *  controller - Text controller
/// *  functionValidate - Validation function(currently I have used to check empty field)
/// *  parametersValidate - Value to validate
/// *  actionKeyboard - Keyboard action eg. next, done, search, etc
/// *  onSubmitField - Done click action
/// *  onFieldTap - On focus on TextField
class TextFormFieldWidget extends StatefulWidget {
  final TextInputType? textInputType;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? defaultText;
  final FocusNode? focusNode;
  final bool? obscureText;
  final TextEditingController? controller;
  final Function? functionValidate;
  final String? parametersValidate;
  final TextInputAction? actionKeyboard;
  final Function? onSubmitField;
  final Function? onFieldTap;
  final Color? txtColor;
  final int? maxLine;
  final bool? enable;
  final Function? onChanged;
  final LengthLimitingTextInputFormatter inputLength;
  final FilteringTextInputFormatter? filteringTextInputFormatter;



   TextFormFieldWidget(
      {@required this.hintText,
        this.focusNode,
        this.textInputType,
        this.defaultText,
        this.obscureText = false,
        this.controller,
        this.functionValidate,
        this.parametersValidate,
        this.actionKeyboard = TextInputAction.next,
        this.onSubmitField,
        this.onFieldTap,
        this.prefixIcon,
        this.txtColor,
        this.maxLine = 1,
        this.enable = true,
        this.onChanged,
        required this.inputLength,
        this.filteringTextInputFormatter,
        this.suffixIcon,
      });

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  double bottomPaddingToError = 12;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: primaryColor,
      ),
      child: Material(
        //height: 300,
        //elevation: 10,
        shadowColor: Colors.white,
        child: TextFormField(
          cursorColor: primaryColor,
          onChanged: widget.onChanged!(),
          obscureText: widget.obscureText!,
          keyboardType: widget.textInputType,
          textInputAction: widget.actionKeyboard,
          focusNode: widget.focusNode,
          maxLines: widget.maxLine,
          enabled: widget.enable,
          style: TextStyle(
            color: colorBlack,
            fontSize: 16.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
          inputFormatters: [
            //LengthLimitingTextInputFormatter(3),
            widget.inputLength,
            //widget.filteringTextInputFormatter,
          ],
          initialValue: widget.defaultText,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            hintText: widget.hintText,
            fillColor: colorWhite,
            filled: true,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 3),
                borderRadius: BorderRadius.circular(5)
            ),
            focusedBorder: UnderlineInputBorder(
                //borderSide: BorderSide(color: primaryColor),
                borderRadius: BorderRadius.circular(5)

            ),
            hintStyle: TextStyle(
              color: textFieldColor,
              fontSize: 14.0,
              fontStyle: FontStyle.normal,
              letterSpacing: 1.2,
            ),
            contentPadding: EdgeInsets.only(
                top: 20, bottom: bottomPaddingToError, left: 20.0, right: 8.0),
            isDense: true,
            errorStyle: TextStyle(
              color: colorRed,
              fontSize: 12.0,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.normal,
              letterSpacing: 1.2,
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colorRed),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: colorRed),
            ),
          ),
          controller: widget.controller,
          validator: (value) {
            if (widget.functionValidate != null) {
              String resultValidate =
              widget.functionValidate!(value, widget.parametersValidate);
              if (resultValidate != null) {
                return resultValidate;
              }
            }
            return null;
          },
          onFieldSubmitted: (value) {
            if (widget.onSubmitField != null) widget.onSubmitField!();
          },
          onTap: () {
            if (widget.onFieldTap != null) widget.onFieldTap!();
          },
        ),
      ),
    );
  }
}

String? commonValidation(String value, String messageError) {
  var required = requiredValidator(value, messageError);
  if (required != null) {
    return required;
  }
  return null;
}

String? requiredValidator(value, messageError) {
  if (value.isEmpty) {
    return messageError;
  }
  return null;
}

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}