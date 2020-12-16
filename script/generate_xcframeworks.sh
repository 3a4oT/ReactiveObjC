#/bin/sh

FRAMEWORK_NAME="ReactiveObjC"

IOS_SCHEME="${FRAMEWORK_NAME}-iOS"
CATALYST_NAME="${FRAMEWORK_NAME}-macCatalyst"
IOS_SIMULATOR_NAME="${FRAMEWORK_NAME}-iOS-Simulator"

WATCH_OS_SCHEME="${FRAMEWORK_NAME}-watchOS"
WATCH_OS_SIMULATOR="${FRAMEWORK_NAME}-watchOS-Simulator"

MAC_OS_SCHEME="${FRAMEWORK_NAME}-macOS"

TV_OS_SCHEME="${FRAMEWORK_NAME}-tvOS"
TV_OS_SIMULATOR="${FRAMEWORK_NAME}-tvOS-Simulator"

HERE=$(pwd)

rm -r "${FRAMEWORK_NAME}.xcframework"

# iOS
xcodebuild archive \
-workspace "${FRAMEWORK_NAME}.xcworkspace" \
-scheme "${IOS_SCHEME}" \
-destination "generic/platform=iOS" \
-archivePath "${HERE}/archives/${IOS_SCHEME}" \
-configuration "Release" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Catalyst
xcodebuild archive \
-workspace "${FRAMEWORK_NAME}.xcworkspace" \
-scheme "${IOS_SCHEME}" \
-destination "generic/platform=macOS,variant=Mac Catalyst" \
-archivePath "${HERE}/archives/${CATALYST_NAME}" \
-configuration "Release" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# iOS Simulator
xcodebuild archive \
-workspace "${FRAMEWORK_NAME}.xcworkspace" \
-scheme "${IOS_SCHEME}" \
-destination "generic/platform=iOS Simulator" \
-archivePath "${HERE}/archives/${IOS_SIMULATOR_NAME}" \
-configuration "Release" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# macOS
xcodebuild archive \
-workspace "${FRAMEWORK_NAME}.xcworkspace" \
-scheme "${MAC_OS_SCHEME}" \
-destination "generic/platform=macOS" \
-archivePath "${HERE}/archives/${MAC_OS_SCHEME}" \
-configuration "Release" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

#watch OS

xcodebuild archive \
-workspace "${FRAMEWORK_NAME}.xcworkspace" \
-scheme "${WATCH_OS_SCHEME}" \
-destination "generic/platform=watchOS" \
-archivePath "${HERE}/archives/${WATCH_OS_SCHEME}" \
-configuration "Release" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-workspace "${FRAMEWORK_NAME}.xcworkspace" \
-scheme "${WATCH_OS_SCHEME}" \
-destination "generic/platform=watchOS Simulator" \
-archivePath "${HERE}/archives/${WATCH_OS_SIMULATOR}" \
-configuration "Release" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

#tvOS
xcodebuild archive \
-workspace "${FRAMEWORK_NAME}.xcworkspace" \
-scheme "${TV_OS_SCHEME}" \
-destination "generic/platform=tvOS" \
-archivePath "${HERE}/archives/${TV_OS_SCHEME}" \
-configuration "Release" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive \
-workspace "${FRAMEWORK_NAME}.xcworkspace" \
-scheme "${TV_OS_SCHEME}" \
-destination "generic/platform=tvOS Simulator" \
-archivePath "${HERE}/archives/${TV_OS_SIMULATOR}" \
-configuration "Release" \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES

#XCFramework

xcodebuild -create-xcframework \
-framework "${HERE}/archives/${IOS_SCHEME}.xcarchive/Products/@rpath/${FRAMEWORK_NAME}.framework" \
-debug-symbols "${HERE}/archives/${IOS_SCHEME}.xcarchive/dSYMs/${FRAMEWORK_NAME}.framework.dSYM" \
-framework "${HERE}/archives/${CATALYST_NAME}.xcarchive/Products/@rpath/${FRAMEWORK_NAME}.framework" \
-debug-symbols "${HERE}/archives/${CATALYST_NAME}.xcarchive/dSYMs/${FRAMEWORK_NAME}.framework.dSYM" \
-framework "${HERE}/archives/${IOS_SIMULATOR_NAME}.xcarchive/Products/@rpath/${FRAMEWORK_NAME}.framework" \
-debug-symbols "${HERE}/archives/${IOS_SIMULATOR_NAME}.xcarchive/dSYMs/${FRAMEWORK_NAME}.framework.dSYM" \
-framework "${HERE}/archives/${MAC_OS_SCHEME}.xcarchive/Products/@rpath/${FRAMEWORK_NAME}.framework" \
-debug-symbols "${HERE}/archives/${MAC_OS_SCHEME}.xcarchive/dSYMs/${FRAMEWORK_NAME}.framework.dSYM" \
-framework "${HERE}/archives/${WATCH_OS_SCHEME}.xcarchive/Products/@rpath/${FRAMEWORK_NAME}.framework" \
-debug-symbols "${HERE}/archives/${WATCH_OS_SCHEME}.xcarchive/dSYMs/${FRAMEWORK_NAME}.framework.dSYM" \
-framework "${HERE}/archives/${WATCH_OS_SIMULATOR}.xcarchive/Products/@rpath/${FRAMEWORK_NAME}.framework" \
-debug-symbols "${HERE}/archives/${WATCH_OS_SIMULATOR}.xcarchive/dSYMs/${FRAMEWORK_NAME}.framework.dSYM" \
-framework "${HERE}/archives/${TV_OS_SCHEME}.xcarchive/Products/@rpath/${FRAMEWORK_NAME}.framework" \
-debug-symbols "${HERE}/archives/${TV_OS_SCHEME}.xcarchive/dSYMs/${FRAMEWORK_NAME}.framework.dSYM" \
-framework "${HERE}/archives/${TV_OS_SIMULATOR}.xcarchive/Products/@rpath/${FRAMEWORK_NAME}.framework" \
-debug-symbols "${HERE}/archives/${TV_OS_SIMULATOR}.xcarchive/dSYMs/${FRAMEWORK_NAME}.framework.dSYM" \
-output "${FRAMEWORK_NAME}.xcframework"
