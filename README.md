# p10_display_ui

An IoT application built using Flutter & HTTP protocol.

## How the System Works:
1. The Flutter app takes an ESP8266 IP address and a message as input.
2. It sends an HTTP GET request to the ESP8266 server with the message appended as a query parameter.
3. The ESP8266 server receives the request, retrieves the message, and initiates scrolling the message on the LED matrix display.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
