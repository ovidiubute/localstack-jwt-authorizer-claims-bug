Request:

```sh
curl https://22e14ac2.execute-api.localhost.localstack.cloud:4566/localstack/v1/user -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlRibHBLLVh1MEpoUHdwYk1OZFIyVSJ9.eyJpc3MiOiJodHRwczovL2Rldi1scGpyankxemx4MzM3ZGlsLmV1LmF1dGgwLmNvbS8iLCJzdWIiOiJjM1dYUHliSERoNFNRMkppVjQwcWxpakV6eE5xRFczbUBjbGllbnRzIiwiYXVkIjoiaHR0cHM6Ly9mYWJyaWMtc3R1ZGlvLWF1dGhvcml6ZXIudGVzdCIsImlhdCI6MTcxNzQ5OTQ4MSwiZXhwIjoxNzE4MTA0MjgxLCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMiLCJhenAiOiJjM1dYUHliSERoNFNRMkppVjQwcWxpakV6eE5xRFczbSJ9.Br6o0Z0YBMnjFDXz4Dn6H0BUorAnWVg76eOHSOOJMPK7VijsZK2MgMTShrPT-tosIfKcD13zrxwKU0QgLFUqzCce5K6tVFFtpUkCQOHhThaFt3KdOVNX0Y0Qe9bJ7Qmar6o1wEE1tHdZIX685ElWSeWEFCYfLFQx7-hbij-bXC6BKmyojvB0aGszOMfqusCVHlgC75fwFO_Zw1ggN-L6UJIqmjS_KLxLLU6KBgHJUP3h8oK98VMbkJvQOMA4zeNwKNxjTWWPUytuDr6Hu1jg6ONc3mj13TKdgruBJWHZjmc5AM0fmNboCnLooFQKYmHkMTD0dsjfmUGR9k29mUgXTw"
```

Response:

```
Decoded JWT: {"claims":null,"scopes":null}
```

Take the same JWT and use https://jwt.io debugger to see claims, you will see them:

```json
{
  "iss": "https://dev-lpjrjy1zlx337dil.eu.auth0.com/",
  "sub": "c3WXPybHDh4SQ2JiV40qlijEzxNqDW3m@clients",
  "aud": "https://fabric-studio-authorizer.test",
  "iat": 1717499481,
  "exp": 1718104281,
  "gty": "client-credentials",
  "azp": "c3WXPybHDh4SQ2JiV40qlijEzxNqDW3m"
}
```
