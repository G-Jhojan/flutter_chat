import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _estaEscribiendo = false;

  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          centerTitle: true,
          title: Column(
            children: const [
              CircleAvatar(
                maxRadius: 13,
                child: Text(
                  'Te',
                  style: TextStyle(
                    fontSize: 12,
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'Jefferson Orbe',
                style: TextStyle(color: Colors.black87, fontSize: 12),
              )
            ],
          )),
      body: Container(
        child: Column(children: [
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (_, i) => _messages[i],
              reverse: true,
            ),
          ),
          const Divider(
            height: 1,
          ),

          /// caja de texto
          Container(
            color: Colors.white,
            height: 50,
            child: _inputChat(),
          )
        ]),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto) {
                  //todo: cuando hay un valor, para poder postear
                  setState(() {
                    if (texto.trim().length > 0) {
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration:
                    const InputDecoration.collapsed(hintText: 'Enviar Mensaje'),
                focusNode: _focusNode,
              ),
            ),

            //Boton de enviar
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Platform.isAndroid
                    ? CupertinoButton(
                        child: const Text('Enviar'),
                        onPressed: _estaEscribiendo
                            ? () => _handleSubmit(_textController.text.trim())
                            : null)
                    : Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: IconTheme(
                          data: IconThemeData(color: Colors.blue[400]),
                          child: IconButton(
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              icon: Icon(
                                Icons.send,
                                color: Colors.blue[400],
                              ),
                              onPressed: _estaEscribiendo
                                  ? () =>
                                      _handleSubmit(_textController.text.trim())
                                  : null),
                        ),
                      ))
          ],
        ),
      ),
    );
  }

  _handleSubmit(String texto) {
    if (texto.length == 0) return;

    print(texto);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      uid: '123',
      texto: texto,
      animationController: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 200)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();
    setState(() {
      _estaEscribiendo = false;
    });
  }

  @override
  void dispose() {
    // todo: off del socket
    for (ChatMessage message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
