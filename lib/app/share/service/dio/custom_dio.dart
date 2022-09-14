export 'custom_dio_base.dart'
//dio for browser
    if (dart.library.js) 'custom_dio_browser.dart'
//dio for native
    if (dart.library.io) 'custom_dio_native.dart';
