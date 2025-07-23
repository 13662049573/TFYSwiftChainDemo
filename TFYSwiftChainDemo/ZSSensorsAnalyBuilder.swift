//
//  ZSSensorsAnalyBuilder.swift
//  ZSShortPlay
//
//  Created by admin on 2025/7/17.
//

import Foundation
import UIKit

struct ZSSensorsAnalyBuilder {
    // MARK: - 公共属性

    var userId: String?
    var eventTime: Date?
    var packageName: String?
    var appVersion: String?
    var platformType: String?
    var language: String?
    var attributionReelId: String?
    var attributionReelName: String?
    var attributionChannelName: String?
    var attributionChannel: String?
    var attributionDate: Date?
    var attributionTimestamp: Int64?
    var attributionSocial: String?
    var attributionDays: Int?
    var isAttributionDay: Bool?
    var isRegisterDay: Bool?
    var isVIP: Bool?
    var isAutoRenewal: Bool?
    var startSocial: String?
    var startChannel: String?
    var startChannelName: String?

    // MARK: - 应用启动事件

    var launchType: String?
    var launchFrom: String?
    var reelId: String?
    var reelName: String?
    var reelEpisode: String?
    var reelEpisodeNum: Int?
    var phoneSystemLanguage: String?
    var isPermission: Bool?
    var isRealtimePermission: Bool?

    // MARK: - 弹窗相关

    var scene: String?
    var popupType: String?
    var showForm: String?
    var activityId: String?
    var planId: String?
    var collectionId: String?
    var pushPermissionPopupStyle: String?
    var popupName: String?
    var buttonName: String?

    // MARK: - 搜索相关

    var pageName: String?
    var referPageName: String?
    var keyWord: String?
    var keyWordType: String?
    var haveResult: Bool?
    var resultNum: Int?
    var isRecommend: Bool?
    var recommendModule: String?
    var recommendModuleIndex: String?
    var index: String?

    // MARK: - 染色相关

    var attributionType: String?
    var attributionReelEpisode: String?
    var attributionResult: String?
    var referAttributionReelId: String?
    var referAttributionChannelName: String?
    var referAttributionChannel: String?

    // MARK: - 页面操作

    var navigationName: String?
    var navigationPosition: String?
    var tabName: String?
    var operationId: String?
    var pushId: String?
    var realtimePushId: String?
    var pushName: String?
    var referNavigationPosition: String?
    var referNavigationName: String?
    var memberId: String?

    // MARK: - Banner相关

    var moduleType: String?
    var moduleId: String?
    var moduleName: String?
    var modulePosition: String?
    var bannerPosition: String?

    // MARK: - 剧集播放

    var playPageName: String?
    var firstReferPageName: String?
    var referModuleName: String?
    var referModulePosition: String?
    var referBannerPosition: String?
    var startReelId: String?
    var isAttributionReel: Bool?
    var referReelEpisode: String?
    var referReelEpisodeNum: Int?
    var videoDuration: Int?
    var watchTime: Int?
    var speedDuration: Double?
    var eventDuration: Int?
    var isEndPlay: Bool?
    var isFollowed: Bool?
    var playType: String?
    var isLastFreeEpisode: Bool?
    var isVipEpisode: Bool?
    var isPayPoint: Bool?
    var chapterCoins: Int?
    var vipLevel: String?
    var quitMethod: String?
    var failReason: String?
    var failReasonCode: String?
    var consumeType: String?
    var stutterType: String?
    var operateType: String?
    var currentPosition: Int?
    var finalDragPosition: Int?
    var dragDuration: Int?
    var oldSpeed: String?
    var newSpeed: String?
    var speedStartType: String?
    var speedStartPosition: Int?

    // MARK: - 充值相关

    var activityName: String?
    var collectionName: String?
    var coinId: String?
    var rechargeShowTime: Int?
    var isRechargeShowTest: Bool?
    var rechargeStyle: String?
    var gearType: String?
    var gearId: String?
    var coinAmount: Int?
    var coinAward: Int?
    var rechargeCycleNew: String?
    var gearAmount: Int?
    var storeProductId: String?
    var orderIdNew: String?
    var rechargeTypeNew: String?
    var initialOrderIdNew: String?
    var renewOrderId: String?
    var discount: Int?
    var rechargeWayNew: String?
    var productId: String?
    var contractDays: Int?
    var contractPrice: Int?
    var rechargeDays: Int?
    var rechargePrice: Int?
    var rechargeCount: String?
    var payCount: Int?
    var vipCount: Int?
    var temporaryVipCount: Int?
    var isDefaultNew: Bool?
    var isFirstRegistrationRecharge: Bool?
    var isFirstChannelRecharge: Bool?
    var isSuccess: Bool?
    var restoreType: String?
    var restoreResult: Bool?
    var isMissingOrder: Bool?
    var cancelReason: String?
    var cancelSurvey: String?
    var vipBalanceBefore: Int?

    // MARK: - 广告相关

    var adScene: String?
    var adSource: String?
    var adType: String?
    var adUnitName: String?
    var adUnitId: String?
    var adEstimatedIncome: Double?
    var adImpressionResult: Bool?
    var adImpressionReason: String?

    // MARK: - 任务相关

    var taskId: String?
    var taskName: String?
    var currWatchTimes: Int?
    var watchTimes: Int?
    var positionRank: Int?
    var bonusNum: Int?
    var accumulativeDays: Int?
    var consecutiveDays: Int?
    var receiveType: String?
    var pointsLotteryBtn: String?
    var totalLotteryTimes: Int?
    var currentPeriodLotteryTimes: Int?
    var getPoints: Int?
    var redeemCostPoints: Int?
    var redeemProduct: String?
    var redeemResult: String?

    // MARK: - 登录相关

    var loginType: String?
    var errorMsg: String?

    // MARK: - 下载相关

    var downloadComplete: Bool?

    // MARK: - 落地页相关

    var source: String?
    var coverType: String?
    var channelId: String?
    var system: String?
    var clickPosition: String?
    var media: String?
    var adViews: Int?
    var adClicks: Int?

    // MARK: - 启动页相关

    var expectPageName: String?
    var startConfigurationStrategy: Bool?
    var isFirstStart: Bool?
}

extension ZSSensorsAnalyBuilder {
    /// Struct链式容器
    var chain: TFYStructChain<ZSSensorsAnalyBuilder> { TFYStructChain(self) }
}
