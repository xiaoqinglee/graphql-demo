var express = require('express');
var { graphqlHTTP } = require('express-graphql');
var { buildSchema } = require('graphql');

// Construct a schema, using GraphQL schema language
// 自定义查询 type
var schema = buildSchema(`
  type RandomDie {
    numSides: Int!
    rollOnce: Int!
    roll(numRolls: Int!): [Int]
  }

  type Query {
    getDie(numSides: Int): RandomDie
  }
`);

// This class implements the RandomDie GraphQL type
// 使用 ES6 class instance 映射查询 type,
// 使用 class instance 的 field 或无参 method 作为查询 type 的同名无参 feild 的 resolver
// 使用 class instance 的 有参 method 作为查询 type 的同名有参 feild 的 resolver
class RandomDie {
    constructor(numSides) {
        this.numSides = numSides;
    }

    rollOnce() {
        return 1 + Math.floor(Math.random() * this.numSides);
    }

    roll({numRolls}) {
        var output = [];
        for (var i = 0; i < numRolls; i++) {
            output.push(this.rollOnce());
        }
        return output;
    }
}

// The root provides the top-level API endpoints
var root = {
    getDie: ({numSides}) => {
        return new RandomDie(numSides || 6);
    }
}

var app = express();
app.use('/graphql', graphqlHTTP({
    schema: schema,
    rootValue: root,
    graphiql: true,
}));
app.listen(4000);
console.log('Running a GraphQL API server at localhost:4000/graphql');

//try
// {
//   getDie(numSides:9){
//     numSides
//     rollOnce
//     roll(numRolls:3)
//   }
// }