FROM pritunl/archlinux
MAINTAINER farwayer <farwayer@gmail.com>

RUN printf "[multilib]\n"\
"Include=/etc/pacman.d/mirrorlist\n"\
"[mobile]\n"\
"Server=http://rusty-arch.s3.amazonaws.com/\$repo" >> /etc/pacman.conf
RUN pacman-key -r 7943315502A936D7 && pacman-key --lsign-key 7943315502A936D7
RUN pacman -Sy && pacman --noconfirm -S yarn npm python2 watchman jdk8-openjdk\
 fastlane make gcc\
 android-sdk android-platform android-support-repository\
 android-sdk-build-tools android-platform-23 android-sdk-build-tools-23.0.1\
 android-sdk-build-tools-23.0.3\
 && yes | pacman -Scc && rm -rf /usr/lib/ruby/gems/*/{cache,doc}\
 /usr/share/{doc,man,locale}
