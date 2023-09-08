part of open_earable_flutter;

class RgbLed {
  final BleManager _bleManager;

  RgbLed({required BleManager bleManager}) : _bleManager = bleManager;

  void setLEDstate(int state) async {
    ByteData data = ByteData(1);
    data.setUint8(0, state);
    _bleManager.write(
        serviceId: LEDServiceUuid,
        characteristicId: LEDSetStateCharacteristic,
        value: data.buffer.asInt8List());
  }
}