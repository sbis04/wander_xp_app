import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

bool isTripsEmpty(dynamic trips) {
  final List<dynamic>? retrievedTrips = trips['trips'];
  if (retrievedTrips == null) {
    return true;
  }

  return false;
}
