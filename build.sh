#!/bin/bash

set -x
env
uname -a

npm config set unsafe-perm true
npm install -g pkg
npm install "node-red@$NODERED_VERSION"
node -e "const data = require('./node_modules/node-red/package.json'); data.pkg = { assets: ['./**/*'] }; data.dependencies['node-red-contrib-modbus'] = '4.1.3'; require('fs').writeFileSync('new-package.json', JSON.stringify(data, null, ' '));"
cp new-package.json node_modules/node-red/package.json
(
  cd node_modules/node-red || exit 1
  npm install --production
  pkg \
    --targets "$TARGET" \
    --out-path ../../release --public .
)
