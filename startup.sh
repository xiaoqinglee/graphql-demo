export PATH="$PATH:$HOME/Library/Application Support/JetBrains/WebStorm2022.3/node/node-v16.16.0-darwin-x64/bin"

#➜  graphql-demo node --version
#v16.16.0
#➜  graphql-demo npm --version
#8.11.0
#➜  graphql-demo

npm init
npm install graphql --save

# https://graphql.org/graphql-js/
node hello_world.js

npm cache clean --force
npm install express express-graphql graphql --save --legacy-peer-deps

# https://graphql.org/graphql-js/running-an-express-graphql-server/
node graphiql.js

访问 http://localhost:4000/graphql
打开浏览器 debugger, 查看底层的网络请求.


# Basic Types
# he GraphQL schema language supports the scalar types of String, Int, Float, Boolean, and ID,
# so you can use these directly in the schema you pass to buildSchema.
#
#By default, every type is nullable - it's legitimate to return null as any of the scalar types.
# Use an exclamation point to indicate a type cannot be nullable, so String! is a non-nullable string.
#
#To use a list type, surround the type in square brackets, so [Int] is a list of integers.
#
#Each of these types maps straightforwardly to JavaScript,
# so you can just return plain old JavaScript objects in APIs that return these types.
node basic_types.js

# Instead of a root-level resolver for the RandomDie type,
# we can instead use an ES6 class, where the resolvers are instance methods.
node object_types.js
