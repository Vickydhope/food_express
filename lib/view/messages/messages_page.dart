import 'package:flutter/material.dart';
import 'package:food_express/res/drawables.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          "Messages",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemBuilder: (context, index) => _getMessageView(index % 2 != 0,
                  image: index % 3 == 0
                      ? productImage
                      : index % 2 == 0
                          ? profilePic
                          : null),
              itemCount: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 8.0, left: 8.0, right: 8.0, top: 2),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration:
                        const InputDecoration(hintText: "Type here . . ."),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.redAccent.withOpacity(0.8),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  _getMessageView(
    bool isReceiverMessage, {
    String? image,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              if (!isReceiverMessage) Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 5,
                child: Align(
                  alignment: isReceiverMessage
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(20),
                        topRight: const Radius.circular(20),
                        bottomRight: isReceiverMessage
                            ? const Radius.circular(20)
                            : const Radius.circular(3),
                        bottomLeft: isReceiverMessage
                            ? const Radius.circular(3)
                            : const Radius.circular(20),
                      ),
                      color: isReceiverMessage
                          ? Colors.grey.shade800
                          : Colors.redAccent[200],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        if (image != null) ...{
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(image),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        },
                        const Text(
                          "Quick brown fox jumps over the lazy dog.",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (isReceiverMessage) Expanded(flex: 1, child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
