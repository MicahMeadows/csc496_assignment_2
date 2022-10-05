import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ElevatedCircleButton extends StatelessWidget {
  final Function() onTap;
  final Widget child;
  final Color color;
  final double size;
  final double? widthOverride;

  const ElevatedCircleButton({
    required this.onTap,
    required this.child,
    this.color = const Color(0xFFF7FF1D),
    this.size = 68,
    this.widthOverride,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          border: Border.all(
            color: Colors.black,
            width: 5,
          ),
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(
              blurRadius: 0,
              offset: Offset(4, 4),
            ),
          ],
        ),
        width: widthOverride ?? size,
        height: size,
        child: Center(child: child),
      ),
    );
  }
}
