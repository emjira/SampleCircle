BUILD_NUM 				?= 1

# Creates the APK and adds it to the 'artefacts' folder.
build:
	$(info Creating the 'artefacts' folder...)
	rm -rf ./artefacts
	mkdir ./artefacts

	$(info Creating the build...)
	rm -rf ./app/build/outputs/apk/dev/debug
	sed -i -e 's/versionCode .*$$/versionCode $(BUILD_NUM)/' ./app/build.gradle
	./gradlew assembleDebug

	$(info Copying the APK to the artefacts folder...)
	cp -r ./app/build/outputs/apk/dev/debug/app-debug.apk ./artefacts/com.tuc.trueid.apk

.PHONY: build