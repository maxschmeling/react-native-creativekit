const { NativeModules } = require("react-native");

const { SnapchatCreativeManager } = NativeModules;

module.exports.share = SnapchatCreativeManager && SnapchatCreativeManager.share;

