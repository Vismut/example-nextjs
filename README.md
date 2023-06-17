# nextjs

Команда для работы в локальном кластере
```
werf converge --repo registry.example.com:80/nextjs --dev=true --env local --namespace='templates' \
--release='nextjs' --config="werf_local.yaml" --dev
```