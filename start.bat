@echo off
::如需更改内存，请在此处更改

::最小内存
set MiniRAM=6g
::最大内存
set MaxRAM=6g
::服务端核心，通常情况下无需更改，除非你需要更换服务端核心
set Core=CatServer-6eb82ffe-universal.jar

echo 警告，请确保你的 Java 8 是否已安装，如果未安装，则无法启动服务器！
timeout /t 3

:START

echo 正在开启..
title SNP Server - 最大内存: %MaxRAM% - 最小内存: %MiniRAM%

::zh_CN: G1GC 参数，如需更加激进的优化，请使用 ParallelGC 参数
java -server -Xmx%MaxRAM% -Xms%MiniRAM% -XX:+UnlockExperimentalVMOptions -XX:+AggressiveOpts -XX:+UseCompressedClassPointers -XX:+ParallelRefProcEnabled -XX:+DisableExplicitGC -XX:+UseCompressedOops -Dsun.rmi.dgc.server.gcInterval=3600000 -XX:+ExplicitGCInvokesConcurrent -XX:+UseG1GC -XX:G1NewSizePercent=40 -XX:G1MaxNewSizePercent=70 -XX:G1MixedGCLiveThresholdPercent=35 -XX:MaxGCPauseMillis=100 -XX:TargetSurvivorRatio=90 -XX:+AlwaysPreTouch -XX:+UseStringDeduplication -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -XX:-OmitStackTraceInFastThrow -XX:+OptimizeStringConcat -XX:+UseAdaptiveGCBoundary -XX:NewRatio=3 -Dfml.readTimeout=90 -XX:+UseFastAccessorMethods -Dusing.aikars.flags=mcflags.emc.gs -Dfml.queryResult=confirm -jar %Core% -nogui

::zh_CN: ParallelGC 参数
::java -server -Xmx%MaxRAM% -Xms%MiniRAM% -XX:+AggressiveOpts -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSConcurrentMTEnabled -XX:ParallelGCThreads=8 -Dsun.rmi.dgc.server.gcInterval=3600000 -XX:+UnlockExperimentalVMOptions -XX:+ExplicitGCInvokesConcurrent -XX:MaxGCPauseMillis=50 -XX:+AlwaysPreTouch -XX:+UseStringDeduplication -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -XX:-OmitStackTraceInFastThrow -XX:+OptimizeStringConcat -XX:+UseAdaptiveGCBoundary -XX:NewRatio=3 -Dfml.readTimeout=90 -Dfml.queryResult=confirm -XX:+UseFastAccessorMethods -jar %Core% -nogui

::zh_CN: OpenJ9 请使用此参数
::java -server -Xmx%MaxRAM% -Xms%MiniRAM% -XX:+AggressiveOpts -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSConcurrentMTEnabled -XX:ParallelGCThreads=8 -Dsun.rmi.dgc.server.gcInterval=3600000 -XX:+UnlockExperimentalVMOptions -XX:+ExplicitGCInvokesConcurrent -XX:MaxGCPauseMillis=50 -XX:+AlwaysPreTouch -XX:+UseStringDeduplication -XX:-OmitStackTraceInFastThrow -XX:+OptimizeStringConcat -XX:+UseAdaptiveGCBoundary -XX:NewRatio=3 -XX:+UseFastAccessorMethods -Xincgc -Dfml.readTimeout=90 -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -Dfml.queryResult=confirm -jar %Core% -nogui

echo 服务器已经停止.
title SNP Server - 服务器正在等待

:STOP
echo 正在等待..
timeout /t 5

:GO
goto START