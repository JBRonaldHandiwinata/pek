import 'package:flutter/material.dart';
import 'package:pek_mobile_app/components/my_textfield.dart';
import 'package:pek_mobile_app/components/my_button.dart';
import 'package:pek_mobile_app/components/square_title.dart';
import 'package:pek_mobile_app/helper/dialog_helper.dart';


class InputPage extends StatelessWidget {
  InputPage({super.key});

  // text editing controllers
  final MsgController = TextEditingController();

  // send message method
  void sendMessage(bc) {
    DialogHelper dh = DialogHelper();
    dh.modalSuccess(bc, "success");
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

              const SizedBox(height: 50),

            ],
          ),
        ),
      ),
    );
  }
}