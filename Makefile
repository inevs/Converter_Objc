
default: test
	
test:
	xcodebuild -workspace Converter.xcworkspace -scheme Converter -sdk iphonesimulator8.0 test
