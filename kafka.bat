cd %USERPROFILE%\apps\kafka
start bin\windows\zookeeper-server-start.bat config\zookeeper.properties
pause
start bin\windows\kafka-server-start.bat config\server.properties

cd bin\windows
pause
call kafka-topics.bat --zookeeper localhost:2181 --list
echo "bash: ~/git/kafka-streams-in-action/bin/create-topics.sh ~/apps/kafka localhost 2181"
pause
call kafka-topics.bat --zookeeper localhost:2181 --list
pause
call kafka-console-consumer.bat --bootstrap-server localhost:9092 --topic transactions --from-beginning
