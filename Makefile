BUILD 		:= xcodebuild

RM		:= rm -rf

PROJNAMEFLAGS 	+= -project DailyNews.xcodeproj

TARGETFLAGS	+= -target DailyNewsTests

SCHEMFLAGS	+= -scheme DailyNewsTests

CONFIGFLAGS	+= -configuration debug

ARCHFLAGS	+= -arch "armv7s"

SDKFLAGS	+= -sdk iphonesimulator

OPTIONSFLAGS	+= clean build 

all	 :
		$(RM) build/ test-reports/
		$(BUILD) $(PROJNAMEFLAGS) $(SCHEMEFLAGS) $(SDKFLAGS) $(CONFIGFLAGS) $(ARCHFLAGS) clean build 2>&1 | /usr/local/bin/ocunit2junit

cleanf	:
		$(RM) build/ test-reports/ *~ '#*#'

build	: 	
		xcodebuild -project DailyNews.xcodeproj -target "DailyNewsTests" -configuration Release clean  build
	##xcodebuild -target "DailyNews" -configuration Release
	BUILD_DIR="build" BUILD_STYLE="Release"

re 	: 	all

old_all	:
	make clean
	xcodebuild -project DubizzleHorizontal.xcodeproj -target "DubizzleHorizontal" -configuration Release clean  build
	##xcodebuild -target "DubizzleHorizontal" -configuration Release
	BUILD_DIR="build" BUILD_STYLE="Release"

old_test	:
	#GHUNIT_CLI=1 
	xcodebuild -project DubizzleHorizontal.xcodeproj -target DubizzleHorizontalTests -configuration debug clean -arch "armv7s" -sdk iphonesimulator build