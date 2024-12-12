import 'package:flutter/material.dart';
import 'package:thriftflow/Global/app_color.dart';

class WalletUtils {
  static const int WALLET_BASE = 1;
  static const int WALLET_CREDIT_CARD = 2;
  static const int WALLET_SAVE = 3;

  static String getIconWalletByType(int type) {
    final Map<int, String> icon = {
      1: "assets/icons/wallet-base.svg",
      2: "assets/icons/wallet-credit-card.svg",
      3: "assets/icons/wallet-save.svg",
    };
    return icon[type] ?? "assets/icons/wallet-base.svg";
  }

  static String getIconAddWalletByType(int type) {
    final Map<int, String> icon = {
      1: "assets/icons/wallet-base-add.svg",
      2: "assets/icons/wallet-credit-card-add.svg",
      3: "assets/icons/wallet-save-add.svg",
    };
    return icon[type] ?? "assets/icons/wallet-base-add.svg";
  }

  static Color getColorWalletByType(int type) {
    final Map<int, Color> color = {
      1: AppColor.walletBase,
      2: AppColor.walletCreditCard,
      3: AppColor.walletSave,
    };
    return color[type] ?? AppColor.walletBase;
  }

  static Color getColorBoldWalletByType(int type) {
    final Map<int, Color> color = {
      1: AppColor.walletBaseBold,
      2: AppColor.walletCreditCardBold,
      3: AppColor.walletSaveBold,
    };
    return color[type] ?? AppColor.walletBaseBold;
  }
}