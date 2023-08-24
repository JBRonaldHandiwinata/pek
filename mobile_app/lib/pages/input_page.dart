import 'package:flutter/material.dart';
import 'package:pek_mobile_app/components/my_textfield.dart';
import 'package:pek_mobile_app/components/my_button.dart';
import 'package:pek_mobile_app/components/square_title.dart';
import 'package:pek_mobile_app/helper/dialog_helper.dart';
import 'package:pek_mobile_app/helper/api_base.dart';
import 'package:pek_mobile_app/constants/urls.dart';


class InputPage extends StatelessWidget {
  InputPage({super.key});

  // text editing controllers
  final MsgController = TextEditingController();
  final ApiBase _api = ApiBase();

  Future<Map<String,dynamic>> msg(msg_content, bc) async{
    print("send message");
    var req = {'msg_txt': msg_content};
    final response = await _api.post(SEND_MSG, req, bc);
    print(response);
    return response;
  }

  // send message method
  void sendMessage(bc) {
    DialogHelper dh = DialogHelper();
    if(MsgController.text == ""){
      dh.modalWarning(bc, "Please fill up message before send");
    }else{
      print(MsgController.text);
      var req = this.msg(MsgController.text, bc);
      req.then((resp){
        if (resp['rc'] == 1){
          MsgController.clear();
          dh.modalSuccess(bc, "success");
        }else{
          dh.modalError(bc, "failed send message");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 SquareTile(imagePath: 'lib/assets/pek.png'),
                ],
              ),

              const SizedBox(height: 25),

              MyTextField(
                controller: MsgController,
                hintText: 'write something here..',
                obscureText: false,
              ),

              const SizedBox(height: 35),

              MyButton(
                onTap: (){
                  sendMessage(context);
                },
              ),

              // const SizedBox(height: 50),

            ],
          ),
        ),
      ),
    );
  }
}