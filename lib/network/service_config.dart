class ServisConfig {
  static final ServisConfig _servisConfig = ServisConfig._();

  factory ServisConfig() {
    return _servisConfig;
  }
  ServisConfig get instance => _servisConfig;
  ServisConfig._();

  static const String serverUrl = "https://63b7ea0d4d97e82aa3c91a75.mockapi.io/appointments";

  static const String serverUrl2 = "https://63b7ea0d4d97e82aa3c91a75.mockapi.io/appointments";
}