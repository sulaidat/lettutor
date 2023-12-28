import 'package:dio/dio.dart';

class Constants {
  // auth api
  static String baseUrl = "https://sandbox.api.lettutor.com/";
  static String register = "auth/register";
  static String registerByPhone = "auth/phone-register";
  static String resendOTP = "verify/phone-auth-verify/create";
  static String activatePhoneWithOTP = "verify/phone-auth-verify/activate";
  static String login = "auth/login";
  static String loginByPhone = "auth/phone-login";
  static String loginByGoogle = "auth/google";
  static String loginByFacebook = "auth/facebook";
  static String verifyAccount =
      "auth/verifyAccount"; // auth/verifyAccount?token=123
  static String refreshToken = "auth/refresh-token";
  static String forgotPassword = "user/forgotPassword";
  static authOption(String token) => Options(
        headers: {'Authorization': 'Bearer $token'},
        validateStatus: (status) {
          return status! <= 500;
        },
      );

  // user api
  static String userInfo = "${baseUrl}user/info";
  static String total = "${baseUrl}call/total";

  // tutor api
  static tutorListWithPage({
    required int page,
    required int perPage,
  }) {
    return '${baseUrl}tutor/more?perPage=$perPage&page=$page';
  }

  static tutorById(String id) {
    return '${baseUrl}tutor/$id';
  }

  static String tutorSearch = "${baseUrl}tutor/search";
  static String addToFavorite = "${baseUrl}user/manageFavoriteTutor";
  static String report = "${baseUrl}report";
  static String feedback(String userId, int page, int perPage) =>
      "${baseUrl}feedback/v2/$userId?page=$page&perPage=$perPage";
  static String allFeedback(String userId) => "${baseUrl}feedback/v2/$userId";

  // schedule api
  static String callTotal = "${baseUrl}call/total";
  static String upcommingLesson = "${baseUrl}booking/next";

  static String bookedClassesWithPage({
    required int page,
    required int perPage,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch;
    return '${baseUrl}booking/list/student?page=$page&perPage=$perPage&dateTimeGte=$now&orderBy=meeting&sortBy=asc';
  }

  static String bookingScheduleDetail = "${baseUrl}booking/schedule-detail";
  static String learnTopic = "${baseUrl}learn-topic";
  static String testPreparation = "${baseUrl}test-preparation";

  // course api
  static String coursePage(int page, int size) =>
      '${baseUrl}course?page=$page&size=$size';

  static String courseById(String id) {
    return '${baseUrl}course/$id';
  }

  // booking api
  static String schedule = "${baseUrl}schedule";
  static String booking = "${baseUrl}booking";
  static String bookingListStudent = "${baseUrl}booking/list/student";
}

const countryList = {
  "AF": "Afghanistan",
  "AL": "Albania",
  "DZ": "Algeria",
  "AS": "American Samoa",
  "AD": "Andorra",
  "AO": "Angola",
  "AI": "Anguilla",
  "AQ": "Antarctica",
  "AG": "Antigua and Barbuda",
  "AR": "Argentina",
  "AM": "Armenia",
  "AW": "Aruba",
  "AU": "Australia",
  "AT": "Austria",
  "AZ": "Azerbaijan",
  "BS": "Bahamas (the)",
  "BH": "Bahrain",
  "BD": "Bangladesh",
  "BB": "Barbados",
  "BY": "Belarus",
  "BE": "Belgium",
  "BZ": "Belize",
  "BJ": "Benin",
  "BM": "Bermuda",
  "BT": "Bhutan",
  "BO": "Bolivia (Plurinational State of)",
  "BQ": "Bonaire, Sint Eustatius and Saba",
  "BA": "Bosnia and Herzegovina",
  "BW": "Botswana",
  "BV": "Bouvet Island",
  "BR": "Brazil",
  "IO": "British Indian Ocean Territory (the)",
  "BN": "Brunei Darussalam",
  "BG": "Bulgaria",
  "BF": "Burkina Faso",
  "BI": "Burundi",
  "CV": "Cabo Verde",
  "KH": "Cambodia",
  "CM": "Cameroon",
  "CA": "Canada",
  "KY": "Cayman Islands (the)",
  "CF": "Central African Republic (the)",
  "TD": "Chad",
  "CL": "Chile",
  "CN": "China",
  "CX": "Christmas Island",
  "CC": "Cocos (Keeling) Islands (the)",
  "CO": "Colombia",
  "KM": "Comoros (the)",
  "CD": "Congo (the Democratic Republic of the)",
  "CG": "Congo (the)",
  "CK": "Cook Islands (the)",
  "CR": "Costa Rica",
  "HR": "Croatia",
  "CU": "Cuba",
  "CW": "Curaçao",
  "CY": "Cyprus",
  "CZ": "Czechia",
  "CI": "Côte d'Ivoire",
  "DK": "Denmark",
  "DJ": "Djibouti",
  "DM": "Dominica",
  "DO": "Dominican Republic (the)",
  "EC": "Ecuador",
  "EG": "Egypt",
  "SV": "El Salvador",
  "GQ": "Equatorial Guinea",
  "ER": "Eritrea",
  "EE": "Estonia",
  "SZ": "Eswatini",
  "ET": "Ethiopia",
  "FK": "Falkland Islands (the) [Malvinas]",
  "FO": "Faroe Islands (the)",
  "FJ": "Fiji",
  "FI": "Finland",
  "FR": "France",
  "GF": "French Guiana",
  "PF": "French Polynesia",
  "TF": "French Southern Territories (the)",
  "GA": "Gabon",
  "GM": "Gambia (the)",
  "GE": "Georgia",
  "DE": "Germany",
  "GH": "Ghana",
  "GI": "Gibraltar",
  "GR": "Greece",
  "GL": "Greenland",
  "GD": "Grenada",
  "GP": "Guadeloupe",
  "GU": "Guam",
  "GT": "Guatemala",
  "GG": "Guernsey",
  "GN": "Guinea",
  "GW": "Guinea-Bissau",
  "GY": "Guyana",
  "HT": "Haiti",
  "HM": "Heard Island and McDonald Islands",
  "VA": "Holy See (the)",
  "HN": "Honduras",
  "HK": "Hong Kong",
  "HU": "Hungary",
  "IS": "Iceland",
  "IN": "India",
  "ID": "Indonesia",
  "IR": "Iran (Islamic Republic of)",
  "IQ": "Iraq",
  "IE": "Ireland",
  "IM": "Isle of Man",
  "IL": "Israel",
  "IT": "Italy",
  "JM": "Jamaica",
  "JP": "Japan",
  "JE": "Jersey",
  "JO": "Jordan",
  "KZ": "Kazakhstan",
  "KE": "Kenya",
  "KI": "Kiribati",
  "KP": "Korea (the Democratic People's Republic of)",
  "KR": "Korea (the Republic of)",
  "KW": "Kuwait",
  "KG": "Kyrgyzstan",
  "LA": "Lao People's Democratic Republic (the)",
  "LV": "Latvia",
  "LB": "Lebanon",
  "LS": "Lesotho",
  "LR": "Liberia",
  "LY": "Libya",
  "LI": "Liechtenstein",
  "LT": "Lithuania",
  "LU": "Luxembourg",
  "MO": "Macao",
  "MG": "Madagascar",
  "MW": "Malawi",
  "MY": "Malaysia",
  "MV": "Maldives",
  "ML": "Mali",
  "MT": "Malta",
  "MH": "Marshall Islands (the)",
  "MQ": "Martinique",
  "MR": "Mauritania",
  "MU": "Mauritius",
  "YT": "Mayotte",
  "MX": "Mexico",
  "FM": "Micronesia (Federated States of)",
  "MD": "Moldova (the Republic of)",
  "MC": "Monaco",
  "MN": "Mongolia",
  "ME": "Montenegro",
  "MS": "Montserrat",
  "MA": "Morocco",
  "MZ": "Mozambique",
  "MM": "Myanmar",
  "NA": "Namibia",
  "NR": "Nauru",
  "NP": "Nepal",
  "NL": "Netherlands (the)",
  "NC": "New Caledonia",
  "NZ": "New Zealand",
  "NI": "Nicaragua",
  "NE": "Niger (the)",
  "NG": "Nigeria",
  "NU": "Niue",
  "NF": "Norfolk Island",
  "MP": "Northern Mariana Islands (the)",
  "NO": "Norway",
  "OM": "Oman",
  "PK": "Pakistan",
  "PW": "Palau",
  "PS": "Palestine, State of",
  "PA": "Panama",
  "PG": "Papua New Guinea",
  "PY": "Paraguay",
  "PE": "Peru",
  "PH": "Philippines (the)",
  "PN": "Pitcairn",
  "PL": "Poland",
  "PT": "Portugal",
  "PR": "Puerto Rico",
  "QA": "Qatar",
  "MK": "Republic of North Macedonia",
  "RO": "Romania",
  "RU": "Russian Federation",
  "RW": "Rwanda",
  "RE": "Réunion",
  "BL": "Saint Barthélemy",
  "SH": "Saint Helena, Ascension and Tristan da Cunha",
  "KN": "Saint Kitts and Nevis",
  "LC": "Saint Lucia",
  "MF": "Saint Martin (French part)",
  "PM": "Saint Pierre and Miquelon",
  "VC": "Saint Vincent and the Grenadines",
  "WS": "Samoa",
  "SM": "San Marino",
  "ST": "Sao Tome and Principe",
  "SA": "Saudi Arabia",
  "SN": "Senegal",
  "RS": "Serbia",
  "SC": "Seychelles",
  "SL": "Sierra Leone",
  "SG": "Singapore",
  "SX": "Sint Maarten (Dutch part)",
  "SK": "Slovakia",
  "SI": "Slovenia",
  "SB": "Solomon Islands",
  "SO": "Somalia",
  "ZA": "South Africa",
  "GS": "South Georgia and the South Sandwich Islands",
  "SS": "South Sudan",
  "ES": "Spain",
  "LK": "Sri Lanka",
  "SD": "Sudan (the)",
  "SR": "Suriname",
  "SJ": "Svalbard and Jan Mayen",
  "SE": "Sweden",
  "CH": "Switzerland",
  "SY": "Syrian Arab Republic",
  "TW": "Taiwan",
  "TJ": "Tajikistan",
  "TZ": "Tanzania, United Republic of",
  "TH": "Thailand",
  "TL": "Timor-Leste",
  "TG": "Togo",
  "TK": "Tokelau",
  "TO": "Tonga",
  "TT": "Trinidad and Tobago",
  "TN": "Tunisia",
  "TR": "Turkey",
  "TM": "Turkmenistan",
  "TC": "Turks and Caicos Islands (the)",
  "TV": "Tuvalu",
  "UG": "Uganda",
  "UA": "Ukraine",
  "AE": "United Arab Emirates (the)",
  "GB": "United Kingdom of Great Britain and Northern Ireland (the)",
  "UM": "United States Minor Outlying Islands (the)",
  "US": "United States of America (the)",
  "UY": "Uruguay",
  "UZ": "Uzbekistan",
  "VU": "Vanuatu",
  "VE": "Venezuela (Bolivarian Republic of)",
  "VN": "Viet Nam",
  "VG": "Virgin Islands (British)",
  "VI": "Virgin Islands (U.S.)",
  "WF": "Wallis and Futuna",
  "EH": "Western Sahara",
  "YE": "Yemen",
  "ZM": "Zambia",
  "ZW": "Zimbabwe",
  "AX": "Åland Islands"
};

const userLevels = {
  "BEGINNER": "Pre A1 (Beginner)",
  "HIGHER_BEGINNER": "A1 (Higher Beginner)",
  "PRE_INTERMEDIATE": "A2 (Pre-Intermediate)",
  "INTERMEDIATE": "B1 (Intermediate)",
  "UPPER_INTERMEDIATE": "B2 (Upper-Intermediate)",
  "ADVANCED": "C1 (Advanced)",
  "PROFICIENCY": "C2 (Proficiency)",
};

final courseLevels = {
  '0': 'Any level',
  '1': 'Beginner',
  '2': 'High Beginner',
  '3': 'Pre-Intermediate',
  '4': 'Intermediate',
  '5': 'Upper-Intermediate',
  '6': 'Advanced',
  '7': 'Proficiency'
};