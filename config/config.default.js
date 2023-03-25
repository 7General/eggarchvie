/* eslint valid-jsdoc: "off" */

'use strict';

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = exports = {};

  // config.openai = {
  //   apiKey: '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', // 替换为您的 OpenAI API 密钥
  // };

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1640166847272_2584';

  // add your middleware config here
  config.middleware = [];

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };

  config.security = {
    csrf: {
      enable: false,
    },
  };

  // config.view = {
  //   mapping : {
  //     ".html":"ejs"
  //   }
  // };
  config.view = {
    defaultViewEngine: 'nunjucks',
    mapping: {
      '.tpl': 'nunjucks',
    },
  };

  return {
    ...config,
    ...userConfig,
  };
};
