@echo off
::��������ڴ棬���ڴ˴�����

::��С�ڴ�
set MiniRAM=6g
::����ڴ�
set MaxRAM=6g
::����˺��ģ�ͨ�������������ģ���������Ҫ��������˺���
set Core=CatServer-6eb82ffe-universal.jar

echo ���棬��ȷ����� Java 8 �Ƿ��Ѱ�װ�����δ��װ�����޷�������������
timeout /t 3

:START

echo ���ڿ���..
title SNP Server - ����ڴ�: %MaxRAM% - ��С�ڴ�: %MiniRAM%

::zh_CN: G1GC ������������Ӽ������Ż�����ʹ�� ParallelGC ����
java -server -Xmx%MaxRAM% -Xms%MiniRAM% -XX:+UnlockExperimentalVMOptions -XX:+AggressiveOpts -XX:+UseCompressedClassPointers -XX:+ParallelRefProcEnabled -XX:+DisableExplicitGC -XX:+UseCompressedOops -Dsun.rmi.dgc.server.gcInterval=3600000 -XX:+ExplicitGCInvokesConcurrent -XX:+UseG1GC -XX:G1NewSizePercent=40 -XX:G1MaxNewSizePercent=70 -XX:G1MixedGCLiveThresholdPercent=35 -XX:MaxGCPauseMillis=100 -XX:TargetSurvivorRatio=90 -XX:+AlwaysPreTouch -XX:+UseStringDeduplication -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -XX:-OmitStackTraceInFastThrow -XX:+OptimizeStringConcat -XX:+UseAdaptiveGCBoundary -XX:NewRatio=3 -Dfml.readTimeout=90 -XX:+UseFastAccessorMethods -Dusing.aikars.flags=mcflags.emc.gs -Dfml.queryResult=confirm -jar %Core% -nogui

::zh_CN: ParallelGC ����
::java -server -Xmx%MaxRAM% -Xms%MiniRAM% -XX:+AggressiveOpts -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSConcurrentMTEnabled -XX:ParallelGCThreads=8 -Dsun.rmi.dgc.server.gcInterval=3600000 -XX:+UnlockExperimentalVMOptions -XX:+ExplicitGCInvokesConcurrent -XX:MaxGCPauseMillis=50 -XX:+AlwaysPreTouch -XX:+UseStringDeduplication -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -XX:-OmitStackTraceInFastThrow -XX:+OptimizeStringConcat -XX:+UseAdaptiveGCBoundary -XX:NewRatio=3 -Dfml.readTimeout=90 -Dfml.queryResult=confirm -XX:+UseFastAccessorMethods -jar %Core% -nogui

::zh_CN: OpenJ9 ��ʹ�ô˲���
::java -server -Xmx%MaxRAM% -Xms%MiniRAM% -XX:+AggressiveOpts -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSConcurrentMTEnabled -XX:ParallelGCThreads=8 -Dsun.rmi.dgc.server.gcInterval=3600000 -XX:+UnlockExperimentalVMOptions -XX:+ExplicitGCInvokesConcurrent -XX:MaxGCPauseMillis=50 -XX:+AlwaysPreTouch -XX:+UseStringDeduplication -XX:-OmitStackTraceInFastThrow -XX:+OptimizeStringConcat -XX:+UseAdaptiveGCBoundary -XX:NewRatio=3 -XX:+UseFastAccessorMethods -Xincgc -Dfml.readTimeout=90 -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -Dfml.queryResult=confirm -jar %Core% -nogui

echo �������Ѿ�ֹͣ.
title SNP Server - ���������ڵȴ�

:STOP
echo ���ڵȴ�..
timeout /t 5

:GO
goto START