import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  static const _credentials = r'''{
  "type": "service_account",
  "project_id": "expense-tracker-340623",
  "private_key_id": "7fd6ef0f623882e069ee487a7ef750e5247376a6",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDukPp5XRBhg1/S\nfyWlWcwm2mG0I7V3ak9yS6puA4YmhB1RLoxEhSZoiOE636SSJzIovZOp/Zf2RjBW\ngOiex6Rf1WtUtuDZ8wYCYc55IElC2XYe2Z34MuI1ZkFRtfXH0WxnsLwxU6GBIfxN\nsKVPDXlhuPcevEIFKsAawKhh0uqGysTH17ApWWQ2rOUVaFmhJPhDFTfuQ5JzU+sx\nUmxhYvmiVF10bV6gw+ILSXUJNLWnZVjq44suj3xFZtVd8K1bgYg8eJB9M/Dxs5IQ\nkoT1ymHq+WOBCe2KKDF5wOlJD9Uxw0NEeELQ+Qfhu1DbTcLzgJJwDbktroS0oRGm\n/utZZ4WXAgMBAAECggEAHWE/Z4jdhpTOTTcZZMatTK+iTrQDGiS+if3ljEzkzYOB\ntMi9v4aCV2dcDYsTUmh/VeMa91liyJKWS2DuxPcjOCYpZLJs+IpkWBDBg8tFGnV7\nhYsZWEKz9w2Tx8NX9HbHGfH7CzwYbLXJw6uYgCbRpwZHcMKQguBj7ieB1SJLfbPo\nKZ6x6WXrjBF1J4GGZPYOOBILODrvajb6/uD7QGSNxoRct3v4+T8NpBvsHUKLGpDA\ndBrefHlii7lO42pFZ/GL+JnV37a7f8btvqs/RI4yxylJZCINS34JOFSXBIPSdvA1\nLbM5ZZsTVgMwTei1S/8bNeFtqTVXPOek78lF+sVMSQKBgQD98rE442NVPRhI8Ozf\nlOXS7uKDHH7Ok/Pgq4kt24c4UVnxbp2nWbIeNN+4APWnSPYjEGTMHQynzKwejnNj\ndsdTuNtlxg4gWnG+7qPx1tb742N3+f2hQXR/1ErlxT2rtUW30XLfODEv0AFgf5Cl\nlf+/inBuUpmHgI+9+D3QEBFZ/QKBgQDwfnfWthdleL1kkqad+C+xdQzTQq56cIGn\n8itAELJLMcNJrSsE2qebU+/ebQ79tpWvLml56UOthJCizg6YxUOcxKSbC3/rmU4l\njMqz/M6QE7M13MTi1Z3hd1krqs7dLd7ilTuHigxbmmJ7H6na5IQdsIdz8VkrcPBw\nmKPOXiKYIwKBgQDKV6UkOfJ9CYgfHnDvGVoiPxuW8o6LlVHd83ADbQcKNa/f8o6F\nuK926BRWLdWOrFEK0VYvWPorfaarVj/UweDC8elG54978fTt+IIDAXcdDyrDfxq7\ncUcdT486E3Y3KeHaPHY2LDTs7uUZ+arMdX9pJCq/jOsuD5749CJ0dUkOFQKBgQCo\ndq7TxPJWrmFdFi2I8tXV5Tx6sHcwZactUkJhulBqxA0ciyVbXR+TexTIJnUd3My1\nzjksoO47mmUG5njrIyPdqRH1WfTdwKIxQ5KqyiiYXHRpAqEYlLLnwYbBRAFshjlf\nV1I/+7/0Ww0pWmDNaM3zTjlUSnhAKfkDpqj4YpCxKQKBgQCJH2LphDJfXQZs7sjk\nk/NW57LWX9GvuSNGcAlSeHmkKakiY3PoJO99mGHdg9lKJG3a2mFlezq0S5LY38Xv\nldRa06HfZZtfNcKcp6lt+h55N40yEWotrQAymMxZikQeZlLQrrZXcod16ClWA0pi\nVOB7IcgabFQoFdQPMGUbh3Qwtw==\n-----END PRIVATE KEY-----\n",
  "client_email": "expense-tracker@expense-tracker-340623.iam.gserviceaccount.com",
  "client_id": "103023575712122314786",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/expense-tracker%40expense-tracker-340623.iam.gserviceaccount.com"
}
''';

  static final _spreadSheetId = '1_e6GXXDe8WfX4vwvigp8nJ-AVL-fqUwAqyKbqJWFkns';
  static final _gSheets = GSheets(_credentials);
  static Worksheet? _worksheet;

  Future init() async {
    final spreadSheet = await _gSheets.spreadsheet(_spreadSheetId);
    _worksheet = spreadSheet.worksheetByTitle('Worksheet1');
  }
}
