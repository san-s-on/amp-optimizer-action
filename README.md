# AMP Optimizer Action ⚡

GitHub Action to optimize AMP HTML files.

It uses AMP Transformer GoLang library and recursively searchs for files to optimize. Designed for static web generator pipelines.

## Usage

Add the following step to your workflow:

```
    - name: Optimize AMP
      uses: asurbernardo/amp-optimizer-action@v0.1.0
      with:
        root: 'public'
```

Full working example with Hugo:

```
name: Deploy blog
on:
  push:
    branches:
    - master

jobs:
  build-deploy:
    runs-on: ubuntu-latest
    steps:

    - name: Pull source
      uses: actions/checkout@master
      with:
        submodules: true

    - name: Update submodules to latests master
      run: git submodule foreach git pull origin master

    - name: Setup Hugo
      uses: peaceiris/actions-hugo@v2.2.2
      with:
        hugo-version: '0.58.3'
        extended: true

    - name: Build
      run: hugo -t amperage --gc --minify

    - name: Optimize AMP
      uses: asurbernardo/amp-optimizer-action@v0.1.0
      with:
        root: 'public'

    - name: Deploy script
      uses: peaceiris/actions-gh-pages@v2.5.0
      env:
        ACTIONS_DEPLOY_KEY: ${{ secrets.ACTIONS_DEPLOY_KEY }}
        EXTERNAL_REPOSITORY: asurbernardo/asurbernardo.github.io
        PUBLISH_BRANCH: master
        PUBLISH_DIR: ./public
```