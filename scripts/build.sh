set -e 

bundle install
pod setup
pod install

xcodebuild -workspace DailyNews.xcworkspace -scheme DailyNews -configuration debug -sdk iphonesimulator clean build