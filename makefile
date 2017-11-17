BUILD_NUM 				?= 1

build:
	$(info Creating the 'artefacts' folder...)
	rm -rf ./artefacts
	mkdir ./artefacts

	$(info Creating the build...)
	rm -rf ./app/build/outputs/apk/prod/release
	sed -i -e 's/versionCode .*$$/versionCode $(BUILD_NUM)/' ./app/build.gradle
	./gradlew assembleRelease

	$(info Copying the APK to the artefacts folder...)
	cp -r ./app/build/outputs/apk/prod/release/app-prod-release.apk ./artefacts/com.tuc.trueid.apk


.PHONY: build