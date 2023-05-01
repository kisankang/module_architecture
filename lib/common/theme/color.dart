import 'dart:math' as math;
import 'package:flutter/material.dart';

const APP_COLOR = Color(0XFF64BDF2);
const PRIMARY_COLOR = Color(0XFF64BDF2);
const SUB_COLOR = Color(0XFF4E586E);
const SECONDARY_COLOR = Color(0XFF8AD3FE);
const WARNING_COLOR = Color(0XFFF54B64);
const BACKGROUND = Color(0XFF070F1D);
const BACKGROUND_2 = Color(0XFF152033);
const BACKGROUND_3 = Color(0XFF293348);
const LINE_COLOR = Color(0XFF444444);
const LIGHT_BACKGROUND_1 = Color(0XFFF4F4F4);
const LIGHT_BACKGROUND_2 = Color(0XFFF4F4F4);
const LINEAR_GRADIENT_1 = Color(0XFFF4F4F4);
const LINEAR_GRADIENT_2 = Color(0XFFF4F4F4);
const BOTTOM_SHEET_BACKGROUND = Color(0XFF0E141E);
const SEARCH_BACKGROUND = Color(0XFF1A273C);
const SEARCH_BORDER_COLOR = Color(0XFF2F2F2F);
const INDICATOR_TABBAR_COLOR = Color(0XFF4BAEEA);
const INDICATOR_DISABLE_COLOR = Color(0XFF5E5E5E);
const DARK_BACKGROUND_SHEET = Color(0XFF232935);
const DEFAULT_IMAGE_BACKGROUND_COLOR = Color(0XFF1A2335);

const LIGHT_DARK_BACKGROUND = Color(0XFF424D60);

const GREY_2 = Color(0XFFF5F5F5);
const GREY_6 = Color(0XFF757575);
const GREY_7 = Color(0XFF2B343F);
const GREY_8 = Color(0XFF4F4F4F);
const GREY_9 = Color(0XFF808080);

const DARK_BLUE = Color(0XFF152033);
const BLUE = Color(0XFF299EEA);

const MORE_CHAT_BUTTON_BACKGROUND = Color(0XFF12213E);
const MORE_CHAT_BUTTON_BORDER_COLOR = Color(0XFF3D3D3D);
const TEXT_CHAT_BACKGROUND = Color(0XFF51BAFD);
const MORE_CHAT_CALL_SHEET_BACKGROUND = Color(0XFF1C232B);

//primary color
const OLIVE = Color(0XFF4A5533);
const BRIGHT_YELLOW = Color(0XFFF4B836);

const ERROR = Color(0XFFC35C45);
const WHITE = Color(0XFFFFFFFF);
const BLACK = Color(0X000);
const SHADOW = Color(0XFFF2F2F2);
const GRAY = Color(0XFF171E2B);
const DISABLED_TEXT = Color(0xFFB9B9B9);
//background
const GREY_5 = Color(0XFFF2F2F2);
const LIGHT_YELLOW = Color(0XFFFFF8E4);
//text
const GREY_20 = Color(0XFFCCCCCC);
const GREY_200 = Color(0XFFF5F5F5);
const GREY_300 = Color(0XFFE0E0E0);
const GREY_400 = Color(0XFFBDBDBD);
const GREY_500 = Color(0XFF9E9E9E);
const GREY_600 = Color(0XFF757575);

//notification
const SOCIAL_NOTI_ITEM_COLOR = Color(0XFF86CAF0);
const SYSTEM_NOTI_ITEM_COLOR = Color(0XFFFFAA6C);
const EVENT_NOTI_ITEM_COLOR = Color(0XFFC3C716);
const CALL_NOTI_ITEM_COLOR = Color(0XFFC3C716);

//profile
const INFOR_BACKGROUND_COLOR = Color.fromRGBO(248, 250, 251, 1);
const PROFILE_BACKGROUND_COLOR = Color.fromRGBO(239, 242, 244, 1);
const INFOR_NAME_COLOR = Color(0XFF1D1D28);
const INFOR_SUB_COLOR = Color(0XFFA4A4B2);
const INFOR_TEXT_COLOR = Color(0XFFA4A4B2);
const INFOR_NUMBER_COLOR = Color(0XFFFF005C);
const PANEL_COLOR = Color(0xFF171E2B);

//popup color
const ACCEPT_COLOR = Color(0XFF32B5FF);
const CLOSE_COLOR = Color(0XFF000000);

//border
const BORDER_COLOR = Color(0XFFAAAAAA);
const BORDER_TEXTFIELD_COLOR = Color(0XFF1E2532);

//feed
const HASH_TAG_COLOR = Color(0XFF0484CC);

//divider

const DIVIDER_COLOR = Color(0XFFE8E8E8);

//textfield

const TITLE_TEXTFIELD_COLOR = Color(0XFFFFFFFF);
const HINT_COLOR = Color(0XFFA4A4B2);
const CORRECT_COLOR = Color(0XFF4BAEEA);
const TEXTFIELD_COLOR = Color(0XFF171E2B);

const DISABLE_BUTTON_COLOR = Color(0XFFD4D4D4);
const DISABLE_TEXT_COLOR = Color(0XFF808285);
const DARKER_DISABLE_BUTTON_COLOR = Color(0XFF202836);
const DARKER_DISABLE_TEXT_COLOR = Color(0XFF424B5C);

final SEARCH_TEXTFIELD = const Color(0XFF8E8E93).withOpacity(0.12);

//button
const FIRST_COLOR_BUTTON = Color(0XFF64BDF2);
const SECOND_COLOR_BUTTON = Color(0XFF64BDF2);
const BACKGROUND_CONTAINER_BUTTON = Color(0XFF000000);
const STATUS_COLOR = Color(0XFF1E2532);
const CANCEL_CALL_BUTTON = Color(0XFFCF3232);
const ACCEPT_CALL_BUTTON = Color(0XFF32CF5E);
const GREEN_COLOR = Color(0XFF4CD964);
const RED_COLOR = Color(0XFFF54B64);
const INACTIVE_COLOR = Color(0XFFDADADA);
const BACKGROUND_DOOL = Color(0XFF000000);
const TEXT_COLOR_DOOL = Color(0XFFE2CD10);
const WEEK_TEXT_COLOR = Color(0XFF9E9E9E);
const ORANGE_COLOR = Color(0XFFE39145);

const UNREAD_FREE_MESSAGE = Color(0XFFA9A9A9);
const UNREAD_FEE_MESSAGE = Color(0XFFFFB800);

//social
const FACEBOOK_COLOR_BUTTON = Color(0XFF4D64B8);
const GOOGLE_COLOR_BUTTON = Color(0XFFC65B3D);
const APPLE_COLOR_BUTTON = Color(0XFFFFFFFF);

const GROUP_CHAT_HOST_COLOR = Color(0XFF5D50F0);

final LinearGradient LINEAR_BACKGROUND = LinearGradient(
  colors: [FIRST_COLOR_BUTTON, SECOND_COLOR_BUTTON.withOpacity(.8205)],
  transform: const GradientRotation(math.pi * 64.42 / 180), // x : (x / 5)
);

final LinearGradient GREY_LINEAR_BACKGROUND = LinearGradient(
  colors: [const Color(0XFF292D32), const Color(0XFF898A8D).withOpacity(.7819)],
  transform: const GradientRotation(math.pi * 64.42 / 180), // x : (x / 5)
);

final LinearGradient RED_LINEAR_BACKGROUND = LinearGradient(
  colors: [const Color(0XFF750505), const Color(0XFFC83C33).withOpacity(.7819)],
  transform: const GradientRotation(math.pi * 64.42 / 180), // x : (x / 5)
);

final LinearGradient YELLOW_LINEAR_BACKGROUND = LinearGradient(
  colors: [const Color(0XFFF0C651), const Color(0XFFAE8F20).withOpacity(.7819)],
  transform: const GradientRotation(math.pi * 64.42 / 180), // x : (x / 5)
);
