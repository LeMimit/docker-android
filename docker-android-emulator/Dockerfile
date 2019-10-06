FROM alvrme/alpine-android:android-29


RUN apk add --no-cache libx11-dev
RUN apk add --no-cache libpulse
RUN apk add --no-cache mesa-gl
RUN apk add --no-cache nss
RUN apk add --no-cache fontconfig
RUN apk add --no-cache libxcomposite
RUN apk add --no-cache libxcursor
RUN apk add --no-cache libxi
RUN ${ANDROID_HOME}/tools/bin/sdkmanager "emulator" "system-images;android-21;google_apis;x86_64"
RUN ${ANDROID_HOME}/tools/bin/sdkmanager --update

##################
# Set mandatory environment variables
##################
#ENV ANDROID_EMULATOR_FORCE_32BIT=true
ENV ANDROID_SDK_HOME=/root/.android/ 

COPY ui-tests-on-emulator.sh /usr/bin/ui-tests-on-emulator
COPY run-ui-tests.sh /usr/bin/run-ui-tests
COPY kill-running-emulators.sh /usr/bin/kill-running-emulators
COPY wait-for-emulator.sh /usr/bin/wait-for-emulator
COPY unlock-emulator-screen.sh /usr/bin/unlock-emulator-screen
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["ui-tests-on-emulator"]
