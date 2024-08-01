## Startup

```bash
npm install -g pnpm

npm run clone_repo
pnpm install

npm run dev
```

## Question

### Error: /bin/sh: ./scripts/generate_protos.sh: Permission denied

```bash
chmod -R 777 ./scripts
```

### Error: ./scripts/generate_protos.sh: line 18: protoc: command not found

```bash
brew install protobuf
```
