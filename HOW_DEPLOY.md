# Como dar o build do web e dar o deploy

1.
No Godot, abra:
Projeto > Exportar > Web (Executável)
(baixe a importação do web se necessário)

2.
Export Path: "dict/index.html"
(crie a pasta dict no repo se necessário)

3.
Garanta essas configurações:
- Suporte a Extensões: []
- Suporte a Threads: []
- Para Desktop: [x]
- Para Mobile: [x]
- Ícone exportado: [x]
- Documento HTML personalizado: `res://web/custom_shell.html`
- Inclusão na Head: ""
- Política de Redimensionamento: Project
- Stretch do projeto: `canvas_items`
- Focar Canvas ao Iniciar: [x]
- Teclado virtual experimental: []
- Habilitado: []
- Garantir Headers: []
- Página Offline: ""
- PWA: []
- Orientação: Landscape

4.
Na janela de exportação, use **Exportar Projeto** (Release/produção), e não **Exportar Projeto para Depuração** (Debug/desenvolvimento).

O arquivo `dict/index.html` e os arquivos gerados ao lado dele (`.pck`,
`.wasm`, `.js` e ícones) devem ser enviados juntos. A itch.io hospeda esses arquivos estaticamente e executa o HTML dentro de um iframe.

Para testar com o Live Preview do VS Code, abra `dict/index.html`, e não `web/custom_shell.html`. Sempre exporte novamente antes do teste, pois o `index.pck` contém as cenas e imagens do projeto. O iframe da itch.io deve ter proporção 16:9 (por exemplo, 1280×720) e pode ser reduzido automaticamente em celulares na horizontal.

Ao clicar no menu inicial, o navegador solicita tela cheia e tenta travar a orientação em landscape. Isso depende da permissão do navegador e do iframe; não é possível forçar tela cheia automaticamente sem uma ação do usuário. O painel de debug (atalho F4) funciona somente em builds Debug e é ignorado na exportação Release.

5.
```bash
git checkout gh-pages
find . -maxdepth 1 -type f ! -name '.gitignore' -delete
git add .
git commit -m "Update"
git push origin gh-pages
```
