// see https://github.com/mu-semtech/mu-javascript-template for more info

import { app, query, errorHandler } from 'mu';

console.log('hello world!');
app.get('/', function (req, res) {
    res.send('Hello mu-javascript-template');
});

app.use(errorHandler);
