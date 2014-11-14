default: compile

compile: 
	xcodebuild -workspace Converter.xcworkspace -scheme Converter -sdk iphonesimulator8.1 -derivedDataPath build clean build

test: 
	xcodebuild -workspace Converter.xcworkspace -scheme Converter -sdk iphonesimulator8.1 -derivedDataPath build -destination 'platform=iOS Simulator,name=iPhone 6' test

test_with_result: 
	xcodebuild -workspace Converter.xcworkspace -scheme Converter -sdk iphonesimulator8.1 -derivedDataPath build -destination 'platform=iOS Simulator,name=iPhone 6' test 2>&1 | ocunit2junit

deploy:
	ipa build -d build -s Converter
	ipa distribute:hockeyapp --token d334d30117d340e983d5407d85075684 -f build/Converter.ipa -d build/Converter.app.dSYM.zip -m "New version"

spec:
	frank build --scheme "Converter_UITest"
	cd Frank; cucumber
