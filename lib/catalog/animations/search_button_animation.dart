import 'package:flutter/material.dart';

class SearchButtonAnimation extends StatefulWidget {
  const SearchButtonAnimation({super.key, required this.onSearch});

  final void Function(String text) onSearch;

  @override
  State<SearchButtonAnimation> createState() => _SearchButtonAnimationState();
}

class _SearchButtonAnimationState extends State<SearchButtonAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  bool _isForward = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    final _curveAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutExpo,
    );
    _animation = Tween<double>(begin: 0, end: 149).animate(_curveAnimation);

    _animation.addListener(listener);
  }

  void listener() {
    if (_animation.isCompleted) {
      FocusScope.of(context).requestFocus(_focusNode);
    }
    if (_animation.isDismissed) {
      widget.onSearch(_textEditingController.text);
      _textEditingController.clear();
    }
    setState(() {});
  }

  void _onEditingComplete() {
    _animationController.reverse();
    _isForward = false;
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 220,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: _animation.value,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 5),
                  child: TextField(
                    onEditingComplete: _onEditingComplete,
                    focusNode: _focusNode,
                    controller: _textEditingController,
                    cursorColor: Colors.white12,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: _animation.value > 1
                      ? const BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )
                      : BorderRadius.circular(50),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (!_isForward) {
                      _animationController.forward();
                      _isForward = true;
                    } else {
                      _animationController.reverse();
                      _isForward = false;
                      FocusScope.of(context).unfocus();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animation.removeListener(listener);
    _animationController.dispose();
    _focusNode.dispose();
    _textEditingController.dispose();
  }
}
