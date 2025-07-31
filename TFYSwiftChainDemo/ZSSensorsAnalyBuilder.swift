//
//  ZSSensorsAnalyBuilder.swift
//  ZSShortPlay
//
//  Created by admin on 2025/7/17.
//

import Foundation
import UIKit

// 事件埋点模型
struct ZSSensorsAnalyBuilder {
    // 启动相关
    var e_launch_type: String?      // 启动方式
    var e_launch_from: String?      // 启动来源
    var e_reel_id: String?          // 剧id
    var e_reel_name: String?        // 剧名
    var e_reel_episode: String?     // 剧集id
    var e_reel_episode_num: Int?    // 剧集序号
    var phone_system_language: String?  // 手机系统语言
    var e_is_permission: Bool?      // 是否开启push授权
    var e_is_realtime_permission: Bool? // 是否开启"实时活动"push授权
    
    // 弹窗相关
    var e_scene: String?            // 页面(场景)
    var e_popup_type: String?       // 弹窗类型
    var e_show_form: String?        // 展示形式
    var e_activity_id: String?      // 活动id
    var e_plan_id: String?          // 计划id
    var e_collection_id: String?    // 充值挽留模板id
    var e_push_permission_popup_style: String?  // push授权弹窗样式
    var e_popup_name: String?       // 弹窗名称
    var e_button_name: String?      // 按钮名称
    
    // 搜索相关
    var e_page_name: String?        // 页面名称
    var e_refer_page_name: String?  // 前向页面
    var e_key_word: String?         // 搜索词
    var e_key_word_type: String?    // 搜索词类型
    var e_have_result: Bool?        // 是否有搜索结果
    var e_result_num: Int?          // 搜索结果数量
    var e_is_recommend: Bool?       // 是否为推荐短剧
    var e_recommend_module: String? // 推荐模块名称
    var e_recommend_module_index: String?  // 推荐模块位置序号
    var e_index: String?            // 位置序号
    
    // 染色相关
    var e_attribution_type: String? // 染色方式
    var e_attribution_reel_id: String?  // 染色剧ID
    var e_attribution_reel_name: String?  // 染色剧名称
    var e_attribution_reel_episode: String?  // 染色剧集id
    var e_attribution_channel_name: String?  // 染色渠道名称
    var e_attribution_channel: String?  // 染色渠道
    var e_attribution_result: String?  // 染色结果
    var e_refer_attribution_reel_id: String?  // 染色前剧id
    var e_refer_attribution_channel_name: String?  // 染色前渠道名称
    var e_refer_attribution_channel: String?  // 染色前渠道
    
    // 页面导航相关
    var e_navigation_name: String?  // 导航页名称
    var e_tab_name: String?         // 按钮名称
    var e_navigation_position: String?  // 导航页位置
    var e_module_type: String?      // 栏目类型
    var e_module_id: String?        // 栏目ID
    var e_module_name: String?      // 栏目名称
    var e_module_position: String?  // 栏目的位置
    var e_banner_position: String?  // 资源位位置
    
    // 播放相关
    var e_play_page_name: String?   // 播放页面名称
    var e_first_refer_page_name: String?  // 首次播放来源
    var e_refer_navigation_id: String?  // 来源导航页ID
    var e_refer_navigation_name: String?  // 来源导航页名称
    var e_refer_navigation_position: String?  // 来源导航页位置
    var e_refer_module_name: String?  // 来源栏位名称
    var e_refer_module_position: String?  // 来源栏位的位置
    var e_refer_banner_position: String?  // 来源资源位位置
    var e_start_reel_id: String?    // 启动剧ID
    var e_is_attribution_reel: Bool?  // 是否染色剧
    var e_refer_reel_episode: String?  // 上一集集id
    var e_refer_reel_episode_num: Int?  // 上一集集序号
    var e_video_duration: Int?      // 当集视频时长
    var e_watch_time: Int?          // 当集观看时长
    var e_speed_duration: Double?   // 当前播放倍速
    var event_duration: Int?        // 实际观看时长
    var e_is_end_play: Bool?        // 当集是否播放完毕
    var e_is_followed: Bool?        // 是否已收藏
    var e_play_type: String?        // 播放类型
    var e_is_last_free_episode: Bool?  // 是否最后一集免费集
    var e_is_vip_episode: Bool?     // 是否付费集数
    var e_is_pay_point: Bool?       // 是否付费卡点
    var e_chapter_coins: Int?       // 所需喵币数量
    var e_VIP_level: String?        // 会员类型
    var e_quit_method: String?      // 结束方式
    var e_fail_reason: String?      // 失败原因
    var e_fail_reason_code: String? // 失败代码
    var e_consume_type: String?     // 消费类型
    
    // 卡顿相关
    var e_stutter_type: String?     // 卡顿类型
    var e_stutter_time: String?     // 播放卡顿时长
    
    // 充值相关
    var e_activity_name: String?    // 活动名称
    var e_gear_type: String?        // 档位类型
    var e_gear_id: String?          // 档位id
    var e_coin_amount: Int?         // 喵币数量
    var e_coin_award: Int?          // 赠送喵币数量
    var e_recharge_cycle_new: String?  // VIP会员周期（天/周/月/季/年）
    var e_gear_amount: Int?         // 档位金额
    var e_coin_id: String?          // 喵币模板id
    var e_member_id: String?        // 会员模板id
    var e_store_product_id: String? // 产品价格ID
    var e_is_default_new: Bool?     // 是否默认推荐档位
    var e_is_first_registration_recharge: Bool?  // 是否注册后首次充值
    var e_is_first_channel_recharge: Bool?  // 是否染色后首次充值
    var e_is_success: Bool?         // 是否成功
    var e_recharge_style: String?   // 充值样式
    var e_order_id_new: String?     // 订单id
    var e_recharge_type_new: String?  // 充值类型
    var e_initial_order_id_new: String?  // 签约时订单id
    var e_renew_order_id: String?   // 续费订单id
    var e_discount: Int?            // 实际支付金额
    var e_recharge_way_new: String? // 支付方式
    var e_product_id: String?       // 商品ID
    var e_contract_days: Int?       // 签约天数
    var e_contract_price: Int?      // 签约价格
    var e_recharge_days: Int?       // 续费周期（天数）
    var e_recharge_price: Int?      // 续费价格
    var e_recharge_count: String?   // 续费次数
    var e_pay_count: Int?           // 支付成功次数(事件发生前)
    var e_vip_count: Int?           // VIP充值次数(事件发生前)
    var e_temporary_vip_count: Int? // 一次性VIP充值次数(事件发生前)
    var e_vip_balance_before: Int?  // VIP剩余天数(事件发生前)
    var e_cancel_reason: String?    // 取消原因类型
    var e_cancel_survey: String?    // 取消原因（用户填写）
    
    // 广告相关
    var e_ad_scene: String?         // 广告场景
    var e_ad_source: String?        // 广告源
    var e_ad_type: String?          // 广告类型
    var e_ad_unit_name: String?     // 广告单元名称
    var e_ad_unit_id: String?       // 广告单元id
    var e_ad_estimated_income: String?  // 预估广告收入
    var e_ad_impression_result: Bool?  // 是否展示
    var e_ad_impression_reason: String?  // 失败原因
    
    // 任务相关
    var e_task_id: String?          // 任务id
    var e_task_name: String?        // 任务名称
    var e_curr_watch_times: Int?    // 广告当前观看次数
    var e_watch_times: Int?         // 广告可观看次数
    var e_position_rank: Int?       // 所在位置
    var e_bonus_num: Int?           // 奖励币数量
    var e_accumulative_days: Int?   // 累计打卡天数
    var e_consecutive_days: Int?    // 周期内打卡天数
    var e_receive_type: String?     // 领取类型
    var e_total_lottery_times: Int? // 累计抽奖次数
    var e_current_period_lottery_times: Int?  // 当前周期内抽奖次数
    var e_get_points: Int?          // 获取积分
    var e_redeem_cost_points: Int?  // 兑换商品消耗积分
    var e_redeem_product: String?   // 兑换商品
    var e_redeem_result: String?    // 兑换结果
    
    // 登录相关
    var e_login_type: String?       // 登陆类型
    var e_error_msg: String?        // 失败原因
    
    // 下载相关
    var e_download_complete: String?  // 下载完成
    
    // 落地页相关
    var e_source: String?           // 来源
    var e_landing_page_deploy: String?  // 落地页配置
    var e_cover_type: String?       // 剧封形式
    var e_channel_id: String?       // 渠道id
    var e_system: String?           // 系统
    var e_click_position: String?   // 点击位置
    var e_media: String?            // 媒体
    var e_ad_views: Int?            // 曝光次数
    var e_ad_clicks: Int?           // 点击次数
    
    // 启动页相关
    var e_expect_page_name: String?  // 预期页面名称
    var e_start_configuration_strategy: Bool?  // 是否符合启动页配置策略
    var e_is_first_start: Bool?     // 是否首次启动
    
    // 其他
    var e_operation_id: String?     // 智能运营id
    var e_push_id: String?          // pushID
    var e_realtime_push_id: String? // realtime_push ID
    var e_push_name: String?        // push标题
    var e_conver_way: String?       // 转播放方式
    var e_operate_type: String?     // 操作类型
    var e_current_position: Int?    // 拖拽开始位置
    var e_final_drag_position: Int? // 拖拽结束位置
    var e_drag_duration: Int?       // 拖拽时长
    var e_old_speed: String?        // 原倍速
    var e_new_speed: String?        // 新倍速
    var e_speed_start_type: String? // 倍速开始的方式
    var e_speed_start_position: Int?  // 倍速开始位置
    var e_request_link: String?     // 请求接口地址
    var e_restore_type: String?     // 触发补偿类型
    var e_restore_result: Bool?     // 恢复结果
    var e_is_missing_order: Bool?   // 是否漏单
    var e_opo_page_name: String?    // 操作页面名称
    var e_points_lottery_btn: String?  // 按钮名称
    var e_recharge_show_time: Int?  // 展示耗时
    /// 事件公参数
    var p_package_name:String?
    var p_app_version:String?
    var p_platform_type:String?     //andriod，iOS
    var p_language:String?          //用国际标准缩写：EN，KO，TC、JP等-服务端提供
    var p_attribution_reel_id:String?
    var p_attribution_reel_name:String?
    var p_attribution_channel_name:String?   //渠道名称
    var p_attribution_channel:String?        //渠道号
    var p_attribution_date:TimeInterval?
    var p_attribution_timestamp:TimeInterval?
    var p_attribution_social:String?          //媒体来源：facebook，google，tiktok，nature
    var p_attribution_days:NSNumber?
    var p_is_attribution_day:Bool?
    var p_is_register_day:Bool?
    var p_is_VIP:Bool?              //事件发生时用户是否在期会员
    var p_is_auto_renewal:String?   //是否自动续费；自动续费为true，否则为false,P0先不做
    var p_start_social:String?      //用户通过外部链接拉起app时上报；拉起渠道媒体
    var p_start_channel:String?     //拉起渠道号
    var p_start_channel_name:String?//拉起渠道名称
}

extension ZSSensorsAnalyBuilder {
    /// Struct链式容器
    var chain: TFYStructChain<ZSSensorsAnalyBuilder> { TFYStructChain(self) }
}
