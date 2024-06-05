Request:

```sh
curl https://22e14ac2.execute-api.localhost.localstack.cloud:4566/localstack/v1/user -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlRibHBLLVh1MEpoUHdwYk1OZFIyVSJ9.eyJpc3MiOiJodHRwczovL2Rldi1scGpyankxemx4MzM3ZGlsLmV1LmF1dGgwLmNvbS8iLCJzdWIiOiJjM1dYUHliSERoNFNRMkppVjQwcWxpakV6eE5xRFczbUBjbGllbnRzIiwiYXVkIjoiaHR0cHM6Ly9mYWJyaWMtc3R1ZGlvLWF1dGhvcml6ZXIudGVzdCIsImlhdCI6MTcxNzU4NTM5OSwiZXhwIjoxNzE4MTkwMTk5LCJndHkiOiJjbGllbnQtY3JlZGVudGlhbHMiLCJhenAiOiJjM1dYUHliSERoNFNRMkppVjQwcWxpakV6eE5xRFczbSJ9.W1a3tf0-XsO3khJv0Rp738rbLqSVW22c9_W65dPIK6jlbUucLt6Btde44TaITt8G4ZXjSMPqDXfe8S6jeP1GIEsxrkK2m7y7YFfEw4gAxuol8E__4XKWOJR3MASr1cel852igOUuyNdeODHj1WBj4sFcUhbfcTFW225es5n_SOf02eeMlQodFqYPxmB3ExOgxOn1v3YjZQQp4_vzVMzMQ01LvKLUT5ob8UWwrwjFKz0qnAjTfbB3lc0RnDyieO0lyYk0xyxXYz0Ct0xsZJ6r8tRmAjFSrdeXzgmZZ3-KXS5dTyB4sUk-7XTp-iMhV8kz6J97LGgkGbBupGrojHbrBA"
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
