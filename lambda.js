const { DynamoDB } = require('aws-sdk');

const endpoint = process.env.DYNAMODB_ENDPOINT || 'http://localhost:8000';

const options = {
  region: 'us-east-1',
  endpoint: endpoint
};

exports.handler = (event, context, callback) => {
  const { userId, message } = JSON.parse(event.body);

  const dynamo = new DynamoDB(options);
  const dbClient = new DynamoDB.DocumentClient({ service: dynamo });

  const timestamp = new Date().toISOString();

  const params = {
    TableName: 'MessageHistory',
    Item:{
      UserId: userId,
      Timestamp: timestamp,
      MessageText: message
    }
  };

  dbClient.put(params, (err, data) => {
    if (err) {
      callback(Error("Unable to add item. Error JSON:", JSON.stringify(err, null, 2)));
    } else {
      callback(null, 200);
    }
  });
};