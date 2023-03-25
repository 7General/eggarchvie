'use strict';
const { Controller } = require('egg');
const axios = require('axios');

class ChatGPTController extends Controller {

  async index() {
    const { ctx } = this;
    // const { message } = ctx.request.body;


    const url = 'https://api.openai.com/v1/chat/completions';

    const data = {
      message: [
        {
          role: 'user',
          content: 'say  i love you',
        },
      ],
    };
    const response = await axios.post(url, data, {
      headers: {
        'Content-Type': 'application/json',
        Authorization: 'Bearer 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',
      },
    });
    console.log(response);
    // const response = await axios.post('https://api.chatgpt.com/query', {
    //   context: '',
    //   question: 'hello',
    //   model: 'chatgpt',
    //   temperature: 0.7,
    //   max_tokens: 100,
    //   n: 1,
    //   stop: 'stop',
    // });
    // axios.post('https://api.chatgpt.com/question', {
    //   question: '你好吗？',
    // })
    //   .then(function(response) {
    //     console.log(response.data);
    //   })
    //   .catch(function(error) {
    //     console.log(error);
    //   });
    /**
     * curl https://api.openai.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer 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" \
  -d '{
     "model": "gpt-3.5-turbo",
     "messages": [{"role": "user", "content": "Say this is a test!"}],
     "temperature": 0.7
   }'
     */
    // axios.get('https://api.chatgpt.com/question')
    //   .then(function(response) {
    //     console.log(response.data);
    //   })
    //   .catch(function(error) {
    //     console.log(error);
    //   });


    ctx.body = {
      message: 'dddd',
    };
  }
}

module.exports = ChatGPTController;

