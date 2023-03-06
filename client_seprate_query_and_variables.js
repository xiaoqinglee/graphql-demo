var dice = 3;
var sides = 6;
var query = `query RollDice($dice: Int!, $sides: Int) {
    rollDice(numDice: $dice, numSides: $sides)
}`;

var body = JSON.stringify({
    query,
    variables: { dice, sides },
});
console.assert(body === `{"query":"query RollDice($dice: Int!, $sides: Int) {\\n    rollDice(numDice: $dice, numSides: $sides)\\n}","variables":{"dice":3,"sides":6}}`);

fetch('/graphql', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
    },
    body: body,
})
    .then(r => r.json())
    .then(data => console.log('data returned:', data));

//================等同于================

fetch('/graphql', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
    },
    body: `{"query":"{\\n    rollDice(numDice:3, numSides:6)\\n}","variables":null}`})
    .then(r => r.json())
    .then(data => console.log('data returned:', data));

//================等同于================

// 在 graphiql 界面输入然后点击发送
// {
//     rollDice(numDice:3, numSides:6)
// }

