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

  /// `Forgot password`
  String get forgot_pass {
    return Intl.message(
      'Forgot password',
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

  /// `Transportation registration card`
  String get trans_card {
    return Intl.message(
      'Transportation registration card',
      name: 'trans_card',
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

  /// `Letter Detail`
  String get letter_detail {
    return Intl.message(
      'Letter Detail',
      name: 'letter_detail',
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

  /// `Reply`
  String get reply {
    return Intl.message(
      'Reply',
      name: 'reply',
      desc: '',
      args: [],
    );
  }

  /// `Reply absent letter`
  String get reply_absent_letter {
    return Intl.message(
      'Reply absent letter',
      name: 'reply_absent_letter',
      desc: '',
      args: [],
    );
  }

  /// `Reply break time letter`
  String get reply_break_letter {
    return Intl.message(
      'Reply break time letter',
      name: 'reply_break_letter',
      desc: '',
      args: [],
    );
  }

  /// `Reply break time letter`
  String get reply_change_shift {
    return Intl.message(
      'Reply break time letter',
      name: 'reply_change_shift',
      desc: '',
      args: [],
    );
  }

  /// `Reply refusing extra-work`
  String get reply_refuse_ext {
    return Intl.message(
      'Reply refusing extra-work',
      name: 'reply_refuse_ext',
      desc: '',
      args: [],
    );
  }

  /// `Reply changing work deathtime`
  String get reply_change_death {
    return Intl.message(
      'Reply changing work deathtime',
      name: 'reply_change_death',
      desc: '',
      args: [],
    );
  }

  /// `Confirm letter`
  String get confirm_letter {
    return Intl.message(
      'Confirm letter',
      name: 'confirm_letter',
      desc: '',
      args: [],
    );
  }

  /// `Confirm shift changing letter`
  String get confirm_change_letter {
    return Intl.message(
      'Confirm shift changing letter',
      name: 'confirm_change_letter',
      desc: '',
      args: [],
    );
  }

  /// `Responsible person`
  String get changed_person {
    return Intl.message(
      'Responsible person',
      name: 'changed_person',
      desc: '',
      args: [],
    );
  }

  /// `Assign person`
  String get assign_person {
    return Intl.message(
      'Assign person',
      name: 'assign_person',
      desc: '',
      args: [],
    );
  }

  /// `Decision`
  String get decision {
    return Intl.message(
      'Decision',
      name: 'decision',
      desc: '',
      args: [],
    );
  }

  /// `Asset management`
  String get asset_manage {
    return Intl.message(
      'Asset management',
      name: 'asset_manage',
      desc: '',
      args: [],
    );
  }

  /// `Recommend purchasing`
  String get recommend_purchase {
    return Intl.message(
      'Recommend purchasing',
      name: 'recommend_purchase',
      desc: '',
      args: [],
    );
  }

  /// `Request for exporting`
  String get req_export {
    return Intl.message(
      'Request for exporting',
      name: 'req_export',
      desc: '',
      args: [],
    );
  }

  /// `Request for importing`
  String get req_import {
    return Intl.message(
      'Request for importing',
      name: 'req_import',
      desc: '',
      args: [],
    );
  }

  /// `Inventory`
  String get inventory {
    return Intl.message(
      'Inventory',
      name: 'inventory',
      desc: '',
      args: [],
    );
  }

  /// `Asset detail`
  String get asset_detail {
    return Intl.message(
      'Asset detail',
      name: 'asset_detail',
      desc: '',
      args: [],
    );
  }

  /// `History delivery`
  String get history_delivery {
    return Intl.message(
      'History delivery',
      name: 'history_delivery',
      desc: '',
      args: [],
    );
  }

  /// `Related asset`
  String get related_asset {
    return Intl.message(
      'Related asset',
      name: 'related_asset',
      desc: '',
      args: [],
    );
  }

  /// `Comming`
  String get comming {
    return Intl.message(
      'Comming',
      name: 'comming',
      desc: '',
      args: [],
    );
  }

  /// `Import`
  String get import {
    return Intl.message(
      'Import',
      name: 'import',
      desc: '',
      args: [],
    );
  }

  /// `Hand over`
  String get hand_over {
    return Intl.message(
      'Hand over',
      name: 'hand_over',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get sum {
    return Intl.message(
      'Summary',
      name: 'sum',
      desc: '',
      args: [],
    );
  }

  /// `Stock`
  String get stock {
    return Intl.message(
      'Stock',
      name: 'stock',
      desc: '',
      args: [],
    );
  }

  /// `Borrowing`
  String get borrow {
    return Intl.message(
      'Borrowing',
      name: 'borrow',
      desc: '',
      args: [],
    );
  }

  /// `Customer borrowing`
  String get borrow_cus {
    return Intl.message(
      'Customer borrowing',
      name: 'borrow_cus',
      desc: '',
      args: [],
    );
  }

  /// `Not distribution`
  String get not_distribute {
    return Intl.message(
      'Not distribution',
      name: 'not_distribute',
      desc: '',
      args: [],
    );
  }

  /// `Export`
  String get export {
    return Intl.message(
      'Export',
      name: 'export',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get detail {
    return Intl.message(
      'Detail',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Assign`
  String get assign {
    return Intl.message(
      'Assign',
      name: 'assign',
      desc: '',
      args: [],
    );
  }

  /// ` Update Asset information`
  String get update_asset {
    return Intl.message(
      ' Update Asset information',
      name: 'update_asset',
      desc: '',
      args: [],
    );
  }

  /// `Asset type`
  String get asset_type {
    return Intl.message(
      'Asset type',
      name: 'asset_type',
      desc: '',
      args: [],
    );
  }

  /// `Asset group`
  String get asset_group {
    return Intl.message(
      'Asset group',
      name: 'asset_group',
      desc: '',
      args: [],
    );
  }

  /// `Unit`
  String get unit {
    return Intl.message(
      'Unit',
      name: 'unit',
      desc: '',
      args: [],
    );
  }

  /// `Origin`
  String get origin {
    return Intl.message(
      'Origin',
      name: 'origin',
      desc: '',
      args: [],
    );
  }

  /// `Branch`
  String get branch {
    return Intl.message(
      'Branch',
      name: 'branch',
      desc: '',
      args: [],
    );
  }

  /// `Warranty department`
  String get warranty {
    return Intl.message(
      'Warranty department',
      name: 'warranty',
      desc: '',
      args: [],
    );
  }

  /// `Attached photos`
  String get attached_photo {
    return Intl.message(
      'Attached photos',
      name: 'attached_photo',
      desc: '',
      args: [],
    );
  }

  /// `Add photo`
  String get add_photo {
    return Intl.message(
      'Add photo',
      name: 'add_photo',
      desc: '',
      args: [],
    );
  }

  /// `Add file`
  String get add_file {
    return Intl.message(
      'Add file',
      name: 'add_file',
      desc: '',
      args: [],
    );
  }

  /// `Create purchasing request letter`
  String get cr_purchase_req_letter {
    return Intl.message(
      'Create purchasing request letter',
      name: 'cr_purchase_req_letter',
      desc: '',
      args: [],
    );
  }

  /// `Purchasing request letter`
  String get purchase_req_letter {
    return Intl.message(
      'Purchasing request letter',
      name: 'purchase_req_letter',
      desc: '',
      args: [],
    );
  }

  /// `Request letter`
  String get request_letter {
    return Intl.message(
      'Request letter',
      name: 'request_letter',
      desc: '',
      args: [],
    );
  }

  /// `Piority`
  String get piority {
    return Intl.message(
      'Piority',
      name: 'piority',
      desc: '',
      args: [],
    );
  }

  /// `Reason`
  String get reason {
    return Intl.message(
      'Reason',
      name: 'reason',
      desc: '',
      args: [],
    );
  }

  /// `Execute deathline`
  String get deathline_ex {
    return Intl.message(
      'Execute deathline',
      name: 'deathline_ex',
      desc: '',
      args: [],
    );
  }

  /// `Asset List`
  String get asset_list {
    return Intl.message(
      'Asset List',
      name: 'asset_list',
      desc: '',
      args: [],
    );
  }

  /// `Add requesting asset`
  String get add_request_asset {
    return Intl.message(
      'Add requesting asset',
      name: 'add_request_asset',
      desc: '',
      args: [],
    );
  }

  /// `Quotation`
  String get quotation {
    return Intl.message(
      'Quotation',
      name: 'quotation',
      desc: '',
      args: [],
    );
  }

  /// `Add supplier`
  String get add_supplier {
    return Intl.message(
      'Add supplier',
      name: 'add_supplier',
      desc: '',
      args: [],
    );
  }

  /// `Temporary save`
  String get save_temp {
    return Intl.message(
      'Temporary save',
      name: 'save_temp',
      desc: '',
      args: [],
    );
  }

  /// `Enter title`
  String get enter_title {
    return Intl.message(
      'Enter title',
      name: 'enter_title',
      desc: '',
      args: [],
    );
  }

  /// `Chọn`
  String get select {
    return Intl.message(
      'Chọn',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get reload {
    return Intl.message(
      'Reload',
      name: 'reload',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection!`
  String get err_internet {
    return Intl.message(
      'Check your internet connection!',
      name: 'err_internet',
      desc: '',
      args: [],
    );
  }

  /// `Do not have any asset!`
  String get no_asset {
    return Intl.message(
      'Do not have any asset!',
      name: 'no_asset',
      desc: '',
      args: [],
    );
  }

  /// `Management`
  String get manage {
    return Intl.message(
      'Management',
      name: 'manage',
      desc: '',
      args: [],
    );
  }

  /// `Supplier`
  String get supply {
    return Intl.message(
      'Supplier',
      name: 'supply',
      desc: '',
      args: [],
    );
  }

  /// `Asset Name`
  String get asset_name {
    return Intl.message(
      'Asset Name',
      name: 'asset_name',
      desc: '',
      args: [],
    );
  }

  /// `Asset Updated successful`
  String get asset_update_success {
    return Intl.message(
      'Asset Updated successful',
      name: 'asset_update_success',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Asset in stock`
  String get asset_in_stock {
    return Intl.message(
      'Asset in stock',
      name: 'asset_in_stock',
      desc: '',
      args: [],
    );
  }

  /// `Requesting_purchase_asset`
  String get requesting_purchase_asset {
    return Intl.message(
      'Requesting_purchase_asset',
      name: 'requesting_purchase_asset',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Asset Code`
  String get asset_code {
    return Intl.message(
      'Asset Code',
      name: 'asset_code',
      desc: '',
      args: [],
    );
  }

  /// `Group`
  String get group {
    return Intl.message(
      'Group',
      name: 'group',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Export asset`
  String get export_asset {
    return Intl.message(
      'Export asset',
      name: 'export_asset',
      desc: '',
      args: [],
    );
  }

  /// `Recommendation list`
  String get recommendation_list {
    return Intl.message(
      'Recommendation list',
      name: 'recommendation_list',
      desc: '',
      args: [],
    );
  }

  /// `Create importing request letter`
  String get cr_import_request_letter {
    return Intl.message(
      'Create importing request letter',
      name: 'cr_import_request_letter',
      desc: '',
      args: [],
    );
  }

  /// `Deathline`
  String get deathline {
    return Intl.message(
      'Deathline',
      name: 'deathline',
      desc: '',
      args: [],
    );
  }

  /// `Possiton`
  String get possiton {
    return Intl.message(
      'Possiton',
      name: 'possiton',
      desc: '',
      args: [],
    );
  }

  /// `Member`
  String get member {
    return Intl.message(
      'Member',
      name: 'member',
      desc: '',
      args: [],
    );
  }

  /// `Add product`
  String get add_product {
    return Intl.message(
      'Add product',
      name: 'add_product',
      desc: '',
      args: [],
    );
  }

  /// `Complete`
  String get complete {
    return Intl.message(
      'Complete',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Request letter management`
  String get req_letter_management {
    return Intl.message(
      'Request letter management',
      name: 'req_letter_management',
      desc: '',
      args: [],
    );
  }

  /// `Related information`
  String get related_info {
    return Intl.message(
      'Related information',
      name: 'related_info',
      desc: '',
      args: [],
    );
  }

  /// `General information`
  String get general_info {
    return Intl.message(
      'General information',
      name: 'general_info',
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

  /// `Update`
  String get fix {
    return Intl.message(
      'Update',
      name: 'fix',
      desc: '',
      args: [],
    );
  }

  /// `Request purchase`
  String get req_purchase {
    return Intl.message(
      'Request purchase',
      name: 'req_purchase',
      desc: '',
      args: [],
    );
  }

  /// `Don't have any data`
  String get no_data {
    return Intl.message(
      'Don\'t have any data',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Extra task list`
  String get ext_task_list {
    return Intl.message(
      'Extra task list',
      name: 'ext_task_list',
      desc: '',
      args: [],
    );
  }

  /// `Waiting to assign`
  String get wait_assign {
    return Intl.message(
      'Waiting to assign',
      name: 'wait_assign',
      desc: '',
      args: [],
    );
  }

  /// `Waiting to execute`
  String get wait_execute {
    return Intl.message(
      'Waiting to execute',
      name: 'wait_execute',
      desc: '',
      args: [],
    );
  }

  /// `In progress`
  String get in_progress {
    return Intl.message(
      'In progress',
      name: 'in_progress',
      desc: '',
      args: [],
    );
  }

  /// `Waiting to confirm`
  String get wait_confirm {
    return Intl.message(
      'Waiting to confirm',
      name: 'wait_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Over Time`
  String get over_time {
    return Intl.message(
      'Over Time',
      name: 'over_time',
      desc: '',
      args: [],
    );
  }

  /// `Assign task`
  String get assign_task {
    return Intl.message(
      'Assign task',
      name: 'assign_task',
      desc: '',
      args: [],
    );
  }

  /// `Kanban view`
  String get kanban_view {
    return Intl.message(
      'Kanban view',
      name: 'kanban_view',
      desc: '',
      args: [],
    );
  }

  /// `Create task`
  String get cr_task {
    return Intl.message(
      'Create task',
      name: 'cr_task',
      desc: '',
      args: [],
    );
  }

  /// `Create extra task`
  String get cr_ext_task {
    return Intl.message(
      'Create extra task',
      name: 'cr_ext_task',
      desc: '',
      args: [],
    );
  }

  /// `Task_name`
  String get task_name {
    return Intl.message(
      'Task_name',
      name: 'task_name',
      desc: '',
      args: [],
    );
  }

  /// `Assign from`
  String get assign_from {
    return Intl.message(
      'Assign from',
      name: 'assign_from',
      desc: '',
      args: [],
    );
  }

  /// `Department/group`
  String get department_group {
    return Intl.message(
      'Department/group',
      name: 'department_group',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get chot {
    return Intl.message(
      '',
      name: 'chot',
      desc: '',
      args: [],
    );
  }

  /// `Assign to`
  String get assign_to {
    return Intl.message(
      'Assign to',
      name: 'assign_to',
      desc: '',
      args: [],
    );
  }

  /// `End`
  String get end {
    return Intl.message(
      'End',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Supervisor`
  String get supervisor {
    return Intl.message(
      'Supervisor',
      name: 'supervisor',
      desc: '',
      args: [],
    );
  }

  /// `Confirm task`
  String get confirm_task {
    return Intl.message(
      'Confirm task',
      name: 'confirm_task',
      desc: '',
      args: [],
    );
  }

  /// `Task`
  String get task {
    return Intl.message(
      'Task',
      name: 'task',
      desc: '',
      args: [],
    );
  }

  /// `Add more task`
  String get add_task {
    return Intl.message(
      'Add more task',
      name: 'add_task',
      desc: '',
      args: [],
    );
  }

  /// `Extra task detail`
  String get ext_task_detail {
    return Intl.message(
      'Extra task detail',
      name: 'ext_task_detail',
      desc: '',
      args: [],
    );
  }

  /// `Refuse`
  String get refuse {
    return Intl.message(
      'Refuse',
      name: 'refuse',
      desc: '',
      args: [],
    );
  }

  /// `Add attached file`
  String get add_attached_file {
    return Intl.message(
      'Add attached file',
      name: 'add_attached_file',
      desc: '',
      args: [],
    );
  }

  /// `Change deathline`
  String get change_deathline {
    return Intl.message(
      'Change deathline',
      name: 'change_deathline',
      desc: '',
      args: [],
    );
  }

  /// `Adjust`
  String get adjust {
    return Intl.message(
      'Adjust',
      name: 'adjust',
      desc: '',
      args: [],
    );
  }

  /// `Task Detail`
  String get task_detail {
    return Intl.message(
      'Task Detail',
      name: 'task_detail',
      desc: '',
      args: [],
    );
  }

  /// `Attached file`
  String get attached_file {
    return Intl.message(
      'Attached file',
      name: 'attached_file',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Edit extra task`
  String get edit_ext_task {
    return Intl.message(
      'Edit extra task',
      name: 'edit_ext_task',
      desc: '',
      args: [],
    );
  }

  /// `Choose file`
  String get choose_file {
    return Intl.message(
      'Choose file',
      name: 'choose_file',
      desc: '',
      args: [],
    );
  }

  /// `Adjust task`
  String get adjust_task {
    return Intl.message(
      'Adjust task',
      name: 'adjust_task',
      desc: '',
      args: [],
    );
  }

  /// `Deathline change`
  String get deathline_change {
    return Intl.message(
      'Deathline change',
      name: 'deathline_change',
      desc: '',
      args: [],
    );
  }

  /// `Refuse task`
  String get refuse_task {
    return Intl.message(
      'Refuse task',
      name: 'refuse_task',
      desc: '',
      args: [],
    );
  }

  /// `Demand`
  String get demand {
    return Intl.message(
      'Demand',
      name: 'demand',
      desc: '',
      args: [],
    );
  }

  /// `Task list`
  String get task_list {
    return Intl.message(
      'Task list',
      name: 'task_list',
      desc: '',
      args: [],
    );
  }

  /// `Technical Employee`
  String get tech_employee {
    return Intl.message(
      'Technical Employee',
      name: 'tech_employee',
      desc: '',
      args: [],
    );
  }

  /// `Add Employee`
  String get add_employee {
    return Intl.message(
      'Add Employee',
      name: 'add_employee',
      desc: '',
      args: [],
    );
  }

  /// `Periodical task list`
  String get period_task_list {
    return Intl.message(
      'Periodical task list',
      name: 'period_task_list',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get sua {
    return Intl.message(
      'Edit',
      name: 'sua',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete this configuration`
  String get confirm_detele_config {
    return Intl.message(
      'Do you want to delete this configuration',
      name: 'confirm_detele_config',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get res_department {
    return Intl.message(
      'Department',
      name: 'res_department',
      desc: '',
      args: [],
    );
  }

  /// `Zone type`
  String get zone_type {
    return Intl.message(
      'Zone type',
      name: 'zone_type',
      desc: '',
      args: [],
    );
  }

  /// `Zone`
  String get zone {
    return Intl.message(
      'Zone',
      name: 'zone',
      desc: '',
      args: [],
    );
  }

  /// `Frequency`
  String get fre {
    return Intl.message(
      'Frequency',
      name: 'fre',
      desc: '',
      args: [],
    );
  }

  /// `Frequency type`
  String get fre_type {
    return Intl.message(
      'Frequency type',
      name: 'fre_type',
      desc: '',
      args: [],
    );
  }

  /// `Frequency time`
  String get fre_time {
    return Intl.message(
      'Frequency time',
      name: 'fre_time',
      desc: '',
      args: [],
    );
  }

  /// `Create task before(minute)`
  String get pre_cre_task {
    return Intl.message(
      'Create task before(minute)',
      name: 'pre_cre_task',
      desc: '',
      args: [],
    );
  }

  /// `Time done after`
  String get time_done_after {
    return Intl.message(
      'Time done after',
      name: 'time_done_after',
      desc: '',
      args: [],
    );
  }

  /// `Content test`
  String get content_test {
    return Intl.message(
      'Content test',
      name: 'content_test',
      desc: '',
      args: [],
    );
  }

  /// `Save value from`
  String get safe_value_from {
    return Intl.message(
      'Save value from',
      name: 'safe_value_from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Edit periodical task configuration`
  String get edit_period_task {
    return Intl.message(
      'Edit periodical task configuration',
      name: 'edit_period_task',
      desc: '',
      args: [],
    );
  }

  /// `Add periodical task configuration`
  String get add_period_task {
    return Intl.message(
      'Add periodical task configuration',
      name: 'add_period_task',
      desc: '',
      args: [],
    );
  }

  /// `Add category`
  String get add_category {
    return Intl.message(
      'Add category',
      name: 'add_category',
      desc: '',
      args: [],
    );
  }

  /// `Frequency configuration`
  String get fre_config {
    return Intl.message(
      'Frequency configuration',
      name: 'fre_config',
      desc: '',
      args: [],
    );
  }

  /// `Description content`
  String get des_content {
    return Intl.message(
      'Description content',
      name: 'des_content',
      desc: '',
      args: [],
    );
  }

  /// `Counting unit`
  String get count_unit {
    return Intl.message(
      'Counting unit',
      name: 'count_unit',
      desc: '',
      args: [],
    );
  }

  /// `Missing object list`
  String get missing_obj_list {
    return Intl.message(
      'Missing object list',
      name: 'missing_obj_list',
      desc: '',
      args: [],
    );
  }

  /// `Missing object details`
  String get missing_obj_detail {
    return Intl.message(
      'Missing object details',
      name: 'missing_obj_detail',
      desc: '',
      args: [],
    );
  }

  /// `Missing object name`
  String get missing_obj_name {
    return Intl.message(
      'Missing object name',
      name: 'missing_obj_name',
      desc: '',
      args: [],
    );
  }

  /// `Parcel list`
  String get parcel_list {
    return Intl.message(
      'Parcel list',
      name: 'parcel_list',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get transfer {
    return Intl.message(
      'Transfer',
      name: 'transfer',
      desc: '',
      args: [],
    );
  }

  /// `Parcel details`
  String get parcel_detail {
    return Intl.message(
      'Parcel details',
      name: 'parcel_detail',
      desc: '',
      args: [],
    );
  }

  /// `Create new parcel`
  String get create_parcel {
    return Intl.message(
      'Create new parcel',
      name: 'create_parcel',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Receiver`
  String get receiver {
    return Intl.message(
      'Receiver',
      name: 'receiver',
      desc: '',
      args: [],
    );
  }

  /// `Parcel name`
  String get parcel_name {
    return Intl.message(
      'Parcel name',
      name: 'parcel_name',
      desc: '',
      args: [],
    );
  }

  /// `Transfer parcel`
  String get transfer_parcel {
    return Intl.message(
      'Transfer parcel',
      name: 'transfer_parcel',
      desc: '',
      args: [],
    );
  }

  /// `Add parcel`
  String get add_parcel {
    return Intl.message(
      'Add parcel',
      name: 'add_parcel',
      desc: '',
      args: [],
    );
  }

  /// `Post`
  String get post {
    return Intl.message(
      'Post',
      name: 'post',
      desc: '',
      args: [],
    );
  }

  /// `Building`
  String get building {
    return Intl.message(
      'Building',
      name: 'building',
      desc: '',
      args: [],
    );
  }

  /// `Floor`
  String get floor {
    return Intl.message(
      'Floor',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `Surface`
  String get surface {
    return Intl.message(
      'Surface',
      name: 'surface',
      desc: '',
      args: [],
    );
  }

  /// `Time send`
  String get time_send {
    return Intl.message(
      'Time send',
      name: 'time_send',
      desc: '',
      args: [],
    );
  }

  /// `Images`
  String get images {
    return Intl.message(
      'Images',
      name: 'images',
      desc: '',
      args: [],
    );
  }

  /// `Sender`
  String get sender {
    return Intl.message(
      'Sender',
      name: 'sender',
      desc: '',
      args: [],
    );
  }

  /// `Edit parcel`
  String get edit_parcel {
    return Intl.message(
      'Edit parcel',
      name: 'edit_parcel',
      desc: '',
      args: [],
    );
  }

  /// `Create an entrance`
  String get cr_entrance {
    return Intl.message(
      'Create an entrance',
      name: 'cr_entrance',
      desc: '',
      args: [],
    );
  }

  /// `Visit card number`
  String get visit_card_num {
    return Intl.message(
      'Visit card number',
      name: 'visit_card_num',
      desc: '',
      args: [],
    );
  }

  /// `Confirm person`
  String get confirm_person {
    return Intl.message(
      'Confirm person',
      name: 'confirm_person',
      desc: '',
      args: [],
    );
  }

  /// `Department`
  String get department {
    return Intl.message(
      'Department',
      name: 'department',
      desc: '',
      args: [],
    );
  }

  /// `Job title`
  String get job_title {
    return Intl.message(
      'Job title',
      name: 'job_title',
      desc: '',
      args: [],
    );
  }

  /// `Indentity card/ passport`
  String get cccd_passport {
    return Intl.message(
      'Indentity card/ passport',
      name: 'cccd_passport',
      desc: '',
      args: [],
    );
  }

  /// `Edit an entrance`
  String get edit_entrance {
    return Intl.message(
      'Edit an entrance',
      name: 'edit_entrance',
      desc: '',
      args: [],
    );
  }

  /// `Entrance Details`
  String get entrance_detail {
    return Intl.message(
      'Entrance Details',
      name: 'entrance_detail',
      desc: '',
      args: [],
    );
  }

  /// `Residence card list`
  String get res_card_list {
    return Intl.message(
      'Residence card list',
      name: 'res_card_list',
      desc: '',
      args: [],
    );
  }

  /// `Activate`
  String get activate {
    return Intl.message(
      'Activate',
      name: 'activate',
      desc: '',
      args: [],
    );
  }

  /// `Card owner`
  String get card_owner {
    return Intl.message(
      'Card owner',
      name: 'card_owner',
      desc: '',
      args: [],
    );
  }

  /// `Card number`
  String get card_num {
    return Intl.message(
      'Card number',
      name: 'card_num',
      desc: '',
      args: [],
    );
  }

  /// `Waiting`
  String get wait {
    return Intl.message(
      'Waiting',
      name: 'wait',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get owner {
    return Intl.message(
      'Owner',
      name: 'owner',
      desc: '',
      args: [],
    );
  }

  /// `Resister`
  String get resister {
    return Intl.message(
      'Resister',
      name: 'resister',
      desc: '',
      args: [],
    );
  }

  /// `Service`
  String get service {
    return Intl.message(
      'Service',
      name: 'service',
      desc: '',
      args: [],
    );
  }

  /// `Extend`
  String get extend {
    return Intl.message(
      'Extend',
      name: 'extend',
      desc: '',
      args: [],
    );
  }

  /// `Add service`
  String get add_service {
    return Intl.message(
      'Add service',
      name: 'add_service',
      desc: '',
      args: [],
    );
  }

  /// `Activate date`
  String get activate_date {
    return Intl.message(
      'Activate date',
      name: 'activate_date',
      desc: '',
      args: [],
    );
  }

  /// `Over date`
  String get over_date {
    return Intl.message(
      'Over date',
      name: 'over_date',
      desc: '',
      args: [],
    );
  }

  /// `Service date`
  String get service_detail {
    return Intl.message(
      'Service date',
      name: 'service_detail',
      desc: '',
      args: [],
    );
  }

  /// `History extend`
  String get history_ext {
    return Intl.message(
      'History extend',
      name: 'history_ext',
      desc: '',
      args: [],
    );
  }

  /// `Extend service`
  String get extend_service {
    return Intl.message(
      'Extend service',
      name: 'extend_service',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Card number is existed`
  String get card_exist {
    return Intl.message(
      'Card number is existed',
      name: 'card_exist',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Add new res idence card`
  String get add_res_card {
    return Intl.message(
      'Add new res idence card',
      name: 'add_res_card',
      desc: '',
      args: [],
    );
  }

  /// `Card information`
  String get card_info {
    return Intl.message(
      'Card information',
      name: 'card_info',
      desc: '',
      args: [],
    );
  }

  /// `Resident card details`
  String get res_car_detail {
    return Intl.message(
      'Resident card details',
      name: 'res_car_detail',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get quantity {
    return Intl.message(
      'Quantity',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Add service for resident`
  String get add_service_for_res {
    return Intl.message(
      'Add service for resident',
      name: 'add_service_for_res',
      desc: '',
      args: [],
    );
  }

  /// `Add transpotation card`
  String get add_trans_card {
    return Intl.message(
      'Add transpotation card',
      name: 'add_trans_card',
      desc: '',
      args: [],
    );
  }

  /// `Owner information`
  String get trans_owner_info {
    return Intl.message(
      'Owner information',
      name: 'trans_owner_info',
      desc: '',
      args: [],
    );
  }

  /// `Transportation infomation`
  String get trans_info {
    return Intl.message(
      'Transportation infomation',
      name: 'trans_info',
      desc: '',
      args: [],
    );
  }

  /// `Variety`
  String get variety {
    return Intl.message(
      'Variety',
      name: 'variety',
      desc: '',
      args: [],
    );
  }

  /// `Register number`
  String get register_num {
    return Intl.message(
      'Register number',
      name: 'register_num',
      desc: '',
      args: [],
    );
  }

  /// `License number`
  String get license {
    return Intl.message(
      'License number',
      name: 'license',
      desc: '',
      args: [],
    );
  }

  /// `Color`
  String get color {
    return Intl.message(
      'Color',
      name: 'color',
      desc: '',
      args: [],
    );
  }

  /// `Transportation card list`
  String get trans_card_list {
    return Intl.message(
      'Transportation card list',
      name: 'trans_card_list',
      desc: '',
      args: [],
    );
  }

  /// `Transportation card detail`
  String get trans_card_detail {
    return Intl.message(
      'Transportation card detail',
      name: 'trans_card_detail',
      desc: '',
      args: [],
    );
  }

  /// `Payment history`
  String get pay_history {
    return Intl.message(
      'Payment history',
      name: 'pay_history',
      desc: '',
      args: [],
    );
  }

  /// `Card owner information`
  String get card_owner_info {
    return Intl.message(
      'Card owner information',
      name: 'card_owner_info',
      desc: '',
      args: [],
    );
  }

  /// `Quantity/month`
  String get quantity_month {
    return Intl.message(
      'Quantity/month',
      name: 'quantity_month',
      desc: '',
      args: [],
    );
  }

  /// `Customer list`
  String get customer_list {
    return Intl.message(
      'Customer list',
      name: 'customer_list',
      desc: '',
      args: [],
    );
  }

  /// `Information reception list`
  String get info_reception_list {
    return Intl.message(
      'Information reception list',
      name: 'info_reception_list',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message(
      'All',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Waiting execute`
  String get wait_exc {
    return Intl.message(
      'Waiting execute',
      name: 'wait_exc',
      desc: '',
      args: [],
    );
  }

  /// `In progress`
  String get exc_in_progress {
    return Intl.message(
      'In progress',
      name: 'exc_in_progress',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get exc_done {
    return Intl.message(
      'Done',
      name: 'exc_done',
      desc: '',
      args: [],
    );
  }

  /// `Create information reception`
  String get cr_info_recept {
    return Intl.message(
      'Create information reception',
      name: 'cr_info_recept',
      desc: '',
      args: [],
    );
  }

  /// `Sender name`
  String get sender_name {
    return Intl.message(
      'Sender name',
      name: 'sender_name',
      desc: '',
      args: [],
    );
  }

  /// `Information type`
  String get info_type {
    return Intl.message(
      'Information type',
      name: 'info_type',
      desc: '',
      args: [],
    );
  }

  /// `Reception time `
  String get time_recept {
    return Intl.message(
      'Reception time ',
      name: 'time_recept',
      desc: '',
      args: [],
    );
  }

  /// `Responsible person`
  String get res_person {
    return Intl.message(
      'Responsible person',
      name: 'res_person',
      desc: '',
      args: [],
    );
  }

  /// `Related department`
  String get related_department {
    return Intl.message(
      'Related department',
      name: 'related_department',
      desc: '',
      args: [],
    );
  }

  /// `Information content`
  String get info_content {
    return Intl.message(
      'Information content',
      name: 'info_content',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get mess {
    return Intl.message(
      'Message',
      name: 'mess',
      desc: '',
      args: [],
    );
  }

  /// `Activities`
  String get activity {
    return Intl.message(
      'Activities',
      name: 'activity',
      desc: '',
      args: [],
    );
  }

  /// `Note list`
  String get note_list {
    return Intl.message(
      'Note list',
      name: 'note_list',
      desc: '',
      args: [],
    );
  }

  /// `Add note`
  String get add_note {
    return Intl.message(
      'Add note',
      name: 'add_note',
      desc: '',
      args: [],
    );
  }

  /// `Note content`
  String get note_content {
    return Intl.message(
      'Note content',
      name: 'note_content',
      desc: '',
      args: [],
    );
  }

  /// `Add new customer`
  String get add_customer {
    return Intl.message(
      'Add new customer',
      name: 'add_customer',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get dob {
    return Intl.message(
      'Date of birth',
      name: 'dob',
      desc: '',
      args: [],
    );
  }

  /// `identity card`
  String get CCCD {
    return Intl.message(
      'identity card',
      name: 'CCCD',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message(
      'Nationality',
      name: 'nationality',
      desc: '',
      args: [],
    );
  }

  /// `Education level`
  String get education_level {
    return Intl.message(
      'Education level',
      name: 'education_level',
      desc: '',
      args: [],
    );
  }

  /// `Qualification`
  String get qualification {
    return Intl.message(
      'Qualification',
      name: 'qualification',
      desc: '',
      args: [],
    );
  }

  /// `Ethnic`
  String get ethnic {
    return Intl.message(
      'Ethnic',
      name: 'ethnic',
      desc: '',
      args: [],
    );
  }

  /// `Place of birth`
  String get pob {
    return Intl.message(
      'Place of birth',
      name: 'pob',
      desc: '',
      args: [],
    );
  }

  /// `Place of origin`
  String get poo {
    return Intl.message(
      'Place of origin',
      name: 'poo',
      desc: '',
      args: [],
    );
  }

  /// `Permanent address`
  String get permanent_address {
    return Intl.message(
      'Permanent address',
      name: 'permanent_address',
      desc: '',
      args: [],
    );
  }

  /// `Current residence`
  String get current_residence {
    return Intl.message(
      'Current residence',
      name: 'current_residence',
      desc: '',
      args: [],
    );
  }

  /// `Matial status`
  String get martial_status {
    return Intl.message(
      'Matial status',
      name: 'martial_status',
      desc: '',
      args: [],
    );
  }

  /// `Profession`
  String get profession {
    return Intl.message(
      'Profession',
      name: 'profession',
      desc: '',
      args: [],
    );
  }

  /// `Work place`
  String get work_place {
    return Intl.message(
      'Work place',
      name: 'work_place',
      desc: '',
      args: [],
    );
  }

  /// `Customer name`
  String get customer_name {
    return Intl.message(
      'Customer name',
      name: 'customer_name',
      desc: '',
      args: [],
    );
  }

  /// `Issue date`
  String get issue_date {
    return Intl.message(
      'Issue date',
      name: 'issue_date',
      desc: '',
      args: [],
    );
  }

  /// `Infomation reception`
  String get info_reception {
    return Intl.message(
      'Infomation reception',
      name: 'info_reception',
      desc: '',
      args: [],
    );
  }

  /// `Reporter`
  String get reporter {
    return Intl.message(
      'Reporter',
      name: 'reporter',
      desc: '',
      args: [],
    );
  }

  /// `Information reception details`
  String get info_recept_details {
    return Intl.message(
      'Information reception details',
      name: 'info_recept_details',
      desc: '',
      args: [],
    );
  }

  /// `Add task`
  String get add_work {
    return Intl.message(
      'Add task',
      name: 'add_work',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in_account {
    return Intl.message(
      'Sign in',
      name: 'sign_in_account',
      desc: '',
      args: [],
    );
  }

  /// `Home Community Smart Living`
  String get sologan {
    return Intl.message(
      'Home Community Smart Living',
      name: 'sologan',
      desc: '',
      args: [],
    );
  }

  /// `You can only upload file jpeg, jpg, png, pdf, doc, docx, xls, xlsx`
  String get pick_file_error {
    return Intl.message(
      'You can only upload file jpeg, jpg, png, pdf, doc, docx, xls, xlsx',
      name: 'pick_file_error',
      desc: '',
      args: [],
    );
  }

  /// `You can only upload file jpeg, jpg, png`
  String get pick_image_error {
    return Intl.message(
      'You can only upload file jpeg, jpg, png',
      name: 'pick_image_error',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `File selection`
  String get file_selection {
    return Intl.message(
      'File selection',
      name: 'file_selection',
      desc: '',
      args: [],
    );
  }

  /// `Error: {message}`
  String err_x(Object message) {
    return Intl.message(
      'Error: $message',
      name: 'err_x',
      desc: '',
      args: [message],
    );
  }

  /// `Login session is invalid, please sign in again`
  String get expired_login {
    return Intl.message(
      'Login session is invalid, please sign in again',
      name: 'expired_login',
      desc: '',
      args: [],
    );
  }

  /// `Permission denied`
  String get permission_denied {
    return Intl.message(
      'Permission denied',
      name: 'permission_denied',
      desc: '',
      args: [],
    );
  }

  /// `You don't have permission`
  String get permission_denied_msg {
    return Intl.message(
      'You don\'t have permission',
      name: 'permission_denied_msg',
      desc: '',
      args: [],
    );
  }

  /// `File is downloading`
  String get file_downloading {
    return Intl.message(
      'File is downloading',
      name: 'file_downloading',
      desc: '',
      args: [],
    );
  }

  /// `Enter employee code here`
  String get enter_employee_code {
    return Intl.message(
      'Enter employee code here',
      name: 'enter_employee_code',
      desc: '',
      args: [],
    );
  }

  /// `Enter here`
  String get enter_here {
    return Intl.message(
      'Enter here',
      name: 'enter_here',
      desc: '',
      args: [],
    );
  }

  /// `How would you like to receive a code to reset your password?`
  String get way_send_otp {
    return Intl.message(
      'How would you like to receive a code to reset your password?',
      name: 'way_send_otp',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP to phone number`
  String get send_to_phone {
    return Intl.message(
      'Send OTP to phone number',
      name: 'send_to_phone',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP to email`
  String get send_to_email {
    return Intl.message(
      'Send OTP to email',
      name: 'send_to_email',
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
