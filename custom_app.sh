#!/bin/bash

apkBaseName=$1
tempSmaliDir=$2

if [ "$apkBaseName" = "Settings" ];then
    echo ">>>> in custom_app for $apkBaseName to add stocksettings"
    sed -i '42i\        <dashboard-tile android:icon="@drawable/ic_settings_more" android:id="@id/manufacturer_settings">\
	                        <intent android:action="com.android.settings.ADDITIONAL_APPLICATION_SETTING" />\
                        </dashboard-tile>' $tempSmaliDir/res/xml/dashboard_categories.xml
fi
