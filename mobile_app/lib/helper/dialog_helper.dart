import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';



class DialogHelper{
   void modalinfo(BuildContext context, String msg){
      AwesomeDialog(
         context: context,
         dialogType: DialogType.info,
         borderSide: const BorderSide(
            color: Colors.green,
            width: 2,
         ),
         width: 280,
         buttonsBorderRadius: const BorderRadius.all(
            Radius.circular(2),
         ),
         dismissOnTouchOutside: true,
         dismissOnBackKeyPress: false,
         onDismissCallback: (type) {
            ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                  content: Text('Dismissed by $type'),
               ),
            );
         },
         headerAnimationLoop: false,
         animType: AnimType.bottomSlide,
         title: 'INFO',
         desc: msg,
         showCloseIcon: true,
         btnCancelOnPress: () {},
         btnOkOnPress: () {},
      ).show();
   }

   void modalError(BuildContext context, String msg){
      AwesomeDialog(
         context: context,
         dialogType: DialogType.error,
         animType: AnimType.rightSlide,
         headerAnimationLoop: false,
         title: 'Error',
         desc: msg,
         btnOkOnPress: () {},
         btnOkIcon: Icons.cancel,
         btnOkColor: Colors.red,
      ).show();
   }

   void modalWarning(BuildContext context, String msg){
      AwesomeDialog(
         context: context,
         dialogType: DialogType.warning,
         animType: AnimType.rightSlide,
         headerAnimationLoop: false,
         title: 'Warning',
         desc: msg,
         btnOkOnPress: () {},
         btnOkIcon: Icons.warning,
         btnOkColor: Colors.yellow,
      ).show();
   }

   void modalSuccess(BuildContext context, String msg){
      AwesomeDialog(
         context: context,
         dialogType: DialogType.success,
         animType: AnimType.rightSlide,
         headerAnimationLoop: false,
         showCloseIcon: true,
         title: 'Success',
         desc: msg,
         btnOkOnPress: () {},
         btnOkIcon: Icons.check_circle,
         btnOkColor: Colors.greenAccent,
      ).show();
   }

}