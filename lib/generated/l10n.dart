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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `language`
  String get language {
    return Intl.message(
      'language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `sign_in`
  String get sign_in {
    return Intl.message(
      'sign_in',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back!`
  String get wellcome_back {
    return Intl.message(
      'Welcome back!',
      name: 'wellcome_back',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get remember_acc {
    return Intl.message(
      'Remember me',
      name: 'remember_acc',
      desc: '',
      args: [],
    );
  }

  /// `You don't have any account`
  String get no_acc {
    return Intl.message(
      'You don\'t have any account',
      name: 'no_acc',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone_num {
    return Intl.message(
      'Phone number',
      name: 'phone_num',
      desc: '',
      args: [],
    );
  }

  /// `Enter email /phone`
  String get enter_email_phone {
    return Intl.message(
      'Enter email /phone',
      name: 'enter_email_phone',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enter_pas {
    return Intl.message(
      'Enter password',
      name: 'enter_pas',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot_pass {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_pass',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get create_acc {
    return Intl.message(
      'Create an account',
      name: 'create_acc',
      desc: '',
      args: [],
    );
  }

  /// `already have an account `
  String get have_acc {
    return Intl.message(
      'already have an account ',
      name: 'have_acc',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter name`
  String get enter_name {
    return Intl.message(
      'Enter name',
      name: 'enter_name',
      desc: '',
      args: [],
    );
  }

  /// `Enter username`
  String get enter_username {
    return Intl.message(
      'Enter username',
      name: 'enter_username',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_pass {
    return Intl.message(
      'Confirm password',
      name: 'confirm_pass',
      desc: '',
      args: [],
    );
  }

  /// `Can not empty`
  String get can_not_empty {
    return Intl.message(
      'Can not empty',
      name: 'can_not_empty',
      desc: '',
      args: [],
    );
  }

  /// `Terms services`
  String get terms_services {
    return Intl.message(
      'Terms services',
      name: 'terms_services',
      desc: '',
      args: [],
    );
  }

  /// `OTP verify`
  String get otp_verify {
    return Intl.message(
      'OTP verify',
      name: 'otp_verify',
      desc: '',
      args: [],
    );
  }

  /// `We have sent OTP code to your registered phone number. Please enter the OTP code to perform authentication.`
  String get otp_msg {
    return Intl.message(
      'We have sent OTP code to your registered phone number. Please enter the OTP code to perform authentication.',
      name: 'otp_msg',
      desc: '',
      args: [],
    );
  }

  /// `Did not receive OTP?`
  String get not_get_otp {
    return Intl.message(
      'Did not receive OTP?',
      name: 'not_get_otp',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Personal Infomation`
  String get personal_info {
    return Intl.message(
      'Personal Infomation',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_pass {
    return Intl.message(
      'Change password',
      name: 'change_pass',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get sign_out {
    return Intl.message(
      'Sign out',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to sign out?`
  String get sign_out_msg {
    return Intl.message(
      'Do you want to sign out?',
      name: 'sign_out_msg',
      desc: '',
      args: [],
    );
  }

  /// `App version`
  String get app_version {
    return Intl.message(
      'App version',
      name: 'app_version',
      desc: '',
      args: [],
    );
  }

  /// `Infomation`
  String get info {
    return Intl.message(
      'Infomation',
      name: 'info',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get vi {
    return Intl.message(
      'Vietnamese',
      name: 'vi',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message(
      'English',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get current_pass {
    return Intl.message(
      'Current password',
      name: 'current_pass',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get new_pass {
    return Intl.message(
      'New Password',
      name: 'new_pass',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter new password`
  String get c_new_pass {
    return Intl.message(
      'Re-enter new password',
      name: 'c_new_pass',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `Choice`
  String get choices {
    return Intl.message(
      'Choice',
      name: 'choices',
      desc: '',
      args: [],
    );
  }

  /// `Enter Number`
  String get enter_num {
    return Intl.message(
      'Enter Number',
      name: 'enter_num',
      desc: '',
      args: [],
    );
  }

  /// `Enter`
  String get enter {
    return Intl.message(
      'Enter',
      name: 'enter',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get prev {
    return Intl.message(
      'Previous',
      name: 'prev',
      desc: '',
      args: [],
    );
  }

  /// `Add new`
  String get add_new {
    return Intl.message(
      'Add new',
      name: 'add_new',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get reset_pass {
    return Intl.message(
      'Reset password',
      name: 'reset_pass',
      desc: '',
      args: [],
    );
  }

  /// `Send verify`
  String get send_verify {
    return Intl.message(
      'Send verify',
      name: 'send_verify',
      desc: '',
      args: [],
    );
  }

  /// `No comment`
  String get no_comment {
    return Intl.message(
      'No comment',
      name: 'no_comment',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Building management`
  String get building_management {
    return Intl.message(
      'Building management',
      name: 'building_management',
      desc: '',
      args: [],
    );
  }

  /// `Operation`
  String get operation {
    return Intl.message(
      'Operation',
      name: 'operation',
      desc: '',
      args: [],
    );
  }

  /// `Please contact with management committee or receptionist in order to be provided account and password.`
  String get contact_receptionist {
    return Intl.message(
      'Please contact with management committee or receptionist in order to be provided account and password.',
      name: 'contact_receptionist',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `Failure`
  String get failure {
    return Intl.message(
      'Failure',
      name: 'failure',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful, please login`
  String get reg_success {
    return Intl.message(
      'Registration successful, please login',
      name: 'reg_success',
      desc: '',
      args: [],
    );
  }

  /// `Missing required fields`
  String get missing {
    return Intl.message(
      'Missing required fields',
      name: 'missing',
      desc: '',
      args: [],
    );
  }

  /// `Password not match`
  String get not_match {
    return Intl.message(
      'Password not match',
      name: 'not_match',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters. It must contain at least 1 uppercase letter, 1 lowercase letter, 1 number and 1 special character`
  String get val_pass {
    return Intl.message(
      'Password must be at least 8 characters. It must contain at least 1 uppercase letter, 1 lowercase letter, 1 number and 1 special character',
      name: 'val_pass',
      desc: '',
      args: [],
    );
  }

  /// `Account already exists, please login with other account`
  String get account_existed {
    return Intl.message(
      'Account already exists, please login with other account',
      name: 'account_existed',
      desc: '',
      args: [],
    );
  }

  /// `User information is not available on the system, please contact Admin.`
  String get account_not_avaiable {
    return Intl.message(
      'User information is not available on the system, please contact Admin.',
      name: 'account_not_avaiable',
      desc: '',
      args: [],
    );
  }

  /// `Invalid authentication code`
  String get invalid_code {
    return Intl.message(
      'Invalid authentication code',
      name: 'invalid_code',
      desc: '',
      args: [],
    );
  }

  /// `System error`
  String get systeme_error {
    return Intl.message(
      'System error',
      name: 'systeme_error',
      desc: '',
      args: [],
    );
  }

  /// `Account has not been activated`
  String get not_active {
    return Intl.message(
      'Account has not been activated',
      name: 'not_active',
      desc: '',
      args: [],
    );
  }

  /// `Username or password is incorrect`
  String get wrong_sign_in {
    return Intl.message(
      'Username or password is incorrect',
      name: 'wrong_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 1 lowercase letter`
  String get require_lowercase {
    return Intl.message(
      'Password must contain at least 1 lowercase letter',
      name: 'require_lowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 1 uppercase letter`
  String get require_uppercase {
    return Intl.message(
      'Password must contain at least 1 uppercase letter',
      name: 'require_uppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must not contain Vietnamese character`
  String get not_vietnamese {
    return Intl.message(
      'Password must not contain Vietnamese character',
      name: 'not_vietnamese',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 1 number`
  String get require_number {
    return Intl.message(
      'Password must contain at least 1 number',
      name: 'require_number',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 1 special symbol`
  String get require_special_char {
    return Intl.message(
      'Password must contain at least 1 special symbol',
      name: 'require_special_char',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least 4 letter and at most 20 letter`
  String get min_max_pass {
    return Intl.message(
      'Password must contain at least 4 letter and at most 20 letter',
      name: 'min_max_pass',
      desc: '',
      args: [],
    );
  }

  /// `Error Connection`
  String get err_conn {
    return Intl.message(
      'Error Connection',
      name: 'err_conn',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get err_unknown {
    return Intl.message(
      'Unknown Error',
      name: 'err_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Application`
  String get application {
    return Intl.message(
      'Application',
      name: 'application',
      desc: '',
      args: [],
    );
  }

  /// `Extra task`
  String get extr_tast {
    return Intl.message(
      'Extra task',
      name: 'extr_tast',
      desc: '',
      args: [],
    );
  }

  /// `Periodically task`
  String get period_task {
    return Intl.message(
      'Periodically task',
      name: 'period_task',
      desc: '',
      args: [],
    );
  }

  /// `Property`
  String get property {
    return Intl.message(
      'Property',
      name: 'property',
      desc: '',
      args: [],
    );
  }

  /// `Reception`
  String get reception {
    return Intl.message(
      'Reception',
      name: 'reception',
      desc: '',
      args: [],
    );
  }

  /// `Parcel`
  String get parcel {
    return Intl.message(
      'Parcel',
      name: 'parcel',
      desc: '',
      args: [],
    );
  }

  /// `Penetration`
  String get penetration {
    return Intl.message(
      'Penetration',
      name: 'penetration',
      desc: '',
      args: [],
    );
  }

  /// `Resident identity card`
  String get resident_card {
    return Intl.message(
      'Resident identity card',
      name: 'resident_card',
      desc: '',
      args: [],
    );
  }

  /// `Vehicle registration card`
  String get verhicle_card {
    return Intl.message(
      'Vehicle registration card',
      name: 'verhicle_card',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get customer {
    return Intl.message(
      'Customer',
      name: 'customer',
      desc: '',
      args: [],
    );
  }

  /// `Application List`
  String get list_apl {
    return Intl.message(
      'Application List',
      name: 'list_apl',
      desc: '',
      args: [],
    );
  }

  /// `Create Leave of Absence Letter`
  String get cr_absent {
    return Intl.message(
      'Create Leave of Absence Letter',
      name: 'cr_absent',
      desc: '',
      args: [],
    );
  }

  /// `Create Leave of Break Letter`
  String get cr_break {
    return Intl.message(
      'Create Leave of Break Letter',
      name: 'cr_break',
      desc: '',
      args: [],
    );
  }

  /// `Create change shift Letter`
  String get cr_change_shift {
    return Intl.message(
      'Create change shift Letter',
      name: 'cr_change_shift',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Reason`
  String get reason_off {
    return Intl.message(
      'Reason',
      name: 'reason_off',
      desc: '',
      args: [],
    );
  }

  /// `Date/Time`
  String get time_off {
    return Intl.message(
      'Date/Time',
      name: 'time_off',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Enter note`
  String get enter_note {
    return Intl.message(
      'Enter note',
      name: 'enter_note',
      desc: '',
      args: [],
    );
  }

  /// `Choose type`
  String get choose_off {
    return Intl.message(
      'Choose type',
      name: 'choose_off',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Start time`
  String get start_time {
    return Intl.message(
      'Start time',
      name: 'start_time',
      desc: '',
      args: [],
    );
  }

  /// `End time`
  String get end_time {
    return Intl.message(
      'End time',
      name: 'end_time',
      desc: '',
      args: [],
    );
  }

  /// `Reason change shift`
  String get reason_change_shift {
    return Intl.message(
      'Reason change shift',
      name: 'reason_change_shift',
      desc: '',
      args: [],
    );
  }

  /// `Change from date`
  String get date_change_fr {
    return Intl.message(
      'Change from date',
      name: 'date_change_fr',
      desc: '',
      args: [],
    );
  }

  /// ` Change to date`
  String get date_change_to {
    return Intl.message(
      ' Change to date',
      name: 'date_change_to',
      desc: '',
      args: [],
    );
  }

  /// `Shift`
  String get shift {
    return Intl.message(
      'Shift',
      name: 'shift',
      desc: '',
      args: [],
    );
  }

  /// `Detail letter`
  String get detail_letter {
    return Intl.message(
      'Detail letter',
      name: 'detail_letter',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `History update`
  String get history_update {
    return Intl.message(
      'History update',
      name: 'history_update',
      desc: '',
      args: [],
    );
  }

  /// `History approve`
  String get history_approve {
    return Intl.message(
      'History approve',
      name: 'history_approve',
      desc: '',
      args: [],
    );
  }

  /// `Rely`
  String get rely {
    return Intl.message(
      'Rely',
      name: 'rely',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
