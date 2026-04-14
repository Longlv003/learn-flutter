// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get loadingApp => 'Đang tải ứng dụng ...';

  @override
  String get welcomeMessage => 'Chào mừng';

  @override
  String get loginAccount => 'Đăng nhập vào tài khoản của bạn';

  @override
  String get login => 'Đăng nhập';

  @override
  String get forgotPassword => 'Quên mật khẩu';

  @override
  String get register => 'Đăng ký';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Mật khẩu';

  @override
  String get confirmPasswordLabel => 'Xác nhận mật khẩu';

  @override
  String get enterEmailHint => 'Nhập email';

  @override
  String get enterPasswordHint => 'Nhập mật khẩu';

  @override
  String get enterConfirmPasswordHint => 'Nhập lại mật khẩu';

  @override
  String get dontHaveAccount => 'Bạn chưa có tài khoản?';

  @override
  String get alreadyHaveAccount => 'Bạn đã có tài khoản?';

  @override
  String get loginSuccess => 'Đăng nhập thành công';

  @override
  String get loginFailed => 'Đăng nhập thất bại';

  @override
  String get registerSuccess => 'Đăng ký thành công';

  @override
  String get registerFailed => 'Đăng ký thất bại';

  @override
  String get requiredField => 'Trường này là bắt buộc';

  @override
  String get invalidEmail => 'Email không hợp lệ';

  @override
  String get passwordTooShort => 'Mật khẩu quá ngắn';

  @override
  String get cancelText => 'Hủy';

  @override
  String get confirmText => 'Xác nhận';

  @override
  String get deleteText => 'Xóa';

  @override
  String get deleteProductTitle => 'Xóa sản phẩm';

  @override
  String get deleteProductConfirmMessage =>
      'Bạn có chắc chắn muốn xóa sản phẩm này không?';

  @override
  String get deletedProductSuccess => 'Đã xóa sản phẩm thành công';

  @override
  String get addProduct => 'Thêm sản phẩm';

  @override
  String get editProduct => 'Chỉnh sửa sản phẩm';

  @override
  String get productDetail => 'Chi tiết sản phẩm';

  @override
  String get confirmAdd => 'Xác nhận thêm';

  @override
  String get confirmUpdate => 'Xác nhận cập nhật';

  @override
  String get confirmAddProductMessage => 'Bạn có chắc muốn thêm sản phẩm này?';

  @override
  String get confirmUpdateProductMessage =>
      'Bạn có chắc muốn cập nhật sản phẩm này?';

  @override
  String get add => 'Thêm';

  @override
  String get update => 'Cập nhật';

  @override
  String get name => 'Tên';

  @override
  String get price => 'Giá';

  @override
  String get quantity => 'Số lượng';

  @override
  String get imageUrl => 'Đường dẫn ảnh';

  @override
  String get description => 'Mô tả';

  @override
  String get category => 'Thể loại';
}
