
### Request Verbose
When testing more complex queries, we recommend setting the verbose mode to -v:

```
curl -v http://example.com/
```

### Response to file
By default, curl prints the response body to standard output. 
If necessary, you can provide an output option to save to a file:
```
curl -o out.json http://www.example.com/index.html
```


### GET Method

This is the default method when making HTTP calls using curl. In fact, the previously shown examples were simple GET calls. When starting a local service instance on port 8080, you can use this command to call GET:
```
curl -v http://localhost:8082/
```

### POST method

This method is used to send data to the received service. And for this, we use the data option. The easiest way to do this is by putting data in a command:

```curl -d 'id=1&name=create' http://localhost:8080/new```

- or you can transfer the file containing the request body to the data option as follows:

```curl -d @request.json -H "Content-Type: application/json" http://localhost:8080/new```

### PUT Method

This method is very similar to POST. 
But it is used when you need to send a new version of an existing resource. 
To do this, use the -X option. Without any mention of the type of the request method, curl uses GET by default. 
Therefore, we explicitly mention the type of method in the case of PUT:

```curl -d @request.json -H 'Content-Type: application/json' -X PUT http://localhost:8080/update```


### DELETE Method
Again, we indicate that we want to use DELETE using the -X option:

```curl -X DELETE http://localhost:8082/```

The main disadvantage and at the same time the main advantage of curl is the lack of a GUI.


