db = db.getSiblingDB("backendchat_chat");

db.createCollection('messages');
db.messages.insertOne({
    content: 'Welcome to BackendChat!',
    sender: 'System',
    timestamp: new Date()
});
