BUILD 		:= xctool

TEST		:= test

RM		:= rm -rf

PROJNAMEFLAGS 	+= -project DailyNews.xcodeproj

TARGETFLAGS	+= -target DailyNews

SCHEMEFLAGS	+= -scheme DailyNews

CONFIGFLAGS	+= -configuration Debug

ARCHFLAGS	+= -arch "armv7s"

SDKFLAGS	+= -sdk iphonesimulator

OPTIONSFLAGS	+= "TEST_AFTER_BUILD=YES ONLY_ACTIVE_ARCH=NO"

CLEANFLAGS	+= clean 

BUILDFLAGS	+= build 

clean	:
		$(RM) build/ test-reports/ *~ '#*#'

all	 :	clean
		$(RM) build test-reports
		$(BUILD) $(PROJNAMEFLAGS) $(SCHEMEFLAGS) $(SDKFLAGS) $(CONFIGFLAGS) $(OPTIONSFLAGS) $(CLEANFLAGS) $(BUILDFLAGS)

test	:	clean
		$(RM) build test-reports
		$(BUILD) $(TEST) $(PROJNAMEFLAGS) $(SCHEMEFLAGS) $(SDKFLAGS) $(CONFIGFLAGS) $(OPTIONSFLAGS) $(CLEANFLAGS) $(BUILDFLAGS)

re 	: 	all
