import 'package:cnemax/services/app_icon&image.dart';

class Dummydata {
  List<Map<String, dynamic>> Sliderdata = [
    {'text': 'Embrace Cinematic Anytime Anywhere', 'images': Appimages.slide1},
    {
      'text': 'Early Booking. Seamless Movie Experiences',
      'images': Appimages.slide2
    },
    {'text': 'Embrace Cinematic Anytime Anywhere', 'images': Appimages.slide3}
  ];
// =======================================
// -------------
  List<String> BottomsheetTitalName = [
    'Home',
    'Cinema',
    'PlaceOrder',
    'Myticket',
    'Account',
  ];
// =======================================
// -------------
  List<String> MyticketBtn = ["Movie", "Food ", "Event"];
// =======================================
// -------------
  List<Map<String, dynamic>> LanguageList = [
    {"title": "English (US)", "logo": Applanguage.englishUS},
    {"title": "English (Uk)", "logo": Applanguage.englishUk},
    {"title": "Spainsh", "logo": Applanguage.Spainsh},
    {"title": "Hindi", "logo": Applanguage.Hindi},
    {"title": "French", "logo": Applanguage.French},
    {"title": "Arabic", "logo": Applanguage.Arabic},
    {"title": "Russian", "logo": Applanguage.Russian},
    {"title": "Japaness", "logo": Applanguage.Japaness},
  ];
// =======================================
// -------------
  List<Map<String, dynamic>> PaymentList = [
    {"title": "Paypal", "logo": AppIcons.Paypal},
    {"title": "Google", "logo": AppIcons.google},
    {"title": "Apple", "logo": AppIcons.apple},
    {"title": "-----4445", "logo": AppIcons.wallet},
    {"title": "-----57666", "logo": AppIcons.visa}
  ];
// =======================================
// -------------
  List<String> Gender = <String>['Male', 'female', 'other'];
}
