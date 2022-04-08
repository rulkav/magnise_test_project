import 'package:magnise_test_project/base_rest_service.dart';
import 'package:magnise_test_project/constant/app_url_request.dart';
import 'package:magnise_test_project/models/crypto_model.dart';

class CryptoProvider {
  final BaseRestService _api = BaseRestService();

  getCurrentCurrencyRate(
      {Function()? beforeSend,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      String? pair}) {
    _api.get(
      url: '${AppUrlRequestKeys.exchange}$pair',
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!(data.data);
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  getHistoryCurrencyRate(
      {Function()? beforeSend,
      Function(dynamic data)? onSuccess,
      Function(dynamic error)? onError,
      String? pair}) {
    _api.get(
      url:
          '${AppUrlRequestKeys.exchange}$pair${AppUrlRequestKeys.historyPeriod}',
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!(data.data);
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
