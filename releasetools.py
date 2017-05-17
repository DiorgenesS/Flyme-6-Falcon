import common
import edify_generator


def ModifyBegin(edify):
    for i in xrange(len(edify.script)):
        if 'ui_print("Target:' in edify.script[i] and "user/test-keys" in edify.script[i]:
            edify.script[i] = '''assert(getprop("ro.product.device") == "xt1031" || getprop("ro.build.product") == "xt1031" || getprop("ro.product.device") == "xt1032" || getprop("ro.build.product") == "xt1032" || getprop("ro.product.device") == "xt1033" || getprop("ro.build.product") == "xt1033" || getprop("ro.product.device") == "xt1034" || getprop("ro.build.product") == "xt1034" || getprop("ro.product.device") == "falcon_umts" || getprop("ro.build.product") == "falcon_umts" || getprop("ro.product.device") == "falcon_umtsds" || getprop("ro.build.product") == "falcon_umtsds" || getprop("ro.product.device") == "falcon_cdma" || getprop("ro.build.product") == "falcon_cdma" || getprop("ro.product.device") == "falcon_retuaws" || getprop("ro.build.product") == "falcon_retuaws" || getprop("ro.product.device") == "falcon" || getprop("ro.build.product") == "falcon" || getprop("ro.product.device") == "falcon_gpe" || getprop("ro.build.product") == "falcon_gpe" || abort("This package is for device: xt1031,xt1032,xt1033,xt1034,falcon_umts,falcon_umtsds,falcon_cdma,falcon_retuaws,falcon,falcon_gpe; this device is " + getprop("ro.product.device") + "."););
assert(getprop("ro.bootloader") == "0x4118" || getprop("ro.bootloader") == "0x4119" || getprop("ro.bootloader") == "0x411A" || abort("This package supports bootloader(s): 0x4118, 0x4119, 0x411A; this device has bootloader " + getprop("ro.bootloader") + "."););
unmount("/system");
ui_print("===============================================");
ui_print("     Flyme 6 International for Moto G 2013     ");
ui_print("===============================================");
ui_print("            By Dio_S @XDADevelopers            ");
ui_print("===============================================");
ui_print("===============================================");
ui_print("DEVICE: Moto G - Falcon                        ");
ui_print("FLYME 6 VERSION:                               ");
ui_print("ANDROID VERSION: 6.0.1                         ");
ui_print("===============================================");'''


def ModifyCommand(edify):
    for i in xrange(len(edify.script)):
        if "package_extract_dir(" in edify.script[i] and "recovery" in edify.script[i]:
            edify.script[i] = 'ui_print("Installing system...");'


def AddPrompt(edify):
    for i in xrange(len(edify.script)):
        if "format(" in edify.script[i] and "by-name/system" in edify.script[i]:
            edify.script[i] = 'ui_print("Formating Partition...");\n' + edify.script[i]
        elif 'symlink("/data/misc/wifi/WCNSS_qcom_cfg.ini' in edify.script[i]:
            edify.script[i] = 'ui_print("Creating symlinks...");\n' + edify.script[i]
        elif 'set_metadata_recursive("/system"' in edify.script[i]:
            edify.script[i] = 'ui_print("Setting permissions...");\n' + edify.script[i]
        elif 'package_extract_file("boot' in edify.script[i]:
            edify.script[i] = 'ui_print("Flashing Kernel...");\n' + edify.script[i]


def CdmaConfig(info):
    info.script.AppendExtra(("""if getprop("ro.boot.radio") == "0x3" then
delete("/system/etc/apns-conf.xml");
symlink("/system/etc/apns-conf-cdma.xml", "/system/etc/apns-conf.xml");
endif;"""))



def FullOTA_InstallEnd(info):
    edify = info.script
    ModifyBegin(edify)
    ModifyCommand(edify)
    AddPrompt(edify)
    CdmaConfig(info)
