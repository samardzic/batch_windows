:: ==================================================================================
:: NAME     : Jenkins Node runner
:: ==================================================================================
@echo off

:: Path to the specific Java folder
set JAVA_BIN=C:\Program Files\Java\jdk_17\bin

:: Name of the *.jar file used to connect to Jenkins Master node
:: set JAR_FILE_NAME=NHD2322W_main_agent.jar
set JAR_FILE_NAME=agent.jar

:: Name of the node on the server (master) Jenkins instance
set NODE_NAME=NHD2322W_windows_node

:: Path to the folder where *.jar file is located
set NODE_FOLDER=D:\Jenkins\agents\NHD2322W_windows_node

:: URL to the Jenkins Master server
set AGENT_URL=http://nhl2283w:9000/

:: Secret used as verification to connect to Jenkins Master
set AGENT_SECRET=8799a9f1d9b50b9542143d0295c4cd15710ba981562215659d171f7a26f12df2

:: Jenkins work directory on client Jenkins instance
set AGENT_WORK_DIR=8799a9f1d9b50b9542143d0295c4cd15710ba981562215659d171f7a26f12df2

:: EXAMPLE 
:: java -jar agent.jar 
:: -url http://nhl2283w:9000/ 
:: -secret 8799a9f1d9b50b9542143d0295c4cd15710ba981562215659d171f7a26f12df2 
:: -name "NHD2322W_windows_node" 
:: -webSocket 
:: -workDir "D:\Jenkins"



:: Starting JENKINS node
:: /************************************************************************************/
echo.
ECHO ===== Starting JENKINS Node %NODE_NAME% =====
echo.

call d:

cd %NODE_FOLDER%

ECHO --- Jenkins node %NODE_NAME% run ---
:: Working from PowerShell
:: call %JAVA_BIN%\java -jar %JAR_FILE_NAME% -url %AGENT_URL% -secret %AGENT_SECRET% -name "%NODE_NAME%" -webSocket -workDir "D:\Jenkins"

:: Working from CMD with shortcut
:: cmd /c ""%JAVA_BIN%\java" -jar %JAR_FILE_NAME% -url %AGENT_URL% -secret %AGENT_SECRET% -name "%NODE_NAME%" -webSocket -workDir %AGENT_WORK_DIR%"
cmd.exe /c start /min cmd /c ""%JAVA_BIN%\java" -jar %JAR_FILE_NAME% -url %AGENT_URL% -secret %AGENT_SECRET% -name "%NODE_NAME%" -webSocket -workDir %AGENT_WORK_DIR%"


echo.
:: /************************************************************************************/


:: Agent NHD2322W_windows_node
:: Main node for execution of jobs from uia66114
:: 
:: Run from agent command line: (Unix) 
:: -----------------------------------
:: curl -sO http://nhl2283w:9000/jnlpJars/agent.jar
:: java -jar agent.jar -url http://nhl2283w:9000/ -secret 8799a9f1d9b50b9542143d0295c4cd15710ba981562215659d171f7a26f12df2 -name "NHD2322W_windows_node" -webSocket -workDir "D:\Jenkins"
:: 
:: 
:: Run from agent command line: (Windows) 
:: ---------------------------------------
:: curl.exe -sO http://nhl2283w:9000/jnlpJars/agent.jar
:: java -jar agent.jar -url http://nhl2283w:9000/ -secret 8799a9f1d9b50b9542143d0295c4cd15710ba981562215659d171f7a26f12df2 -name "NHD2322W_windows_node" -webSocket -workDir "D:\Jenkins"
:: 
:: 
:: Or run from agent command line, with the secret stored in a file: (Unix) 
:: -------------------------------------------------------------------------
:: echo 8799a9f1d9b50b9542143d0295c4cd15710ba981562215659d171f7a26f12df2 > secret-file
:: curl -sO http://nhl2283w:9000/jnlpJars/agent.jar
:: java -jar agent.jar -url http://nhl2283w:9000/ -secret @secret-file -name "NHD2322W_windows_node" -webSocket -workDir "D:\Jenkins"
:: 
:: 
:: Or run from agent command line, with the secret stored in a file: (Windows) 
:: ----------------------------------------------------------------------------
:: echo 8799a9f1d9b50b9542143d0295c4cd15710ba981562215659d171f7a26f12df2> secret-file
:: curl.exe -sO http://nhl2283w:9000/jnlpJars/agent.jar
:: java -jar agent.jar -url http://nhl2283w:9000/ -secret @secret-file -name "NHD2322W_windows_node" -webSocket -workDir "D:\Jenkins"
:: 
:: 
:: If you prefer to use TCP instead of WebSockets, remove the -webSocket option. Run java -jar agent.jar -help for more.
:: Note: PowerShell users must use curl.exe instead of curl because curl is a default PowerShell cmdlet alias for Invoke-WebRequest.