@echo off

set ARGS=

:setupArgs
if ""%1""=="""" goto doneStart
set ARGS=%ARGS% "%1"
shift
goto setupArgs

:doneStart

java -server -Xss3355443200000M -Xms1024M -Xmx30000M -cp lib\graph.jar;lib\spinja.jar;build\jar\ndfs.jar driver.Main %ARGS%
