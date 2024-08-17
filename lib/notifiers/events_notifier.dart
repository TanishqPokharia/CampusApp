// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:campus_app/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:campus_app/cookie_storage.dart';

import 'package:http/http.dart' as http;

class EventsNotifier extends StateNotifier<void> {
  EventsNotifier(
    this.cookieStorage,
  ) : super(());

  final CookieStorage cookieStorage;
  Future<List<Event>> getEvents() async {
    try {
      final cookie = await cookieStorage.getCookie();
      final response = await http.get(
          Uri.parse("https://campusapi-puce.vercel.app/api/users/allevent"),
          headers: {"X-CSRF-Token": cookie ?? ""});
      if (response.statusCode != 200) {
        throw ErrorDescription("Could not fetch events");
      } else {
        final body = jsonDecode(response.body);
        final List<dynamic> events = body['data']['events'];
        print(events);
        final List<Event> eventsList =
            events.map((event) => Event.fromMap(event)).toList();
        return eventsList;
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
