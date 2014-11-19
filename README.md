cfapi-json-gateway
==================

JSON Gateway for Coldfusion Admin API

## IMPORTANT

Do not use it in production, big security hole !!

## Usage

```
curl 'http://HOST/cfapi-json-gateway/Gateway.cfc?wsdl=&method=callAPI&apiComponent=debugging&apiMethod=setDebugProperty&apiArguments=\{%20%22propertyName%22:%20%22enableRobustExceptions%22,%20%22propertyValue%22:%20%22true%22%20\}' \
  -H 'X-CF-AdminPassword: Adm1n$'
```


