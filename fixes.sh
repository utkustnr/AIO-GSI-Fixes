#!/sbin/sh

    #./plat_hwservice_contexts:android.hardware.drm::ICryptoFactory                            u:object_r:hal_drm_hwservice:s0
    #./plat_hwservice_contexts:android.hardware.drm::IDrmFactory                               u:object_r:hal_drm_hwservice:s0
    #android.hardware.drm@1.0::IDrmFactory/widevine
    
    # DRM
    chown root:shell /vendor/bin/hw/android.hardware.drm@1.1-service.widevine
    chmod 755 /vendor/bin/hw/android.hardware.drm@1.1-service.widevine
    chcon u:object_r:hal_drm_widevine_exec:s0 /vendor/bin/hw/android.hardware.drm@1.1-service.widevine
    
    # PROPS
    # Enable wireless display (Cast/Miracast)
	echo -e '\n' >>  /system_root/system/build.prop
    grep -qxF 'persist.debug.wfd.enable' /system_root/system/build.prop || echo "persist.debug.wfd.enable=1" >>  /system_root/system/build.prop
    
    # Audio
    grep -qxF 'audio.deep_buffer.media' /system_root/system/build.prop || echo "audio.deep_buffer.media=true" >>  /system_root/system/build.prop
    #grep -qxF 'ro.config.media_vol_steps' /system_root/system/build.prop || echo "ro.config.media_vol_steps=25" >>  /system_root/system/build.prop
    #grep -qxF 'ro.config.vc_call_vol_steps' /system_root/system/build.prop || echo "ro.config.vc_call_vol_steps=7" >>  /system_root/system/build.prop
    # ^ these two seems to be changed from a11 -> a13, so commenting them out for now
	
    # Display
    grep -qxF 'ro.surface_flinger.running_without_sync_framework' /system_root/system/build.prop || echo "ro.surface_flinger.running_without_sync_framework=true" >>  /system_root/system/build.prop
    
    # Graphics
    #grep -qxF 'debug.egl.hw' /system_root/system/build.prop || echo "debug.egl.hw=1" >>  /system_root/system/build.prop
    grep -qxF 'debug.egl.profiler' /system_root/system/build.prop || echo "debug.egl.profiler=1" >>  /system_root/system/build.prop
    grep -qxF 'debug.hwui.use_buffer_age' /system_root/system/build.prop || echo "debug.hwui.use_buffer_age=false" >>  /system_root/system/build.prop
    grep -qxF 'debug.performance.tuning' /system_root/system/build.prop || echo "debug.performance.tuning=1" >>  /system_root/system/build.prop
    grep -qxF 'debug.sf.enable_hwc_vds' /system_root/system/build.prop || echo "debug.sf.enable_hwc_vds=0" >>  /system_root/system/build.prop
    #grep -qxF 'debug.sf.hw' /system_root/system/build.prop || echo "debug.sf.hw=1" >>  /system_root/system/build.prop
    grep -qxF 'hwui.disable_vsync' /system_root/system/build.prop || echo "hwui.disable_vsync=true" >>  /system_root/system/build.prop
    grep -qxF 'ro.config.enable.hw_accel' /system_root/system/build.prop || echo "ro.config.enable.hw_accel=true" >>  /system_root/system/build.prop
    grep -qxF 'video.accelerate.hw' /system_root/system/build.prop || echo "video.accelerate.hw=1" >>  /system_root/system/build.prop
    grep -qxF 'debug.sf.latch_unsignaled' /system_root/system/build.prop || echo "debug.sf.latch_unsignaled=1" >>  /system_root/system/build.prop
    grep -qxF 'ro.surface_flinger.max_frame_buffer_acquired_buffers' /system_root/system/build.prop || echo "ro.surface_flinger.max_frame_buffer_acquired_buffers=3" >> /system_root/system/build.prop
    #grep -qxF 'debug.cpurend.vsync' /system_root/system/build.prop || echo "debug.cpurend.vsync=false" >> /system_root/system/build.prop
    grep -qxF 'ro.hardware.egl' /system_root/system/build.prop || echo "ro.hardware.egl=mali" >> /system_root/system/build.prop
    grep -qxF 'ro.hardware.vulkan' /system_root/system/build.prop || echo "ro.hardware.vulkan=mali" >> /system_root/system/build.prop
    
    # CPU
    grep -qxF 'persist.sys.boost.byeachfling' /system_root/system/build.prop || echo "persist.sys.boost.byeachfling=true" >> /system_root/system/build.prop
    grep -qxF 'persist.sys.boost.skipframe' /system_root/system/build.prop || echo "persist.sys.boost.skipframe=3" >> /system_root/system/build.prop
    grep -qxF 'persist.sys.boost.durationms' /system_root/system/build.prop || echo "persist.sys.boost.durationms=1000" >> /system_root/system/build.prop  
    grep -qxF 'persist.sys.cpuset.enable' /system_root/system/build.prop || echo "persist.sys.cpuset.enable=1" >> /system_root/system/build.prop
    grep -qxF 'persist.sys.performance' /system_root/system/build.prop || echo "persist.sys.performance=true" >> /system_root/system/build.prop
    
    # Usb
    grep -qxF 'persist.sys.usb.config' /system_root/system/build.prop || echo "persist.sys.usb.config=hisuite,mtp,mass_storage" >> /system_root/system/build.prop
    grep -qxF 'sys.usb.config' /system_root/system/build.prop || echo "sys.usb.config=mtp" >> /system_root/system/build.prop
    grep -qxF 'sys.usb.configfs' /system_root/system/build.prop || echo "sys.usb.configfs=1" >> /system_root/system/build.prop
    grep -qxF 'sys.usb.controller' /system_root/system/build.prop || echo "sys.usb.controller=hisi-usb-otg" >> /system_root/system/build.prop
    grep -qxF 'sys.usb.ffs.aio_compat' /system_root/system/build.prop || echo "sys.usb.ffs.aio_compat=true" >> /system_root/system/build.prop
    grep -qxF 'persist.sys.usb.config' /system_root/system/build.prop || echo "sys.usb.ffs.ready=0" >> /system_root/system/build.prop
    grep -qxF 'sys.usb.ffs.ready' /system_root/system/build.prop || echo "sys.usb.ffs_hdb.ready=0" >> /system_root/system/build.prop
    grep -qxF 'sys.usb.state' /system_root/system/build.prop || echo "sys.usb.state=mtp,adb" >> /system_root/system/build.prop
    
    # Offline Charging
    chown root:2000 /system_root/system/bin/offlinecharger
    chcon u:object_r:charger_exec:s0 /system_root/system/bin/offlinecharger
    chmod 755 /system_root/system/bin/offlinecharger
    
	sed  '13iimport /vendor/etc/init/${ro.bootmode}/init.${ro.bootmode}.rc' /system_root/system/etc/init/hw/init.rc > /cache/tempsed && cat /cache/tempsed > /system_root/system/etc/init/hw/init.rc && rm -f /cache/tempsed
	sed  's+service charger /bin/charger+service charger /bin/offlinecharger -p+g' /system_root/system/etc/init/hw/init.rc > /cache/tempsed && cat /cache/tempsed > /system_root/system/etc/init/hw/init.rc && rm -f /cache/tempsed
	sed  's+user system+user root+g' /system_root/system/etc/init/hw/init.rc > /cache/tempsed && cat /cache/tempsed > /system_root/system/etc/init/hw/init.rc && rm -f /cache/tempsed
	sed  's+group system shell graphics input wakelock+group root system shell graphics input wakelock+g' /system_root/system/etc/init/hw/init.rc > /cache/tempsed && cat /cache/tempsed > /system_root/system/etc/init/hw/init.rc && rm -f /cache/tempsed
    
    # NFC
    chcon u:object_r:system_file:s0 /system_root/system/etc/libnfc-brcm.conf
    chcon u:object_r:system_file:s0 /system_root/system/etc/libnfc-nci.conf
    chcon u:object_r:system_file:s0 /system_root/system/etc/libnfc-nxp.conf
    chcon u:object_r:system_file:s0 /system_root/system/etc/libnfc-nxp_RF.conf
    chcon u:object_r:system_file:s0 /system_root/system/product/etc/libnfc-brcm.conf
    chcon u:object_r:system_file:s0 /system_root/system/product/etc/libnfc-nci.conf
    chcon u:object_r:system_file:s0 /system_root/system/product/etc/libnfc-nxp.conf
    chcon u:object_r:system_file:s0 /system_root/system/product/etc/libnfc-nxp_RF.conf
    chcon u:object_r:system_file:s0 /system_root/system/etc/permissions/android.hardware.nfc.hce.xml
    chcon u:object_r:system_file:s0 /system_root/system/etc/permissions/android.hardware.nfc.hcef.xml
    chcon u:object_r:system_file:s0 /system_root/system/etc/permissions/android.hardware.nfc.xml
    chcon u:object_r:system_file:s0 /system_root/system/etc/permissions/com.android.nfc_extras.xml
    chcon u:object_r:system_file:s0 /system_root/system/product/etc/permissions/android.hardware.nfc.hce.xml 
    chcon u:object_r:system_file:s0 /system_root/system/product/etc/permissions/android.hardware.nfc.hcef.xml
    chcon u:object_r:system_file:s0 /system_root/system/product/etc/permissions/android.hardware.nfc.xml
    chcon u:object_r:system_file:s0 /system_root/system/product/etc/permissions/com.android.nfc_extras.xml
    
    # Remove Overlays
    rm -rf /system_root/system/product/overlay/treble-overlay-infinix-*
    rm -rf /system_root/system/product/overlay/treble-overlay-lenovo-*
    rm -rf /system_root/system/product/overlay/treble-overlay-lge-*
    rm -rf /system_root/system/product/overlay/treble-overlay-asus-*
    rm -rf /system_root/system/product/overlay/treble-overlay-xiaomi-*
    rm -rf /system_root/system/product/overlay/treble-overlay-samsung-*
    rm -rf /system_root/system/product/overlay/treble-overlay-sony-*    
    rm -rf /system_root/system/product/overlay/treble-overlay-tecno-*
    rm -rf /system_root/system/product/overlay/treble-overlay-realme-*
    rm -rf /system_root/system/product/overlay/treble-overlay-oppo-*
    rm -rf /system_root/system/product/overlay/treble-overlay-nokia-*
    rm -rf /system_root/system/product/overlay/treble-overlay-oneplus-* 
    rm -rf /system_root/system/product/overlay/treble-overlay-nubia-*       
    rm -rf /system_root/system/product/overlay/treble-overlay-moto-*    
    rm -rf /system_root/system/product/overlay/treble-overlay-lg-*
    rm -rf /system_root/system/product/overlay/treble-overlay-htc-*
    rm -rf /system_root/system/product/overlay/treble-overlay-blackview-*
    rm -rf /system_root/system/product/overlay/treble-overlay-vivo-*
    rm -rf /system_root/system/product/overlay/treble-overlay-vsmart-*
    rm -rf /system_root/system/product/overlay/treble-overlay-razer-*
    rm -rf /system_root/system/product/overlay/treble-overlay-sharp-*
    
    exit 0;
