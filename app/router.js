'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.home.index);
  router.post('/ios', controller.home.archiveiOS);
  router.post('/web', controller.home.archiveWEB);
  router.get('/download', controller.download.index);
  router.get('/json', controller.download.jsonData);
  router.post('/chat', controller.chatGPT.index);
  // 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
};
