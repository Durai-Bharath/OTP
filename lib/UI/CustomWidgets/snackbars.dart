import 'package:flutter/material.dart';

SnackBar errorSnackbar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.red,
  );
}

SnackBar successSnackbar(String message) {
  return SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.green,
  );
}
