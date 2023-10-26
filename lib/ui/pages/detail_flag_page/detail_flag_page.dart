import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flags_app/core/models/flag/flag.dart';
import 'package:flags_app/core/redux/action_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DetailFlagPage extends StatefulActionMapper {
  const DetailFlagPage({
    super.key,
    required this.flag,
  });

  final Flag flag;

  @override
  State<DetailFlagPage> createState() => _DetailFlagPageState();
}

class _DetailFlagPageState extends State<DetailFlagPage> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    _playAudio();
  }

  FlutterTts get _flutterTts => widget.getIt.get<FlutterTts>();

  void _playAudio() =>
      _flutterTts.speak('${widget.flag.name}\n${widget.flag.descriptions}');

  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.flag.name,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFCBBDFF),
                  Color(0xFF589AF0),
                ],
              ),
            ),
            child: Center(
              child: Text(
                widget.flag.flag,
                style: const TextStyle(
                  fontSize: 100,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            widget.flag.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            widget.flag.descriptions,
          ),
        ],
      ),
    );
  }
}
