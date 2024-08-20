// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:campus_app/cookie_storage.dart';
import 'package:campus_app/models/club.dart';

class ClubNotifier extends StateNotifier<void> {
  ClubNotifier(
    this.cookieStorage,
  ) : super(());

  final CookieStorage cookieStorage;

  Future<List<Club>> getClubs() async {
    try {
      final cookie = await cookieStorage.getCookie();
      final response = await http.get(
          Uri.parse("https://campusapi-puce.vercel.app/api/users/allclub"),
          headers: {"X-CSRF-Token": cookie ?? ""});
      if (response.statusCode != 200) {
        throw ErrorDescription("Could not fetch events");
      } else {
        final body = jsonDecode(response.body);
        final List<dynamic> clubs = body['data']['clubs'];
        print(clubs);
        final List<Club> clubsList =
            clubs.map((event) => Club.fromMap(event)).toList();
        return clubsList;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
