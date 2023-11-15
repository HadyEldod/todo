import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:typed_data';
import 'package:todo_c8/shared/style/app_colors.dart';
class AppStyles{

static TextStyle Robto12()=>GoogleFonts.roboto(
fontSize: 12,
fontWeight: FontWeight.normal,
color: Colors.black);

static TextStyle Poppiens18()=> GoogleFonts.poppins(
fontSize: 18,
fontWeight: FontWeight.bold,
color: AppColors.lightColor);

static TextStyle  Poppiens22()=>GoogleFonts.poppins(
fontSize: 22,
fontWeight: FontWeight.bold,
color: Colors.white);
}