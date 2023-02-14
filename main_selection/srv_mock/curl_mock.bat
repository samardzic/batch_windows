
@ECHO OFF
ECHO Congratulations! Your first batch file executed successfully.

curl -v -H"Content-Type:application/json" -d "{"email":"frog@example.com","password": "fishfish"}" --max-time 150 "http://localhost:8000/lookup/v1"
::curl -v --ipv4 -H "Content-Type:application/json" -d "{"email":"frog@example.com","password": "fishfish"}" --max-time 150 "http://127.0.0.1:9005/new"
