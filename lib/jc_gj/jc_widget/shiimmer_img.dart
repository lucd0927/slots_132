import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Matrix4;

class ImageShimmer extends StatefulWidget {
  final Widget child;
  final String imagePath;
  final Duration duration;

  const ImageShimmer({
    super.key,
    required this.child,
    required this.imagePath,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<ImageShimmer> createState() => _ImageShimmerState();
}

class _ImageShimmerState extends State<ImageShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ui.Image? _maskImage;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: widget.duration)..repeat();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final bytes = await DefaultAssetBundle.of(context)
        .load(widget.imagePath)
        .then((b) => b.buffer.asUint8List());
    final img = await decodeImageFromList(bytes);
    setState(() => _maskImage = img);
  }

  @override
  Widget build(BuildContext context) {
    if (_maskImage == null) return widget.child;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        final t = _controller.value; // 0..1
        final dx = MediaQuery.of(context).size.width * (t * 2 - 1);

        // 构造 Matrix4 并取 storage（Float64List）
        final Matrix4 mat4 = Matrix4.identity()
          ..translate(dx, 0.0)
        // 如果需要缩放图片以 fit 到 bounds，可以加 scale
        // ..scale(scaleX, scaleY)
            ;
        final Float64List shaderMatrix = Float64List.fromList(mat4.storage);

        return ShaderMask(
          shaderCallback: (bounds) {
            return ui.ImageShader(
              _maskImage!,
              TileMode.repeated,
              TileMode.clamp,
              shaderMatrix,
            );
          },
          blendMode: BlendMode.srcATop,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
