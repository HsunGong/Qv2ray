export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"

cmake -DQV2RAY_QT6=ON -DQV2RAY_AUTO_DEPLOY=OFF -DCMAKE_BUILD_TYPE=Release -DQV2RAY_DEFAULT_VASSETS_PATH=/opt/homebrew/etc/v2ray -DQV2RAY_DEFAULT_VCORE_PATH=/opt/homebrew/bin/v2ray ..
make all -j8

mkdir qv2ray.app/Contents/Resources/plugins/
#
cp libQvPlugin-BuiltinProtocolSupport.so qv2ray.app/Contents/Resources/plugins/libQvPlugin-BuiltinProtocolSupport.dylib
cp libQvPlugin-BuiltinSubscriptionSupport.so qv2ray.app/Contents/Resources/plugins/libQvPlugin-BuiltinSubscriptionSupport.dylib


cd Qv2ray-Trojan # c++
cmake -DCMAKE_BUILD_TYPE=Release -DOPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3 -DOPENSSL_LIBRARIES=/opt/homebrew/opt/openssl@3/lib -DBoost_USE_STATIC_LIBS=ON -DOPENSSL_USE_STATIC_LIBS=ON -DQVPLUGIN_USE_QT6=ON ..
make all -j8
#cp libQvPlugin-Trojan.so qv2ray.app/Contents/Resources/plugins/libQvPlugin-BuiltinProtocolSupport.dylib
cp libQvPlugin-Trojan.so ../../Qv2ray/build/qv2ray.app/Contents/Resources/plugins/libQvPlugin-Trojan.dylib
