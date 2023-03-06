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
#
# The GraphQL schema language supports the scalar types of String, Int, Float, Boolean, and ID,
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

# If you have an API endpoint that alters data, like inserting data into a database or altering data already in a database,
# you should make this endpoint a Mutation rather than a Query.
# This is as simple as making the API endpoint part of the top-level Mutation type instead of the top-level Query type.
#
# in many cases, you will find a number of different mutations that all accept the same input parameters.
# A common example is that creating an object in a database and updating an object in a database often take the same parameters.
# To make your schema simpler, you can use “input types” for this, by using the input keyword instead of the type keyword.
#
# Input types can't have fields that are other objects, only basic scalar types, list types, and other input types.
#
# To call a mutation, you must use the keyword mutation before your GraphQL query.
# To pass an input type, provide the data written as if it's a JSON object.
