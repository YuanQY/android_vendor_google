#!/sbin/sh
# 
# /system/addon.d/70-gapps.sh
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF
app/ChromeBookmarksSyncAdapter.apk
app/GoogleCalendarSyncAdapter.apk
app/GoogleContactsSyncAdapter.apk
priv-app/ConfigUpdater.apk
priv-app/GoogleFeedback.apk
priv-app/GooglePartnerSetup.apk
priv-app/Phonesky.apk
priv-app/GmsCore.apk
priv-app/GoogleLoginService.apk
priv-app/GoogleServicesFramework.apk
priv-app/SetupWizard.apk
priv-app/GoogleBackupTransport.apk
priv-app/GoogleOneTimeInitializer.apk
priv-app/NetworkLocation.apk
priv-app/VoiceSearchStub.apk

etc/permissions/com.google.android.maps.xml
etc/permissions/com.google.android.media.effects.xml
etc/permissions/com.google.widevine.software.drm.xml
etc/permissions/features.xml
etc/preferred-apps/google.xml
etc/g.prop
framework/com.google.android.maps.jar
framework/com.google.android.media.effects.jar
framework/com.google.widevine.software.drm.jar
lib/libAppDataSearch.so

EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
