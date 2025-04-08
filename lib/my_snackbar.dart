import 'package:flutter/material.dart';

class MySnackBar {
  final String snackBarTitle;
  final String actionLabel; // বাটনের টেক্সট
  final VoidCallback? onActionPressed; // বাটনে ক্লিক হলে যেই ফাংশন চলবে
  final Color backgroundColor; // কাস্টম ব্যাকগ্রাউন্ড কালার

  MySnackBar(
      this.snackBarTitle, {
        this.actionLabel = "",
        this.onActionPressed,
        this.backgroundColor = Colors.black, // ডিফল্ট কালার হবে কালো
      });

  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          snackBarTitle,
          style: TextStyle(color: Colors.white), // টেক্সট কালার সাদা থাকবে
        ),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: backgroundColor, // ইউজার সেট করা কালার
        action: actionLabel.isNotEmpty
            ? SnackBarAction(
          label: actionLabel,
          onPressed: onActionPressed ?? () {},
          textColor: Colors.yellow, // বাটনের টেক্সট কালার হলুদ
        )
            : null,
      ),
    );
  }
}
