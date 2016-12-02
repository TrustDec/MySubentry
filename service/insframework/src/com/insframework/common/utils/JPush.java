package com.insframework.common.utils;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.jpush.api.JPushClient;
import cn.jpush.api.common.resp.APIConnectionException;
import cn.jpush.api.common.resp.APIRequestException;
import cn.jpush.api.push.PushResult;
import cn.jpush.api.push.model.Message;
import cn.jpush.api.push.model.Options;
import cn.jpush.api.push.model.Platform;
import cn.jpush.api.push.model.PushPayload;
import cn.jpush.api.push.model.audience.Audience;
import cn.jpush.api.push.model.audience.AudienceTarget;
import cn.jpush.api.push.model.notification.AndroidNotification;
import cn.jpush.api.push.model.notification.IosNotification;
import cn.jpush.api.push.model.notification.Notification;

import com.insframework.common.utils.JsonUtil;

public class JPush {
	protected static final Logger LOG = LoggerFactory.getLogger(JPush.class);

	// demo App defined in resources/jpush-api.conf

	public static final String TITLE = "";
	public static final String ALERT = "";// 具体推送的消息是这个!
	public static final String MSG_CONTENT = "";
	public static final String REGISTRATION_ID = "0900e8d85ef";
	public static final String TAG = "tag_api";

	public static JPushClient jpushClient = null;

	@SuppressWarnings({ "deprecation", "unchecked" })
	public static Map<String, Object> SendPush(String appKey,
			String masterSecret, String content, String title,
			Map<String, String> map) {

		jpushClient = new JPushClient(masterSecret, appKey, 3);

		PushPayload payload = buildPushObject_android_tag_alertWithTitle(
				content, title, map);
		PushResult result = null;
		try {
			result = jpushClient.sendPush(payload);
		} catch (APIConnectionException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (APIRequestException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return JsonUtil.toObject(result.toString(), Map.class);
	}

	public static PushPayload buildPushObject_all_all_alert() {
		return PushPayload.alertAll(ALERT);
	}

	public static PushPayload buildPushObject_all_alias_alert(String content) {
		return PushPayload.newBuilder().setPlatform(Platform.all())// 设置接受的平台
				.setAudience(Audience.all())// Audience设置为all，说明采用广播方式推送，所有用户都可以接收到
				.setNotification(Notification.alert(content)).build();
	}

	public static PushPayload buildPushObject_android_tag_alertWithTitle(
			String comment, String title, Map<String, String> map) {
		return PushPayload.newBuilder().setPlatform(Platform.android())
				.setAudience(Audience.all())
				.setNotification(Notification.android(comment, title, map))
				.build();
	}

	public static PushPayload buildPushObject_android_and_ios() {
		return PushPayload
				.newBuilder()
				.setPlatform(Platform.android_ios())
				.setAudience(Audience.tag("tag1"))
				.setNotification(
						Notification
								.newBuilder()
								.setAlert("alert content")
								.addPlatformNotification(
										AndroidNotification.newBuilder()
												.setTitle("Android Title")
												.build())
								.addPlatformNotification(
										IosNotification
												.newBuilder()
												.incrBadge(1)
												.addExtra("extra_key",
														"extra_value").build())
								.build()).build();
	}

	public static PushPayload buildPushObject_ios_tagAnd_alertWithExtrasAndMessage() {
		return PushPayload
				.newBuilder()
				.setPlatform(Platform.ios())
				.setAudience(Audience.tag_and("tag1", "tag_all"))
				.setNotification(
						Notification
								.newBuilder()
								.addPlatformNotification(
										IosNotification.newBuilder()
												.setAlert(ALERT).setBadge(5)
												.setSound("happy")
												.addExtra("from", "JPush")
												.build()).build())
				.setMessage(Message.content(MSG_CONTENT))
				.setOptions(
						Options.newBuilder().setApnsProduction(true).build())
				.build();
	}

	public static PushPayload buildPushObject_ios_audienceMore_messageWithExtras() {
		return PushPayload
				.newBuilder()
				.setPlatform(Platform.android_ios())
				.setAudience(
						Audience.newBuilder()
								.addAudienceTarget(
										AudienceTarget.tag("tag1", "tag2"))
								.addAudienceTarget(
										AudienceTarget
												.alias("alias1", "alias2"))
								.build())
				.setMessage(
						Message.newBuilder().setMsgContent(MSG_CONTENT)
								.addExtra("from", "JPush").build()).build();
	}
}