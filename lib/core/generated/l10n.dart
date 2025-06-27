// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Lang {
  Lang();

  static Lang? _current;

  static Lang get current {
    assert(
      _current != null,
      'No instance of Lang was loaded. Try to initialize the Lang delegate before accessing Lang.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Lang> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Lang();
      Lang._current = instance;

      return instance;
    });
  }

  static Lang of(BuildContext context) {
    final instance = Lang.maybeOf(context);
    assert(
      instance != null,
      'No instance of Lang present in the widget tree. Did you add Lang.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static Lang? maybeOf(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  /// `Dream Vila`
  String get apptitle {
    return Intl.message('Dream Vila', name: 'apptitle', desc: '', args: []);
  }

  /// `Sign In`
  String get text_sign_in {
    return Intl.message('Sign In', name: 'text_sign_in', desc: '', args: []);
  }

  /// `Sign Up`
  String get text_sign_up {
    return Intl.message('Sign Up', name: 'text_sign_up', desc: '', args: []);
  }

  /// `Forget Password?`
  String get text_forgetpassword {
    return Intl.message(
      'Forget Password?',
      name: 'text_forgetpassword',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account ? `
  String get text_YouDoNotHaveAccount {
    return Intl.message(
      'Don’t have an account ? ',
      name: 'text_YouDoNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get text_Alreadyhaveaccount {
    return Intl.message(
      'Already have an account? ',
      name: 'text_Alreadyhaveaccount',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get text_male {
    return Intl.message('Male', name: 'text_male', desc: '', args: []);
  }

  /// `Female`
  String get text_felame {
    return Intl.message('Female', name: 'text_felame', desc: '', args: []);
  }

  /// `Upload User Profile`
  String get text_upload_user_profile {
    return Intl.message(
      'Upload User Profile',
      name: 'text_upload_user_profile',
      desc: '',
      args: [],
    );
  }

  /// `Hobby`
  String get text_hobby {
    return Intl.message('Hobby', name: 'text_hobby', desc: '', args: []);
  }

  /// `Reading`
  String get text_Reading {
    return Intl.message('Reading', name: 'text_Reading', desc: '', args: []);
  }

  /// `Drawing`
  String get text_Drawing {
    return Intl.message('Drawing', name: 'text_Drawing', desc: '', args: []);
  }

  /// `Writting`
  String get text_Writting {
    return Intl.message('Writting', name: 'text_Writting', desc: '', args: []);
  }

  /// `Photography`
  String get text_Photography {
    return Intl.message(
      'Photography',
      name: 'text_Photography',
      desc: '',
      args: [],
    );
  }

  /// `Hello!`
  String get text_hello {
    return Intl.message('Hello!', name: 'text_hello', desc: '', args: []);
  }

  /// `+Add Property`
  String get text_addProperty {
    return Intl.message(
      '+Add Property',
      name: 'text_addProperty',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get text_description {
    return Intl.message(
      'Description',
      name: 'text_description',
      desc: '',
      args: [],
    );
  }

  /// `Location : `
  String get text_location {
    return Intl.message(
      'Location : ',
      name: 'text_location',
      desc: '',
      args: [],
    );
  }

  /// `Price : `
  String get text_price {
    return Intl.message('Price : ', name: 'text_price', desc: '', args: []);
  }

  /// `Discount : `
  String get text_discount {
    return Intl.message(
      'Discount : ',
      name: 'text_discount',
      desc: '',
      args: [],
    );
  }

  /// `Rating : `
  String get text_rating {
    return Intl.message('Rating : ', name: 'text_rating', desc: '', args: []);
  }

  /// `Type : `
  String get text_type {
    return Intl.message('Type : ', name: 'text_type', desc: '', args: []);
  }

  /// `Bedroom : `
  String get text_bedroom {
    return Intl.message('Bedroom : ', name: 'text_bedroom', desc: '', args: []);
  }

  /// `Hall : `
  String get text_hall {
    return Intl.message('Hall : ', name: 'text_hall', desc: '', args: []);
  }

  /// `Kitchen : `
  String get text_kitchen {
    return Intl.message('Kitchen : ', name: 'text_kitchen', desc: '', args: []);
  }

  /// `Washroom : `
  String get text_washroom {
    return Intl.message(
      'Washroom : ',
      name: 'text_washroom',
      desc: '',
      args: [],
    );
  }

  /// `Plots : `
  String get text_plot {
    return Intl.message('Plots : ', name: 'text_plot', desc: '', args: []);
  }

  /// `abc@gmail.com`
  String get hint_email {
    return Intl.message(
      'abc@gmail.com',
      name: 'hint_email',
      desc: '',
      args: [],
    );
  }

  /// `*******`
  String get hint_password {
    return Intl.message('*******', name: 'hint_password', desc: '', args: []);
  }

  /// `Name`
  String get hint_name {
    return Intl.message('Name', name: 'hint_name', desc: '', args: []);
  }

  /// `+91`
  String get hint_mobile {
    return Intl.message('+91', name: 'hint_mobile', desc: '', args: []);
  }

  /// `Email`
  String get lbl_email {
    return Intl.message('Email', name: 'lbl_email', desc: '', args: []);
  }

  /// `Password`
  String get lbl_password {
    return Intl.message('Password', name: 'lbl_password', desc: '', args: []);
  }

  /// `Confirm Password`
  String get lbl_Confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'lbl_Confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get lbl_first_name {
    return Intl.message(
      'First Name',
      name: 'lbl_first_name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lbl_last_name {
    return Intl.message('Last Name', name: 'lbl_last_name', desc: '', args: []);
  }

  /// `Mobile`
  String get lbl_mobile {
    return Intl.message('Mobile', name: 'lbl_mobile', desc: '', args: []);
  }

  /// `Gender`
  String get lbl_gender {
    return Intl.message('Gender', name: 'lbl_gender', desc: '', args: []);
  }

  /// `House`
  String get lbl_house {
    return Intl.message('House', name: 'lbl_house', desc: '', args: []);
  }

  /// `Apartment`
  String get lbl_apartment {
    return Intl.message('Apartment', name: 'lbl_apartment', desc: '', args: []);
  }

  /// `Office`
  String get lbl_office {
    return Intl.message('Office', name: 'lbl_office', desc: '', args: []);
  }

  /// `Land`
  String get lbl_land {
    return Intl.message('Land', name: 'lbl_land', desc: '', args: []);
  }

  /// `Plots`
  String get lbl_plots {
    return Intl.message('Plots', name: 'lbl_plots', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Lang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
