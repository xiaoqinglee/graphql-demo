export PATH="$PATH:$HOME/Library/Application Support/JetBrains/WebStorm2022.3/node/node-v16.16.0-darwin-x64/bin"

#➜  graphql-demo node --version
#v16.16.0
#➜  graphql-demo npm --version
#8.11.0
#➜  graphql-demo

npm init
npm install graphql --save

# https://graphql.org/graphql-js/
node server.js

npm cache clean --force
npm install express express-graphql graphql --save --legacy-peer-deps

# https://graphql.org/graphql-js/running-an-express-graphql-server/
node server.js

访问 http://localhost:4000/graphql
打开浏览器 debugger, 查看底层的网络请求.
