@echo off
::To change the memory, please change it here.

::Min RAM
set MiniRAM=6g
::Max RAM
set MaxRAM=6g
::The server-side core, which normally does not need to be changed unless you need to replace the server-side core.
set Core=CatServer-8d58cdb8-universal.jar

echo WARNING, make sure you have Java 8 installed, if not, you will not be able to start the server!
timeout /t 3

:START

echo Starting...
title SNP Server - Running - Max RAM: %MaxRAM% - Min RAM: %MiniRAM%

::G1GC parameter, for more aggressive optimization, use ParallelGC parameter
java -server -Xmx%MaxRAM% -Xms%MiniRAM% -XX:+UnlockExperimentalVMOptions -XX:+AggressiveOpts -XX:+UseCompressedClassPointers -XX:+ParallelRefProcEnabled -XX:+DisableExplicitGC -XX:+UseCompressedOops -Dsun.rmi.dgc.server.gcInterval=3600000 -XX:+ExplicitGCInvokesConcurrent -XX:+UseG1GC -XX:G1NewSizePercent=40 -XX:G1MaxNewSizePercent=70 -XX:G1MixedGCLiveThresholdPercent=35 -XX:MaxGCPauseMillis=100 -XX:TargetSurvivorRatio=90 -XX:+AlwaysPreTouch -XX:+UseStringDeduplication -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -XX:-OmitStackTraceInFastThrow -XX:+OptimizeStringConcat -XX:+UseAdaptiveGCBoundary -XX:NewRatio=3 -Dfml.readTimeout=90 -XX:+UseFastAccessorMethods -Dusing.aikars.flags=mcflags.emc.gs -Dfml.queryResult=confirm -jar %Core% -nogui

::ParallelGC parameter
::java -server -Xmx%MaxRAM% -Xms%MiniRAM% -XX:+AggressiveOpts -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSConcurrentMTEnabled -XX:ParallelGCThreads=8 -Dsun.rmi.dgc.server.gcInterval=3600000 -XX:+UnlockExperimentalVMOptions -XX:+ExplicitGCInvokesConcurrent -XX:MaxGCPauseMillis=50 -XX:+AlwaysPreTouch -XX:+UseStringDeduplication -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -XX:-OmitStackTraceInFastThrow -XX:+OptimizeStringConcat -XX:+UseAdaptiveGCBoundary -XX:NewRatio=3 -Dfml.readTimeout=90 -Dfml.queryResult=confirm -XX:+UseFastAccessorMethods -jar %Core% -nogui

::OpenJ9 Use this parameter
::java -server -Xmx%MaxRAM% -Xms%MiniRAM% -XX:+AggressiveOpts -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSConcurrentMTEnabled -XX:ParallelGCThreads=8 -Dsun.rmi.dgc.server.gcInterval=3600000 -XX:+UnlockExperimentalVMOptions -XX:+ExplicitGCInvokesConcurrent -XX:MaxGCPauseMillis=50 -XX:+AlwaysPreTouch -XX:+UseStringDeduplication -XX:-OmitStackTraceInFastThrow -XX:+OptimizeStringConcat -XX:+UseAdaptiveGCBoundary -XX:NewRatio=3 -XX:+UseFastAccessorMethods -Xincgc -Dfml.readTimeout=90 -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -Dfml.queryResult=confirm -jar %Core% -nogui

echo Server is stopped.
title SNP Server - Waiting

:STOP
echo Waiting...
timeout /t 5

:GO
goto START