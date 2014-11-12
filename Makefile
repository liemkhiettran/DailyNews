BUILDXCTOOL 	:= xctool

BUILDXCODE	:= xcodebuild

TEST		:= test

RM		:= rm -rf

PROJECTNAME	:= DailyNews

PROJNAMEFLAGS 	+= -project $(PROJECTNAME).xcodeproj

TARGETFLAGS	+= -target $(PROJECTNAME)

SCHEMEFLAGS	+= -scheme $(PROJECTNAME)

CONFIGFLAGS	+= -configuration Debug

ARCHFLAGS	+= -arch "armv7s"

SDKFLAGS	+= -sdk iphonesimulator

OPTIONSFLAGS	+= "TEST_AFTER_BUILD=YES ONLY_ACTIVE_ARCH=NO"

CLEANFLAGS	+= clean 

BUILDFLAGS	+= build 

clean		:
		$(RM) build/ test-reports/ *~ '#*#'

all	 	: clean
		$(RM) build test-reports
		$(BUILDXCODE) $(PROJNAMEFLAGS) $(SCHEMEFLAGS) $(SDKFLAGS) $(CONFIGFLAGS) $(OPTIONSFLAGS) $(CLEANFLAGS) $(BUILDFLAGS)

testxctool	: clean
		$(RM) build test-reports
		$(BUILDXCTOOL) $(TEST) $(PROJNAMEFLAGS) $(SCHEMEFLAGS) $(SDKFLAGS) $(CONFIGFLAGS) $(OPTIONSFLAGS) $(CLEANFLAGS) $(BUILDFLAGS)

testxcode	: clean
		$(RM) build test-reports
		$(BUILDXCODE) $(TEST) $(PROJNAMEFLAGS) $(SCHEMEFLAGS) $(SDKFLAGS) $(CONFIGFLAGS) $(OPTIONSFLAGS) $(CLEANFLAGS) $(BUILDFLAGS)

re 	: 	all
