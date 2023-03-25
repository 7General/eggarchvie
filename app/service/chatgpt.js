'use strict';

const Service = require('egg').Service;
// const chatgpt = require('chatgpt');

class ChatgptService extends Service {
  async chat(query) {
    // const response = await chatgpt.chat(query);
    return {};
  }
}

module.exports = ChatgptService;
