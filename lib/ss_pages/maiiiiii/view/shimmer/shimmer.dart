import 'package:flutter/material.dart';

/// 一个通用闪光特效组件，可用于任意子Widget
class ShiningEffect extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool enabled;
  final double shineWidth; // 闪光带宽占比 (0.0 - 1.0)，相对于控件宽度
  final Color shineColor;
  final double opacity;
  final double? borderRadius;

  const ShiningEffect({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    this.enabled = true,
    this.shineWidth = 0.3,
    this.shineColor = Colors.white,
    this.opacity = 0.6,
    this.borderRadius ,
  });

  @override
  State<ShiningEffect> createState() => _ShiningEffectState();
}

class _ShiningEffectState extends State<ShiningEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    if (widget.enabled) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant ShiningEffect oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled && !_controller.isAnimating) {
      _controller.repeat();
    } else if (!widget.enabled && _controller.isAnimating) {
      _controller.stop();
    }
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
      if (widget.enabled) {
        _controller
          ..reset()
          ..repeat();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// percent: 0.0 -> 1.0
  /// 我们把 startX 计算成从 -width 到 +width，这样渐变会从左外侧扫到右外侧
  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return LayoutBuilder(
      builder: (context, c) {
        double maxW = c.maxWidth;
        double maxH = c.maxHeight;
        double tmpR = maxH < maxW ? maxW:maxH;
        return ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius??tmpR),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final double percent = _controller.value;
              return ShaderMask(
                blendMode: BlendMode.plus, // 保留子控件原色并在上面叠加高光
                shaderCallback: (Rect bounds) {
                  final double width = bounds.width;
                  final double height = bounds.height;

                  // 计算闪光带在控件坐标系内的偏移 - 从 -width 到 +width
                  final double startX = width * (percent * 2 - 1);

                  // 闪光带实际像素宽度
                  final double shinePixel = (width * widget.shineWidth).clamp(
                    1.0,
                    width,
                  );

                  // 为了让渐变平滑，构建比控件宽度更长的 rect（覆盖左右移动范围）
                  // 这里我们把 shaderRect 放在 startX - shinePixel ... startX + shinePixel
                  final double shaderLeft = startX - shinePixel;
                  final double shaderWidth = width + shinePixel * 2;

                  // 渐变颜色与定位：透明 -> 高亮 -> 透明
                  final gradient = LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Colors.transparent,
                      widget.shineColor.withValues(alpha: widget.opacity),
                      Colors.transparent,

                    ],
                    stops: const [0.0, 0.5, 1],
                  );

                  // createShader 的 Rect 决定了渐变的位置与伸展，这里通过偏移 rect 实现移动效果
                  return gradient.createShader(
                    Rect.fromLTWH(shaderLeft, 0, shaderWidth, height),
                  );
                },
                child: child,
              );
            },
            child: widget.child,
          ),
        );
      },
    );
  }
}
